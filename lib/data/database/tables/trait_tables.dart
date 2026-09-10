import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'animal_tables.dart';
import 'breeding_tables.dart';
import 'species_tables.dart';

/// Species-scoped catalog of quantitative/production metrics: egg rate,
/// milk yield, carcass yield, etc. These are polygenic traits, not
/// discrete Mendelian ones, so they get a separate averaging-based
/// prediction path instead of the Punnett-square engine.
class TraitDefinitions extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get speciesId =>
      text().references(Species, #id, onDelete: KeyAction.cascade)();
  TextColumn get key => text()();
  TextColumn get name => text()();
  TextColumn get unit => text()();

  /// 'per_day' | 'per_week' | 'per_lactation' | 'one_time'
  TextColumn get measurementPeriod => text()();

  /// Optional 0-1 heritability estimate. Currently unused by the
  /// prediction formula (v1 is a straight mid-parent average) but kept so
  /// a future "shrink toward breed baseline" formula is a code change,
  /// not a schema change.
  RealColumn get heritabilityEstimate => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// An actual recorded performance value for one animal (a week's egg
/// count, a milk test, a one-time post-butcher carcass yield, ...).
class TraitRecords extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get animalId =>
      text().references(Animals, #id, onDelete: KeyAction.cascade)();
  TextColumn get traitDefinitionId => text()
      .references(TraitDefinitions, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get recordedDate => dateTime()();
  RealColumn get value => real()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}

/// Estimated offspring performance for a pairing - mid-parent average of
/// each parent's TraitRecords, v1.
class TraitPredictions extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get pairingId => text()
      .references(BreedingPairings, #id, onDelete: KeyAction.cascade)();
  TextColumn get traitDefinitionId => text()
      .references(TraitDefinitions, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get computedAt =>
      dateTime().clientDefault(() => DateTime.now())();
  RealColumn get predictedValue => real()();
  RealColumn get predictedRangeLow => real().nullable()();
  RealColumn get predictedRangeHigh => real().nullable()();
  TextColumn get basis => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
