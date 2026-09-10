import 'dart:convert';

import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/id_generator.dart';

/// Seeds the chicken species plus a first-pass plumage genetics dataset.
///
/// v1 covers three loci chosen to exercise every inheritance pattern the
/// engine supports:
///   - E (Extended Black): autosomal dominance series
///   - B (Barring): Z-linked (sex-linked) simple dominant
///   - Bl (Blue/Lavender dilution): autosomal incomplete dominance
///
/// This is a simplified subset of real chicken plumage genetics (the
/// full E-series alone has more alleles, and loci like dominant white or
/// mottling aren't modeled yet) - more loci are additional seed rows,
/// not a schema or engine change. Idempotent: safe to call on every app
/// start.
class ChickenGeneticsSeed {
  final AppDatabase db;
  const ChickenGeneticsSeed(this.db);

  Future<void> run() async {
    final existing = await (db.select(db.species)
          ..where((t) => t.name.equals('Chicken')))
        .getSingleOrNull();
    if (existing != null) return;

    await db.transaction(() async {
      final speciesId = newId();
      await db.into(db.species).insert(
            SpeciesCompanion.insert(
              id: Value(speciesId),
              name: 'Chicken',
              sexDeterminationSystem: 'ZW',
            ),
            mode: InsertMode.insertOrIgnore,
          );

      await db.into(db.speciesReproductionProfiles).insert(
            SpeciesReproductionProfilesCompanion.insert(
              speciesId: speciesId,
              gestationOrIncubationDays: 21,
              offspringUnit: 'clutch',
              typicalOffspringMin: const Value(8),
              typicalOffspringMax: const Value(12),
            ),
          );

      await db.into(db.traitDefinitions).insert(
            TraitDefinitionsCompanion.insert(
              speciesId: speciesId,
              key: 'egg_rate',
              name: 'Egg-laying rate',
              unit: 'eggs/week',
              measurementPeriod: 'per_week',
            ),
          );

      final eLocusId = await _insertLocus(
        speciesId: speciesId,
        key: 'E',
        name: 'Extended Black',
        inheritancePattern: 'dominant_series',
        isSexLinked: false,
        description:
            'Simplified 3-allele dominance series controlling base '
            'eumelanin (black) expression.',
      );
      final eAlleles = await _insertAlleles(eLocusId, [
        ('E', 'Extended Black', 1),
        ('e+', 'Wild-type (Duckwing)', 2),
        ('eb', 'Brown (Partridge)', 3),
      ]);

      final bLocusId = await _insertLocus(
        speciesId: speciesId,
        key: 'B',
        name: 'Barring',
        inheritancePattern: 'dominant_series',
        isSexLinked: true,
        description:
            'Z-linked. Barred is dominant. Because hens are hemizygous '
            '(ZW), a barred rooster x non-barred hen cross famously '
            'lets you sex chicks at hatch by down color.',
      );
      final bAlleles = await _insertAlleles(bLocusId, [
        ('B', 'Barred', 1),
        ('b+', 'Non-barred', 2),
      ]);

      final blLocusId = await _insertLocus(
        speciesId: speciesId,
        key: 'Bl',
        name: 'Blue/Lavender Dilution',
        inheritancePattern: 'incomplete_dominance',
        isSexLinked: false,
        description:
            'Heterozygotes (Bl/bl+) are Blue - a distinct third '
            'phenotype, not a blend that resembles either homozygote. '
            'Bl/Bl homozygotes are Splash.',
      );
      final blAlleles = await _insertAlleles(blLocusId, [
        ('Bl', 'Blue dilution', null),
        ('bl+', 'Not diluted', null),
      ]);

      await _insertPhenotypeTrait(
        speciesId: speciesId,
        key: 'base_color',
        name: 'Base Color',
        relatedLocusId: eLocusId,
        options: [
          ('Black', [
            [eAlleles['E']!, eAlleles['E']!],
            [eAlleles['E']!, eAlleles['e+']!],
            [eAlleles['E']!, eAlleles['eb']!],
            [eAlleles['E']!],
          ]),
          ('Wild-type / Duckwing', [
            [eAlleles['e+']!, eAlleles['e+']!],
            [eAlleles['e+']!, eAlleles['eb']!],
            [eAlleles['e+']!],
          ]),
          ('Brown / Partridge', [
            [eAlleles['eb']!, eAlleles['eb']!],
            [eAlleles['eb']!],
          ]),
        ],
      );

      await _insertPhenotypeTrait(
        speciesId: speciesId,
        key: 'plumage_pattern',
        name: 'Plumage Pattern',
        relatedLocusId: bLocusId,
        options: [
          ('Barred', [
            [bAlleles['B']!, bAlleles['B']!],
            [bAlleles['B']!, bAlleles['b+']!],
            [bAlleles['B']!],
          ]),
          ('Non-barred', [
            [bAlleles['b+']!, bAlleles['b+']!],
            [bAlleles['b+']!],
          ]),
        ],
      );

      await _insertPhenotypeTrait(
        speciesId: speciesId,
        key: 'dilution',
        name: 'Dilution',
        relatedLocusId: blLocusId,
        options: [
          ('Blue', [
            [blAlleles['Bl']!, blAlleles['bl+']!],
          ]),
          ('Splash', [
            [blAlleles['Bl']!, blAlleles['Bl']!],
          ]),
          ('Black / Not diluted', [
            [blAlleles['bl+']!, blAlleles['bl+']!],
          ]),
        ],
      );
    });
  }

  Future<String> _insertLocus({
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
  Future<Map<String, String>> _insertAlleles(
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

  Future<void> _insertPhenotypeTrait({
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
