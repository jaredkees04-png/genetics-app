// Verifies goat/cattle seed data is structurally correct, and that a
// cattle coat-color prediction resolves to a real phenotype name (not a
// raw genotype label) via the newly-generalized DefaultPhenotypeResolver.
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:genetics_app/data/database/app_database.dart';
import 'package:genetics_app/data/repositories/animal_repository.dart';
import 'package:genetics_app/data/repositories/breeding_repository.dart';
import 'package:genetics_app/data/repositories/genetics_repository.dart';
import 'package:genetics_app/data/seed/cattle_genetics_seed.dart';
import 'package:genetics_app/data/seed/chicken_genetics_seed.dart';
import 'package:genetics_app/data/seed/goat_genetics_seed.dart';

void main() {
  late AppDatabase db;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    await ChickenGeneticsSeed(db).run();
    await GoatGeneticsSeed(db).run();
    await CattleGeneticsSeed(db).run();
  });

  tearDown(() => db.close());

  test('all three species are seeded with distinct reproduction profiles', () async {
    final species = await db.select(db.species).get();
    final names = species.map((s) => s.name).toSet();
    expect(names, {'Chicken', 'Goat', 'Cattle'});

    final profiles = await db.select(db.speciesReproductionProfiles).get();
    final byName = {
      for (final s in species)
        s.name: profiles.firstWhere((p) => p.speciesId == s.id),
    };

    expect(byName['Chicken']!.offspringUnit, 'clutch');
    expect(byName['Chicken']!.gestationOrIncubationDays, 21);

    expect(byName['Goat']!.offspringUnit, 'single_or_twin_birth');
    expect(byName['Goat']!.gestationOrIncubationDays, 150);
    expect(byName['Goat']!.typicalOffspringMax, 2);

    expect(byName['Cattle']!.offspringUnit, 'single_or_twin_birth');
    expect(byName['Cattle']!.gestationOrIncubationDays, 283);
    expect(byName['Cattle']!.typicalOffspringMin, 1);
    expect(byName['Cattle']!.typicalOffspringMax, 1);
  });

  test('cattle has milk yield and carcass yield trait definitions', () async {
    final cattle = await (db.select(db.species)
          ..where((t) => t.name.equals('Cattle')))
        .getSingle();
    final traits = await (db.select(db.traitDefinitions)
          ..where((t) => t.speciesId.equals(cattle.id)))
        .get();
    final keys = traits.map((t) => t.key).toSet();
    expect(keys, {'milk_yield', 'carcass_yield_pct'});

    final carcass = traits.firstWhere((t) => t.key == 'carcass_yield_pct');
    expect(carcass.measurementPeriod, 'one_time');
  });

  test('cattle coat color prediction resolves to a phenotype name, not a raw genotype label',
      () async {
    final geneticsRepo = GeneticsRepository(db);
    final animalRepo = AnimalRepository(db);
    final breedingRepo = BreedingRepository(db, geneticsRepo);

    final cattle = await (db.select(db.species)
          ..where((t) => t.name.equals('Cattle')))
        .getSingle();
    final loci = await geneticsRepo.lociForSpecies(cattle.id);
    final extension = loci.firstWhere((l) => l.key == 'E');
    final blackAllele = extension.alleles.firstWhere((a) => a.symbol == 'E');
    final redAllele = extension.alleles.firstWhere((a) => a.symbol == 'e');

    final bullId = await animalRepo.addAnimal(
      speciesId: cattle.id,
      name: 'Bull',
      sex: 'male',
    );
    final cowId = await animalRepo.addAnimal(
      speciesId: cattle.id,
      name: 'Cow',
      sex: 'female',
    );

    // Homozygous black bull x homozygous red cow -> all calves Ee, and
    // since Black is dominant, all calves should display as "Black".
    await animalRepo.setGenotype(
      animalId: bullId,
      locusId: extension.id,
      allele1Id: blackAllele.id,
      allele2Id: blackAllele.id,
    );
    await animalRepo.setGenotype(
      animalId: cowId,
      locusId: extension.id,
      allele1Id: redAllele.id,
      allele2Id: redAllele.id,
    );

    final pairingId = await breedingRepo.createPairing(
      speciesId: cattle.id,
      sireId: bullId,
      damId: cowId,
    );

    final prediction = await breedingRepo.computeGeneticsPrediction(pairingId);

    expect(prediction.skippedLoci, isEmpty);
    expect(prediction.outcomes, isNotEmpty);
    for (final outcome in prediction.outcomes) {
      expect(outcome.description, 'Black');
      expect(outcome.description, isNot(contains('/')));
    }
  });
}
