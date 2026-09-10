import 'dart:convert';

import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/id_generator.dart';

/// Shared insert plumbing for a species' genetics seed data, so adding a
/// new species is just describing its loci/alleles/traits (see
/// ChickenGeneticsSeed/GoatGeneticsSeed/CattleGeneticsSeed) rather than
/// re-writing the same insert calls each time.
class SeedHelpers {
  final AppDatabase db;
  const SeedHelpers(this.db);

  Future<bool> speciesExists(String name) async {
    final existing = await (db.select(db.species)
          ..where((t) => t.name.equals(name)))
        .getSingleOrNull();
    return existing != null;
  }

  Future<String> insertSpecies({
    required String name,
    required String sexDeterminationSystem,
  }) async {
    final id = newId();
    await db.into(db.species).insert(
          SpeciesCompanion.insert(
            id: Value(id),
            name: name,
            sexDeterminationSystem: sexDeterminationSystem,
          ),
          mode: InsertMode.insertOrIgnore,
        );
    return id;
  }

  Future<void> insertReproductionProfile({
    required String speciesId,
    required int gestationOrIncubationDays,
    required String offspringUnit,
    int? typicalOffspringMin,
    int? typicalOffspringMax,
  }) {
    return db.into(db.speciesReproductionProfiles).insert(
          SpeciesReproductionProfilesCompanion.insert(
            speciesId: speciesId,
            gestationOrIncubationDays: gestationOrIncubationDays,
            offspringUnit: offspringUnit,
            typicalOffspringMin: Value(typicalOffspringMin),
            typicalOffspringMax: Value(typicalOffspringMax),
          ),
        );
  }

  Future<void> insertTraitDefinition({
    required String speciesId,
    required String key,
    required String name,
    required String unit,
    required String measurementPeriod,
  }) {
    return db.into(db.traitDefinitions).insert(
          TraitDefinitionsCompanion.insert(
            speciesId: speciesId,
            key: key,
            name: name,
            unit: unit,
            measurementPeriod: measurementPeriod,
          ),
        );
  }

  Future<String> insertLocus({
    required String speciesId,
    required String key,
    required String name,
    required String inheritancePattern,
    required bool isSexLinked,
    String? description,
  }) async {
    final id = newId();
    await db.into(db.loci).insert(
          LociCompanion.insert(
            id: Value(id),
            speciesId: speciesId,
            key: key,
            name: name,
            inheritancePattern: inheritancePattern,
            isSexLinked: Value(isSexLinked),
            description: Value(description),
          ),
        );
    return id;
  }

  /// Inserts alleles for a locus, returning a symbol -> id lookup map.
  Future<Map<String, String>> insertAlleles(
    String locusId,
    List<(String symbol, String name, int? dominanceRank)> alleles,
  ) async {
    final result = <String, String>{};
    for (final (symbol, name, rank) in alleles) {
      final id = newId();
      await db.into(db.alleles).insert(
            AllelesCompanion.insert(
              id: Value(id),
              locusId: locusId,
              symbol: symbol,
              name: name,
              dominanceRank: Value(rank),
            ),
          );
      result[symbol] = id;
    }
    return result;
  }

  Future<void> insertPhenotypeTrait({
    required String speciesId,
    required String key,
    required String name,
    required String relatedLocusId,
    required List<(String label, List<List<String>> plausibleAlleleIds)> options,
  }) async {
    final traitId = newId();
    await db.into(db.phenotypeTraits).insert(
          PhenotypeTraitsCompanion.insert(
            id: Value(traitId),
            speciesId: speciesId,
            key: key,
            name: name,
            relatedLocusId: Value(relatedLocusId),
          ),
        );
    for (final (label, plausible) in options) {
      await db.into(db.phenotypeTraitOptions).insert(
            PhenotypeTraitOptionsCompanion.insert(
              id: Value(newId()),
              phenotypeTraitId: traitId,
              label: label,
              plausibleGenotypesJson: Value(jsonEncode(plausible)),
            ),
          );
    }
  }
}
