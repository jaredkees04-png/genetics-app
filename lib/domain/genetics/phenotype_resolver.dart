import 'genetics_models.dart';

/// Turns a genotype into a display phenotype label. Implemented per
/// species because epistasis/dominance interpretation is genuinely
/// species-specific; [DefaultPhenotypeResolver] is the fallback for any
/// species without a dedicated resolver yet.
abstract class PhenotypeResolver {
  String resolveLocus(String locusKey, Genotype genotype);

  String describeOffspring(Map<String, Genotype> genotypesByLocusKey) {
    return genotypesByLocusKey.entries
        .map((e) => resolveLocus(e.key, e.value))
        .join(', ');
  }
}

/// Resolves any locus whose alleles all carry a [AlleleInfo.dominanceRank]
/// as a plain full-dominance series (lowest rank present wins) - correct
/// for any 'dominant_series' locus regardless of species, which covers
/// goat and cattle coat color as seeded. Falls back to the raw genotype
/// label (e.g. "Bl/bl+") for incomplete-dominance/codominant loci, which
/// need species-specific display logic - see ChickenPhenotypeResolver.
class DefaultPhenotypeResolver implements PhenotypeResolver {
  const DefaultPhenotypeResolver();

  @override
  String resolveLocus(String locusKey, Genotype genotype) {
    final alleles = genotype.alleles;
    if (alleles.every((a) => a.dominanceRank != null)) {
      final winner =
          alleles.reduce((a, b) => a.dominanceRank! <= b.dominanceRank! ? a : b);
      return winner.name;
    }
    return genotype.label;
  }

  @override
  String describeOffspring(Map<String, Genotype> genotypesByLocusKey) {
    return genotypesByLocusKey.entries
        .map((e) => resolveLocus(e.key, e.value))
        .join(', ');
  }
}
