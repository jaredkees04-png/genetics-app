import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/id_generator.dart';

/// Records and reads the quantitative production data (egg rate, milk
/// yield, carcass yield, ...) that BreedingRepository's mid-parent
/// average predictor reads from.
class TraitRepository {
  final AppDatabase db;
  const TraitRepository(this.db);

  Stream<List<TraitDefinition>> watchTraitDefinitions(String speciesId) =>
      (db.select(db.traitDefinitions)
            ..where((t) => t.speciesId.equals(speciesId)))
          .watch();

  Stream<List<TraitRecord>> watchTraitRecords(String animalId) {
    final query = db.select(db.traitRecords)
      ..where((t) => t.animalId.equals(animalId))
      ..orderBy([
        (t) => OrderingTerm(expression: t.recordedDate, mode: OrderingMode.desc)
      ]);
    return query.watch();
  }

  Future<String> addTraitRecord({
    required String animalId,
    required String traitDefinitionId,
    required DateTime recordedDate,
    required double value,
    String? notes,
  }) async {
    final id = newId();
    await db.into(db.traitRecords).insert(
          TraitRecordsCompanion.insert(
            id: Value(id),
            animalId: animalId,
            traitDefinitionId: traitDefinitionId,
            recordedDate: recordedDate,
            value: value,
            notes: Value(notes),
          ),
        );
    return id;
  }
}
