import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/id_generator.dart';

class AnimalRepository {
  final AppDatabase db;
  const AnimalRepository(this.db);

  Stream<List<SpeciesRow>> watchSpecies() => db.select(db.species).watch();

  Stream<List<Animal>> watchAnimals({String? speciesId}) {
    final query = db.select(db.animals)
      ..where((t) => t.deletedAt.isNull());
    if (speciesId != null) {
      query.where((t) => t.speciesId.equals(speciesId));
    }
    query.orderBy([(t) => OrderingTerm(expression: t.name)]);
    return query.watch();
  }

  Future<Animal?> getAnimal(String id) =>
      (db.select(db.animals)..where((t) => t.id.equals(id))).getSingleOrNull();

  Stream<List<Breed>> watchBreeds(String speciesId) =>
      (db.select(db.breeds)..where((t) => t.speciesId.equals(speciesId)))
          .watch();

  Future<String> addAnimal({
    required String speciesId,
    String? breedId,
    required String name,
    required String sex,
    DateTime? birthDate,
    String? sireId,
    String? damId,
    String? phenotypeDescription,
    String? notes,
  }) async {
    final id = newId();
    await db.into(db.animals).insert(
          AnimalsCompanion.insert(
            id: Value(id),
            speciesId: speciesId,
            breedId: Value(breedId),
            name: name,
            sex: sex,
            birthDate: Value(birthDate),
            sireId: Value(sireId),
            damId: Value(damId),
            phenotypeDescription: Value(phenotypeDescription),
            notes: Value(notes),
          ),
        );
    return id;
  }

  Future<void> setGenotype({
    required String animalId,
    required String locusId,
    required String allele1Id,
    String? allele2Id,
    String source = 'known',
  }) async {
    final existing = await (db.select(db.animalGenotypes)
          ..where((t) => t.animalId.equals(animalId) & t.locusId.equals(locusId)))
        .getSingleOrNull();
    if (existing != null) {
      await (db.update(db.animalGenotypes)..where((t) => t.id.equals(existing.id)))
          .write(AnimalGenotypesCompanion(
        allele1Id: Value(allele1Id),
        allele2Id: Value(allele2Id),
        source: Value(source),
        updatedAt: Value(DateTime.now()),
      ));
    } else {
      await db.into(db.animalGenotypes).insert(
            AnimalGenotypesCompanion.insert(
              animalId: animalId,
              locusId: locusId,
              allele1Id: allele1Id,
              allele2Id: Value(allele2Id),
              source: Value(source),
            ),
          );
    }
  }

  Future<List<AnimalGenotype>> genotypesForAnimal(String animalId) =>
      (db.select(db.animalGenotypes)
            ..where((t) => t.animalId.equals(animalId)))
          .get();

  Future<void> setPhenotypeObservation({
    required String animalId,
    required String phenotypeTraitId,
    String? selectedOptionId,
    String? freeTextValue,
  }) async {
    final existing = await (db.select(db.animalPhenotypeObservations)
          ..where((t) =>
              t.animalId.equals(animalId) &
              t.phenotypeTraitId.equals(phenotypeTraitId)))
        .getSingleOrNull();
    if (existing != null) {
      await (db.update(db.animalPhenotypeObservations)
            ..where((t) => t.id.equals(existing.id)))
          .write(AnimalPhenotypeObservationsCompanion(
        selectedOptionId: Value(selectedOptionId),
        freeTextValue: Value(freeTextValue),
      ));
    } else {
      await db.into(db.animalPhenotypeObservations).insert(
            AnimalPhenotypeObservationsCompanion.insert(
              animalId: animalId,
              phenotypeTraitId: phenotypeTraitId,
              selectedOptionId: Value(selectedOptionId),
              freeTextValue: Value(freeTextValue),
            ),
          );
    }
  }
}
