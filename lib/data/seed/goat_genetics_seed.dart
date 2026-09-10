import '../database/app_database.dart';
import 'seed_helpers.dart';

/// Seeds the goat species: reproduction profile (single/twin births, not
/// clutches/litters like chickens) plus a first-pass coat color
/// genetics dataset - reusing the exact same loci/alleles/phenotype
/// schema the chicken seed uses, just with different data. That's the
/// point: no schema or engine change was needed to add a mammal with a
/// completely different reproduction pattern.
///
/// v1 covers two autosomal loci (no sex-linked coat trait modeled for
/// goats here, unlike chicken barring):
///   - A (Agouti/Pattern): 3-allele dominance series
///   - B (Brown/Chocolate): simple 2-allele dominant/recessive
///
/// This is a simplified subset of real goat coat color genetics (the
/// actual Agouti locus has many more pattern alleles) - idempotent, safe
/// to call on every app start.
class GoatGeneticsSeed {
  final AppDatabase db;
  const GoatGeneticsSeed(this.db);

  Future<void> run() async {
    final h = SeedHelpers(db);
    if (await h.speciesExists('Goat')) return;

    await db.transaction(() async {
      final speciesId =
          await h.insertSpecies(name: 'Goat', sexDeterminationSystem: 'XY');

      await h.insertReproductionProfile(
        speciesId: speciesId,
        gestationOrIncubationDays: 150,
        offspringUnit: 'single_or_twin_birth',
        typicalOffspringMin: 1,
        typicalOffspringMax: 2,
      );

      final aLocusId = await h.insertLocus(
        speciesId: speciesId,
        key: 'A',
        name: 'Agouti / Pattern',
        inheritancePattern: 'dominant_series',
        isSexLinked: false,
        description:
            'Controls the coat pattern - solid black, a broken/'
            'Swiss-marked pattern, or a plain tan coat with no pattern.',
      );
      final aAlleles = await h.insertAlleles(aLocusId, [
        ('Sb', 'Solid Black', 1),
        ('Br', 'Broken (Swiss-marked)', 2),
        ('Ta', 'Tan / No pattern', 3),
      ]);

      final bLocusId = await h.insertLocus(
        speciesId: speciesId,
        key: 'B',
        name: 'Brown Dilution',
        inheritancePattern: 'dominant_series',
        isSexLinked: false,
        description:
            'Controls whether the coat pigment is black or brown '
            '(chocolate) - black is dominant.',
      );
      final bAlleles = await h.insertAlleles(bLocusId, [
        ('B', 'Black pigment', 1),
        ('b', 'Brown (Chocolate)', 2),
      ]);

      await h.insertPhenotypeTrait(
        speciesId: speciesId,
        key: 'coat_pattern',
        name: 'Coat Pattern',
        relatedLocusId: aLocusId,
        options: [
          ('Solid Black', [
            [aAlleles['Sb']!, aAlleles['Sb']!],
            [aAlleles['Sb']!, aAlleles['Br']!],
            [aAlleles['Sb']!, aAlleles['Ta']!],
          ]),
          ('Broken (Swiss-marked)', [
            [aAlleles['Br']!, aAlleles['Br']!],
            [aAlleles['Br']!, aAlleles['Ta']!],
          ]),
          ('Tan / No pattern', [
            [aAlleles['Ta']!, aAlleles['Ta']!],
          ]),
        ],
      );

      await h.insertPhenotypeTrait(
        speciesId: speciesId,
        key: 'pigment_color',
        name: 'Pigment Color',
        relatedLocusId: bLocusId,
        options: [
          ('Black', [
            [bAlleles['B']!, bAlleles['B']!],
            [bAlleles['B']!, bAlleles['b']!],
          ]),
          ('Brown (Chocolate)', [
            [bAlleles['b']!, bAlleles['b']!],
          ]),
        ],
      );
    });
  }
}
