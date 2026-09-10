import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'species_tables.dart';

/// A single tracked animal. `sireId`/`damId` self-reference this table so
/// lineage works identically whether the parent produced eggs or a calf.
class Animals extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get speciesId =>
      text().references(Species, #id, onDelete: KeyAction.restrict)();
  TextColumn get breedId =>
      text().nullable().references(Breeds, #id, onDelete: KeyAction.setNull)();
  TextColumn get groupId => text()
      .nullable()
      .references(AnimalGroups, #id, onDelete: KeyAction.setNull)();
  TextColumn get name => text()();

  /// 'male' | 'female' | 'unknown'
  TextColumn get sex => text()();
  DateTimeColumn get birthDate => dateTime().nullable()();
  TextColumn get sireId =>
      text().nullable().references(Animals, #id, onDelete: KeyAction.setNull)();
  TextColumn get damId =>
      text().nullable().references(Animals, #id, onDelete: KeyAction.setNull)();

  /// 'active' | 'sold' | 'deceased' | 'culled'
  TextColumn get status => text().withDefault(const Constant('active'))();

  /// Free-text visual description shown for reference; not used by the
  /// genetics engine (see AnimalPhenotypeObservations for structured data).
  TextColumn get phenotypeDescription => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
