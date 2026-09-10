import 'genetics_models.dart';

/// One possible outcome of segregating a single locus, conditioned on
/// offspring sex where the locus is sex-linked.
///
/// [conditionalProbability] always sums to 1.0 across all outcomes that
/// share the same [sex] value (or, for an autosomal locus, across all
/// outcomes - `sex` is null and applies identically to every offspring).
class LocusOutcome {
  final Genotype genotype;
  final double conditionalProbability;

  /// null = autosomal, applies regardless of offspring sex.
  final AnimalSex? sex;

  const LocusOutcome({
    required this.genotype,
    required this.conditionalProbability,
    this.sex,
  });
}

/// One fully-resolved offspring outcome across every locus considered in
/// a prediction, for one offspring sex.
class OffspringOutcome {
  final AnimalSex sex;
  final Map<String, Genotype> genotypesByLocusId;
  final double probability;

  const OffspringOutcome({
    required this.sex,
    required this.genotypesByLocusId,
    required this.probability,
  });
}

/// The full result of predicting a pairing: every considered locus's
/// genotype-inheritance details, plus the combined offspring outcomes.
/// A locus is silently omitted from [outcomes] (and listed in
/// [skippedLoci]) when both parents' genotype could not be determined
/// (neither known-tested nor inferred from an observed phenotype).
class PairingPrediction {
  final List<OffspringOutcome> outcomes;
  final List<String> skippedLoci;

  const PairingPrediction({required this.outcomes, required this.skippedLoci});
}

/// Species-agnostic Mendelian segregation engine. Given two parent
/// genotypes at a locus, it computes the offspring genotype probability
/// distribution - respecting full-dominance series, incomplete
/// dominance/codominance (segregation math is identical for those; only
/// phenotype *display* differs, see ChickenPhenotypeResolver), and
/// sex-linkage under either a ZW or XY sex-determination system.
class GeneticsEngine {
  const GeneticsEngine();

  /// Segregates a single locus. [sireGenotype]/[damGenotype] may be null
  /// when genotype is unknown for that parent at this locus - the caller
  /// is expected to have already substituted an inferred genotype (from
  /// observed phenotype) where possible, or to skip the locus entirely.
  List<LocusOutcome> segregateLocus({
    required LocusInfo locus,
    required Genotype sireGenotype,
    required Genotype damGenotype,
    required SexDeterminationSystem sexSystem,
  }) {
    if (!locus.isSexLinked) {
      return _segregateAutosomal(sireGenotype, damGenotype);
    }
    return _segregateSexLinked(sireGenotype, damGenotype, sexSystem);
  }

  List<LocusOutcome> _segregateAutosomal(Genotype sire, Genotype dam) {
    // Each parent draws one of its distinct alleles uniformly at random
    // (a homozygous parent has only one distinct allele to draw, so its
    // single draw carries probability 1.0 instead of 0.5).
    final sireDraws = _uniqueAllelesWithProbability(sire);
    final damDraws = _uniqueAllelesWithProbability(dam);

    final combos = <String, LocusOutcome>{};
    for (final sireDraw in sireDraws) {
      for (final damDraw in damDraws) {
        final genotype =
            _orderedGenotype(sire.locusId, sireDraw.allele, damDraw.allele);
        final prob = sireDraw.probability * damDraw.probability;
        combos.update(
          genotype.label,
          (existing) => LocusOutcome(
            genotype: existing.genotype,
            conditionalProbability: existing.conditionalProbability + prob,
          ),
          ifAbsent: () =>
              LocusOutcome(genotype: genotype, conditionalProbability: prob),
        );
      }
    }
    return combos.values.toList();
  }

  List<_AlleleDraw> _uniqueAllelesWithProbability(Genotype genotype) {
    final unique = genotype.alleles.toSet().toList();
    final prob = 1.0 / unique.length;
    return unique.map((a) => _AlleleDraw(a, prob)).toList();
  }

  List<LocusOutcome> _segregateSexLinked(
    Genotype sire,
    Genotype dam,
    SexDeterminationSystem sexSystem,
  ) {
    if (sexSystem == SexDeterminationSystem.none) {
      throw ArgumentError(
        'Cannot segregate a sex-linked locus for a species with no sex '
        'determination system configured.',
      );
    }

    // homogametic parent has two allele copies to give (ZZ male in ZW,
    // XX female in XY); heterogametic parent is hemizygous and only
    // passes its single allele to offspring that share its own sex type.
    final sireIsHomogametic = sexSystem == SexDeterminationSystem.zw;
    final homogameticParent = sireIsHomogametic ? sire : dam;
    final heterogameticParent = sireIsHomogametic ? dam : sire;
    final homogameticSex = sireIsHomogametic ? AnimalSex.male : AnimalSex.female;
    final heterogameticSex =
        sireIsHomogametic ? AnimalSex.female : AnimalSex.male;

    final heteroAllele = heterogameticParent.allele1;
    final homoDraws = _uniqueAllelesWithProbability(homogameticParent);

    final outcomes = <LocusOutcome>[];

    // Offspring sharing the homogametic parent's sex: gets one of the
    // homogametic parent's two alleles, plus the heterogametic parent's
    // single allele (deterministic).
    for (final draw in homoDraws) {
      final genotype =
          _orderedGenotype(sire.locusId, draw.allele, heteroAllele);
      outcomes.add(LocusOutcome(
        genotype: genotype,
        conditionalProbability: draw.probability,
        sex: homogameticSex,
      ));
    }

    // Offspring sharing the heterogametic parent's sex: hemizygous,
    // gets only one of the homogametic parent's two alleles.
    for (final draw in homoDraws) {
      outcomes.add(LocusOutcome(
        genotype: Genotype(locusId: sire.locusId, allele1: draw.allele),
        conditionalProbability: draw.probability,
        sex: heterogameticSex,
      ));
    }

    return outcomes;
  }

  Genotype _orderedGenotype(String locusId, AlleleInfo a, AlleleInfo b) {
    // Canonicalize allele order (by id) so e.g. E/e+ and e+/E are treated
    // as the same combo when summing probabilities.
    final ordered = [a, b]..sort((x, y) => x.id.compareTo(y.id));
    return Genotype(locusId: locusId, allele1: ordered[0], allele2: ordered[1]);
  }

  /// Combines segregation outcomes across every locus that has a known
  /// (or inferred) genotype for both parents into a joint offspring
  /// probability distribution, split by sex.
  PairingPrediction predictPairing({
    required List<LocusInfo> loci,
    required Map<String, Genotype> sireGenotypesByLocusId,
    required Map<String, Genotype> damGenotypesByLocusId,
    required SexDeterminationSystem sexSystem,
  }) {
    final skipped = <String>[];
    final perLocusOutcomes = <LocusInfo, List<LocusOutcome>>{};

    for (final locus in loci) {
      final sireG = sireGenotypesByLocusId[locus.id];
      final damG = damGenotypesByLocusId[locus.id];
      if (sireG == null || damG == null) {
        skipped.add(locus.key);
        continue;
      }
      perLocusOutcomes[locus] = segregateLocus(
        locus: locus,
        sireGenotype: sireG,
        damGenotype: damG,
        sexSystem: sexSystem,
      );
    }

    final results = <OffspringOutcome>[];
    for (final sex in [AnimalSex.male, AnimalSex.female]) {
      final applicablePerLocus = <LocusInfo, List<LocusOutcome>>{};
      for (final entry in perLocusOutcomes.entries) {
        final forSex =
            entry.value.where((o) => o.sex == null || o.sex == sex).toList();
        applicablePerLocus[entry.key] = forSex;
      }
      final combined = _crossProduct(applicablePerLocus);
      for (final combo in combined) {
        results.add(OffspringOutcome(
          sex: sex,
          genotypesByLocusId: combo.genotypes,
          probability: 0.5 * combo.probability,
        ));
      }
    }

    return PairingPrediction(outcomes: results, skippedLoci: skipped);
  }

  List<_Combo> _crossProduct(Map<LocusInfo, List<LocusOutcome>> perLocus) {
    var accumulator = <_Combo>[
      _Combo(genotypes: {}, probability: 1.0),
    ];
    for (final entry in perLocus.entries) {
      final next = <_Combo>[];
      for (final acc in accumulator) {
        for (final outcome in entry.value) {
          next.add(_Combo(
            genotypes: {...acc.genotypes, entry.key.id: outcome.genotype},
            probability: acc.probability * outcome.conditionalProbability,
          ));
        }
      }
      accumulator = next;
    }
    return accumulator;
  }
}

class _Combo {
  final Map<String, Genotype> genotypes;
  final double probability;
  _Combo({required this.genotypes, required this.probability});
}

class _AlleleDraw {
  final AlleleInfo allele;
  final double probability;
  const _AlleleDraw(this.allele, this.probability);
}
