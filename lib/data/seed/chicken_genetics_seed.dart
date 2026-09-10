import '../database/app_database.dart';
import 'seed_helpers.dart';

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
    final h = SeedHelpers(db);
    if (await h.speciesExists('Chicken')) return;

    await db.transaction(() async {
      final speciesId =
          await h.insertSpecies(name: 'Chicken', sexDeterminationSystem: 'ZW');

      await h.insertReproductionProfile(
        speciesId: speciesId,
        gestationOrIncubationDays: 21,
        offspringUnit: 'clutch',
        typicalOffspringMin: 8,
        typicalOffspringMax: 12,
      );

      await h.insertTraitDefinition(
        speciesId: speciesId,
        key: 'egg_rate',
        name: 'Egg-laying rate',
        unit: 'eggs/week',
        measurementPeriod: 'per_week',
      );

      final eLocusId = await h.insertLocus(
        speciesId: speciesId,
        key: 'E',
        name: 'Extended Black',
        inheritancePattern: 'dominant_series',
        isSexLinked: false,
        description:
            'Simplified 3-allele dominance series controlling base '
            'eumelanin (black) expression.',
      );
      final eAlleles = await h.insertAlleles(eLocusId, [
        ('E', 'Extended Black', 1),
        ('e+', 'Wild-type (Duckwing)', 2),
        ('eb', 'Brown (Partridge)', 3),
      ]);

      final bLocusId = await h.insertLocus(
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
      final bAlleles = await h.insertAlleles(bLocusId, [
        ('B', 'Barred', 1),
        ('b+', 'Non-barred', 2),
      ]);

      final blLocusId = await h.insertLocus(
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
      final blAlleles = await h.insertAlleles(blLocusId, [
        ('Bl', 'Blue dilution', null),
        ('bl+', 'Not diluted', null),
      ]);

      await h.insertPhenotypeTrait(
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

      await h.insertPhenotypeTrait(
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

      await h.insertPhenotypeTrait(
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
}
