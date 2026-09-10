import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// A tracked species (chicken, cattle, goat, rabbit, ...).
///
/// `sexDeterminationSystem` matters for sex-linked trait inheritance:
/// birds are ZW (females are the heterogametic sex), mammals are XY
/// (males are the heterogametic sex). Values: 'ZW' | 'XY' | 'none'.
@DataClassName('SpeciesRow')
class Species extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get name => text()();
  TextColumn get sexDeterminationSystem => text()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}

/// Reproduction timing/size for a species. Kept as data (not schema) so
/// adding a new species with a very different reproduction pattern
/// (e.g. cattle: single calf, ~283-day gestation) never requires a
/// migration.
class SpeciesReproductionProfiles extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get speciesId =>
      text().references(Species, #id, onDelete: KeyAction.cascade)();

  /// Incubation days (eggs) or gestation days (live birth).
  IntColumn get gestationOrIncubationDays => integer()();

  /// 'clutch' | 'litter' | 'single_or_twin_birth'
  TextColumn get offspringUnit => text()();
  IntColumn get typicalOffspringMin => integer().nullable()();
  IntColumn get typicalOffspringMax => integer().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}

class Breeds extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get speciesId =>
      text().references(Species, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}

/// Generic "flock/herd" container so we don't hardcode a chicken-specific
/// "flocks" table.
class AnimalGroups extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get speciesId =>
      text().references(Species, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}
