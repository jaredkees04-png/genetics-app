/// Domain-layer models for the genetics engine. These are plain Dart
/// objects, independent of the drift row classes, so the engine has no
/// dependency on the database layer and can be unit tested in isolation.
library;

/// How a locus's alleles combine phenotypically. Does not affect
/// inheritance/segregation math (that's always "each parent contributes
/// one of its two alleles at random" for an autosomal locus) - only how a
/// resulting genotype is *displayed*.
enum InheritancePattern { dominantSeries, incompleteDominance, codominant }

/// Which chromosome pair determines sex, and therefore which sex is
/// heterogametic (carries only one copy of sex-linked loci).
/// Birds/some reptiles: ZW (females heterogametic).
/// Mammals: XY (males heterogametic).
enum SexDeterminationSystem { zw, xy, none }

SexDeterminationSystem parseSexDeterminationSystem(String value) {
  switch (value) {
    case 'ZW':
      return SexDeterminationSystem.zw;
    case 'XY':
      return SexDeterminationSystem.xy;
    default:
      return SexDeterminationSystem.none;
  }
}

enum AnimalSex { male, female, unknown }

class AlleleInfo {
  final String id;
  final String symbol;
  final String name;

  /// Lower rank = more dominant. Only meaningful for
  /// [InheritancePattern.dominantSeries] loci.
  final int? dominanceRank;

  const AlleleInfo({
    required this.id,
    required this.symbol,
    required this.name,
    this.dominanceRank,
  });

  @override
  String toString() => symbol;

  @override
  bool operator ==(Object other) => other is AlleleInfo && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

class LocusInfo {
  final String id;
  final String key;
  final String name;
  final InheritancePattern inheritancePattern;
  final bool isSexLinked;
  final List<AlleleInfo> alleles;

  const LocusInfo({
    required this.id,
    required this.key,
    required this.name,
    required this.inheritancePattern,
    required this.isSexLinked,
    required this.alleles,
  });
}

/// An animal's genotype at one locus. [allele2] is null for a hemizygous
/// genotype (e.g. a hen at a Z-linked locus in a ZW species).
class Genotype {
  final String locusId;
  final AlleleInfo allele1;
  final AlleleInfo? allele2;

  const Genotype({required this.locusId, required this.allele1, this.allele2});

  bool get isHemizygous => allele2 == null;

  List<AlleleInfo> get alleles =>
      allele2 == null ? [allele1] : [allele1, allele2!];

  String get label => allele2 == null
      ? allele1.symbol
      : '${allele1.symbol}/${allele2!.symbol}';

  @override
  String toString() => label;
}

class PhenotypeTraitOptionInfo {
  final String id;
  final String label;
  const PhenotypeTraitOptionInfo({required this.id, required this.label});
}

/// A visually-observable trait (e.g. "Plumage Pattern") plus its
/// pick-list of options, for UI display and for recording an observation
/// without a genotype test.
class PhenotypeTraitInfo {
  final String id;
  final String key;
  final String name;
  final String? relatedLocusId;
  final List<PhenotypeTraitOptionInfo> options;

  const PhenotypeTraitInfo({
    required this.id,
    required this.key,
    required this.name,
    this.relatedLocusId,
    required this.options,
  });
}
