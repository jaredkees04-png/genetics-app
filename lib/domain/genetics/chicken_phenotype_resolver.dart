import 'genetics_models.dart';
import 'phenotype_resolver.dart';

/// Turns a resolved genotype into a human-readable phenotype label for
/// chicken plumage loci. Epistasis/dominance interpretation is
/// species-specific and kept as code here rather than data - encoding a
/// fully general rule engine for it is not worth it for a first pass.
///
/// v1 covers three loci chosen to demonstrate all three inheritance
/// patterns the engine supports:
///   - E (Extended Black): a dominance series, autosomal
///   - B (Barring): simple dominant/recessive, Z-linked (sex-linked)
///   - Bl (Blue/Lavender dilution): incomplete dominance, autosomal
class ChickenPhenotypeResolver implements PhenotypeResolver {
  const ChickenPhenotypeResolver();

  static const _eLocusKey = 'E';
  static const _bLocusKey = 'B';
  static const _blLocusKey = 'Bl';

  /// Resolves a single locus's genotype to a short phenotype label.
  @override
  String resolveLocus(String locusKey, Genotype genotype) {
    switch (locusKey) {
      case _eLocusKey:
        return _resolveDominantSeries(genotype);
      case _bLocusKey:
        return _resolveBarring(genotype);
      case _blLocusKey:
        return _resolveBlueDilution(genotype);
      default:
        return genotype.label;
    }
  }

  /// Full-dominance series: the allele with the lowest [dominanceRank]
  /// present in the genotype determines the phenotype.
  String _resolveDominantSeries(Genotype genotype) {
    final winner = genotype.alleles.reduce(
      (a, b) => (a.dominanceRank ?? 999) <= (b.dominanceRank ?? 999) ? a : b,
    );
    return winner.name;
  }

  String _resolveBarring(Genotype genotype) {
    final hasBarring = genotype.alleles.any((a) => a.symbol == 'B');
    return hasBarring ? 'Barred' : 'Non-barred';
  }

  /// Incomplete dominance: three distinct phenotypes, none of which is a
  /// simple blend - Bl/Bl is Splash (not "more diluted" than Blue),
  /// bl+/bl+ is not diluted at all, and only the heterozygote is Blue.
  String _resolveBlueDilution(Genotype genotype) {
    if (genotype.isHemizygous) {
      return genotype.allele1.symbol == 'Bl' ? 'Splash' : genotype.allele1.name;
    }
    if (genotype.allele1.id == genotype.allele2!.id) {
      return genotype.allele1.symbol == 'Bl' ? 'Splash' : genotype.allele1.name;
    }
    return 'Blue'; // heterozygous Bl/bl+
  }

  /// Combines every resolved locus label into one description. v1 keeps
  /// this as a simple join - the three seeded loci don't strongly mask
  /// each other, so this is a reasonable first pass. A locus that truly
  /// epistatically hides another (e.g. dominant white) would need a
  /// smarter combiner when it's added.
  @override
  String describeOffspring(Map<String, Genotype> genotypesByLocusKey) {
    final parts = genotypesByLocusKey.entries
        .map((e) => resolveLocus(e.key, e.value))
        .toList();
    return parts.join(', ');
  }
}
