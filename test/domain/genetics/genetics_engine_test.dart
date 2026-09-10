import 'package:flutter_test/flutter_test.dart';
import 'package:genetics_app/domain/genetics/genetics_engine.dart';
import 'package:genetics_app/domain/genetics/genetics_models.dart';

void main() {
  const engine = GeneticsEngine();

  const alleleA = AlleleInfo(id: 'a1', symbol: 'A', name: 'A', dominanceRank: 1);
  const alleleB = AlleleInfo(id: 'a2', symbol: 'a', name: 'a', dominanceRank: 2);

  final autosomalLocus = LocusInfo(
    id: 'locus1',
    key: 'L1',
    name: 'Test Autosomal Locus',
    inheritancePattern: InheritancePattern.dominantSeries,
    isSexLinked: false,
    alleles: [alleleA, alleleB],
  );

  final sexLinkedLocus = LocusInfo(
    id: 'locus2',
    key: 'L2',
    name: 'Test Sex-Linked Locus',
    inheritancePattern: InheritancePattern.dominantSeries,
    isSexLinked: true,
    alleles: [alleleA, alleleB],
  );

  group('autosomal segregation', () {
    test('Aa x Aa gives classic 1:2:1 ratio', () {
      final sire = Genotype(locusId: 'locus1', allele1: alleleA, allele2: alleleB);
      final dam = Genotype(locusId: 'locus1', allele1: alleleA, allele2: alleleB);

      final outcomes = engine.segregateLocus(
        locus: autosomalLocus,
        sireGenotype: sire,
        damGenotype: dam,
        sexSystem: SexDeterminationSystem.zw,
      );

      final byLabel = {for (final o in outcomes) o.genotype.label: o.conditionalProbability};
      expect(outcomes.length, 3);
      expect(byLabel['A/A'], closeTo(0.25, 1e-9));
      expect(byLabel['A/a'], closeTo(0.5, 1e-9));
      expect(byLabel['a/a'], closeTo(0.25, 1e-9));
      expect(outcomes.fold<double>(0, (s, o) => s + o.conditionalProbability),
          closeTo(1.0, 1e-9));
      expect(outcomes.every((o) => o.sex == null), isTrue);
    });

    test('AA x aa is fully deterministic', () {
      final sire = Genotype(locusId: 'locus1', allele1: alleleA, allele2: alleleA);
      final dam = Genotype(locusId: 'locus1', allele1: alleleB, allele2: alleleB);

      final outcomes = engine.segregateLocus(
        locus: autosomalLocus,
        sireGenotype: sire,
        damGenotype: dam,
        sexSystem: SexDeterminationSystem.zw,
      );

      expect(outcomes.length, 1);
      expect(outcomes.single.genotype.label, 'A/a');
      expect(outcomes.single.conditionalProbability, closeTo(1.0, 1e-9));
    });
  });

  group('ZW sex-linked segregation', () {
    test('heterozygous sire x hemizygous dam splits by offspring sex', () {
      // Sire (ZZ, homogametic): A/a. Dam (ZW, homogametic-lacking /
      // hemizygous): A only.
      final sire = Genotype(locusId: 'locus2', allele1: alleleA, allele2: alleleB);
      final dam = Genotype(locusId: 'locus2', allele1: alleleA);

      final outcomes = engine.segregateLocus(
        locus: sexLinkedLocus,
        sireGenotype: sire,
        damGenotype: dam,
        sexSystem: SexDeterminationSystem.zw,
      );

      // Sons (homogametic sex in ZW) get one of sire's alleles + dam's
      // single allele: A/A or A/a, each 0.5 conditional-on-male.
      final sons = outcomes.where((o) => o.sex == AnimalSex.male).toList();
      expect(sons.length, 2);
      expect(sons.fold<double>(0, (s, o) => s + o.conditionalProbability),
          closeTo(1.0, 1e-9));

      // Daughters (heterogametic sex) are hemizygous, one of sire's
      // alleles only: A or a, each 0.5 conditional-on-female.
      final daughters = outcomes.where((o) => o.sex == AnimalSex.female).toList();
      expect(daughters.length, 2);
      expect(daughters.every((o) => o.genotype.isHemizygous), isTrue);
      expect(
          daughters.fold<double>(0, (s, o) => s + o.conditionalProbability),
          closeTo(1.0, 1e-9));
    });
  });

  group('predictPairing', () {
    test('combines loci and sums to 1.0 across all outcomes', () {
      final sireAuto =
          Genotype(locusId: 'locus1', allele1: alleleA, allele2: alleleB);
      final damAuto =
          Genotype(locusId: 'locus1', allele1: alleleA, allele2: alleleB);
      final sireSexLinked =
          Genotype(locusId: 'locus2', allele1: alleleA, allele2: alleleB);
      final damSexLinked = Genotype(locusId: 'locus2', allele1: alleleA);

      final prediction = engine.predictPairing(
        loci: [autosomalLocus, sexLinkedLocus],
        sireGenotypesByLocusId: {'locus1': sireAuto, 'locus2': sireSexLinked},
        damGenotypesByLocusId: {'locus1': damAuto, 'locus2': damSexLinked},
        sexSystem: SexDeterminationSystem.zw,
      );

      expect(prediction.skippedLoci, isEmpty);
      final total =
          prediction.outcomes.fold<double>(0, (s, o) => s + o.probability);
      expect(total, closeTo(1.0, 1e-9));
      expect(prediction.outcomes.every((o) => o.probability > 0), isTrue);
    });

    test('missing genotype for one parent skips that locus', () {
      final sireAuto =
          Genotype(locusId: 'locus1', allele1: alleleA, allele2: alleleB);

      final prediction = engine.predictPairing(
        loci: [autosomalLocus],
        sireGenotypesByLocusId: {'locus1': sireAuto},
        damGenotypesByLocusId: {},
        sexSystem: SexDeterminationSystem.zw,
      );

      expect(prediction.skippedLoci, ['L1']);
    });
  });
}
