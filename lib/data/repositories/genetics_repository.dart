import 'dart:convert';

import 'package:drift/drift.dart';

import '../../domain/genetics/genetics_models.dart';
import '../database/app_database.dart';

/// Loads locus/allele/phenotype data and resolves an animal's genotype -
/// from known (tested) genotype rows first, falling back to an
/// unambiguous inference from an observed phenotype when genotype isn't
/// known. A locus stays unresolved (and is excluded from predictions)
/// when neither source gives a definite answer - this stays a plausible
/// filter, not a probability-weighted guess.
class GeneticsRepository {
  final AppDatabase db;
  const GeneticsRepository(this.db);

  SexDeterminationSystem parseSexSystem(String value) {
    switch (value) {
      case 'ZW':
        return SexDeterminationSystem.zw;
      case 'XY':
        return SexDeterminationSystem.xy;
      default:
        return SexDeterminationSystem.none;
    }
  }

  InheritancePattern _parseInheritancePattern(String value) {
    switch (value) {
      case 'incomplete_dominance':
        return InheritancePattern.incompleteDominance;
      case 'codominant':
        return InheritancePattern.codominant;
      default:
        return InheritancePattern.dominantSeries;
    }
  }

  Future<List<LocusInfo>> lociForSpecies(String speciesId) async {
    final locusRows = await (db.select(db.loci)
          ..where((t) => t.speciesId.equals(speciesId)))
        .get();
    final result = <LocusInfo>[];
    for (final locus in locusRows) {
      final alleleRows = await (db.select(db.alleles)
            ..where((t) => t.locusId.equals(locus.id)))
          .get();
      result.add(LocusInfo(
        id: locus.id,
        key: locus.key,
        name: locus.name,
        inheritancePattern: _parseInheritancePattern(locus.inheritancePattern),
        isSexLinked: locus.isSexLinked,
        alleles: alleleRows
            .map((a) => AlleleInfo(
                  id: a.id,
                  symbol: a.symbol,
                  name: a.name,
                  dominanceRank: a.dominanceRank,
                ))
            .toList(),
      ));
    }
    return result;
  }

  /// Resolves as many of [loci] as possible for one animal. Loci with no
  /// known or inferable genotype are simply absent from the result map.
  Future<Map<String, Genotype>> resolveGenotypesForAnimal({
    required String animalId,
    required AnimalSex animalSex,
    required List<LocusInfo> loci,
    required SexDeterminationSystem sexSystem,
  }) async {
    final alleleById = <String, AlleleInfo>{
      for (final locus in loci)
        for (final allele in locus.alleles) allele.id: allele,
    };
    final locusById = {for (final l in loci) l.id: l};

    final result = <String, Genotype>{};

    final knownRows = await (db.select(db.animalGenotypes)
          ..where((t) => t.animalId.equals(animalId)))
        .get();
    for (final row in knownRows) {
      final locus = locusById[row.locusId];
      final a1 = alleleById[row.allele1Id];
      if (locus == null || a1 == null) continue;
      final a2 = row.allele2Id == null ? null : alleleById[row.allele2Id!];
      result[locus.id] = Genotype(locusId: locus.id, allele1: a1, allele2: a2);
    }

    final remainingLoci =
        loci.where((l) => !result.containsKey(l.id)).toList();
    if (remainingLoci.isEmpty) return result;

    final traitRows = await (db.select(db.phenotypeTraits)
          ..where((t) =>
              t.relatedLocusId.isIn(remainingLoci.map((l) => l.id).toList())))
        .get();
    if (traitRows.isEmpty) return result;

    final traitIdToLocus = {
      for (final t in traitRows)
        if (t.relatedLocusId != null) t.id: locusById[t.relatedLocusId]!,
    };

    final observations = await (db.select(db.animalPhenotypeObservations)
          ..where((t) =>
              t.animalId.equals(animalId) &
              t.phenotypeTraitId.isIn(traitIdToLocus.keys.toList())))
        .get();

    // Expected allele-count for this animal at a sex-linked locus: 1
    // (hemizygous) if this animal is the heterogametic sex, else 2.
    bool expectsSingleAllele(LocusInfo locus) {
      if (!locus.isSexLinked) return false;
      if (sexSystem == SexDeterminationSystem.zw) {
        return animalSex == AnimalSex.female;
      }
      if (sexSystem == SexDeterminationSystem.xy) {
        return animalSex == AnimalSex.male;
      }
      return false;
    }

    for (final obs in observations) {
      if (obs.selectedOptionId == null) continue;
      final locus = traitIdToLocus[obs.phenotypeTraitId];
      if (locus == null) continue;

      final option = await (db.select(db.phenotypeTraitOptions)
            ..where((t) => t.id.equals(obs.selectedOptionId!)))
          .getSingleOrNull();
      final json = option?.plausibleGenotypesJson;
      if (json == null) continue;

      final decoded = (jsonDecode(json) as List)
          .map((combo) => (combo as List).cast<String>())
          .toList();
      final wantSingle = expectsSingleAllele(locus);
      final candidates = decoded
          .where((combo) => wantSingle ? combo.length == 1 : combo.length == 2)
          .toList();

      // Only auto-infer when unambiguous - exactly one plausible
      // genotype consistent with this animal's observed phenotype.
      if (candidates.length != 1) continue;
      final ids = candidates.first;
      final a1 = alleleById[ids[0]];
      if (a1 == null) continue;
      final a2 = ids.length > 1 ? alleleById[ids[1]] : null;
      if (ids.length > 1 && a2 == null) continue;

      result[locus.id] = Genotype(locusId: locus.id, allele1: a1, allele2: a2);
    }

    return result;
  }
}
