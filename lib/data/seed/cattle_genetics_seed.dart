import '../database/app_database.dart';
import 'seed_helpers.dart';

/// Seeds the cattle species: reproduction profile (~283-day gestation, a
/// single calf - the case the whole species/reproduction-profile design
/// was meant to accommodate alongside chicken clutches), a coat color
/// locus, and the two production trait definitions cattle breeders
/// actually track: milk yield (dairy) and carcass/dressed yield
/// (post-butcher, a one-time record rather than a repeated measurement).
///
/// v1 covers one autosomal locus - Extension (Black/Red), the classic
/// simple-Mendelian example in cattle coat color (e.g. Angus vs. Red
/// Angus). More loci (dilution, spotting) are additional seed rows, not
/// a schema change. Idempotent: safe to call on every app start.
class CattleGeneticsSeed {
  final AppDatabase db;
  const CattleGeneticsSeed(this.db);

  Future<void> run() async {
    final h = SeedHelpers(db);
    if (await h.speciesExists('Cattle')) return;

    await db.transaction(() async {
      final speciesId =
          await h.insertSpecies(name: 'Cattle', sexDeterminationSystem: 'XY');

      await h.insertReproductionProfile(
        speciesId: speciesId,
        gestationOrIncubationDays: 283,
        offspringUnit: 'single_or_twin_birth',
        typicalOffspringMin: 1,
        typicalOffspringMax: 1,
      );

      await h.insertTraitDefinition(
        speciesId: speciesId,
        key: 'milk_yield',
        name: 'Milk yield',
        unit: 'liters/day',
        measurementPeriod: 'per_day',
      );

      await h.insertTraitDefinition(
        speciesId: speciesId,
        key: 'carcass_yield_pct',
        name: 'Carcass (dressed) yield',
        unit: '% of live weight',
        measurementPeriod: 'one_time',
      );

      final eLocusId = await h.insertLocus(
        speciesId: speciesId,
        key: 'E',
        name: 'Extension',
        inheritancePattern: 'dominant_series',
        isSexLinked: false,
        description: 'Black is dominant over red (e.g. Angus vs. Red Angus).',
      );
      final eAlleles = await h.insertAlleles(eLocusId, [
        ('E', 'Black', 1),
        ('e', 'Red', 2),
      ]);

      await h.insertPhenotypeTrait(
        speciesId: speciesId,
        key: 'coat_color',
        name: 'Coat Color',
        relatedLocusId: eLocusId,
        options: [
          ('Black', [
            [eAlleles['E']!, eAlleles['E']!],
            [eAlleles['E']!, eAlleles['e']!],
          ]),
          ('Red', [
            [eAlleles['e']!, eAlleles['e']!],
          ]),
        ],
      );
    });
  }
}
