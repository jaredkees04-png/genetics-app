import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'animal_tables.dart';
import 'species_tables.dart';

/// A sire x dam pairing record. This is the parent for both the
/// hypothetical genetics predictions and any real-world breeding events.
class BreedingPairings extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get speciesId =>
      text().references(Species, #id, onDelete: KeyAction.restrict)();
  TextColumn get sireId =>
      text().references(Animals, #id, onDelete: KeyAction.restrict)();
  TextColumn get damId =>
      text().references(Animals, #id, onDelete: KeyAction.restrict)();
  DateTimeColumn get pairingDate => dateTime().nullable()();

  /// 'planned' | 'active' | 'completed'
  TextColumn get status => text().withDefault(const Constant('planned'))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// The cached Punnett-square style output for a pairing: a probability
/// distribution over possible offspring genotypes/phenotypes, generally
/// split by offspring sex where sex-linked loci are involved. Purely
/// hypothetical - not tied to any real-world event.
class BreedingPredictions extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get pairingId => text()
      .references(BreedingPairings, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get computedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  /// Serialized PairingPrediction (see domain/genetics).
  TextColumn get resultJson => text()();

  @override
  Set<Column> get primaryKey => {id};
}

/// An actual real-world reproduction event for a pairing (a clutch laid,
/// a litter/calf born). A single pairing can have many events over time.
class BreedingEvents extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get pairingId => text()
      .references(BreedingPairings, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get eventDate => dateTime()();
  DateTimeColumn get expectedOffspringDate => dateTime().nullable()();
  DateTimeColumn get actualOffspringDate => dateTime().nullable()();

  /// 'predicted' | 'incubating' | 'hatched' | 'born' | 'failed'
  TextColumn get status =>
      text().withDefault(const Constant('predicted'))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}

/// One individual real offspring (an egg in a clutch, a kit in a litter,
/// a calf) produced by a BreedingEvent.
@DataClassName('OffspringRecord')
class Offspring extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get breedingEventId =>
      text().references(BreedingEvents, #id, onDelete: KeyAction.cascade)();

  /// Set once this offspring is promoted to a fully tracked Animal.
  TextColumn get animalId =>
      text().nullable().references(Animals, #id, onDelete: KeyAction.setNull)();
  IntColumn get sequenceNumber => integer().nullable()();
  TextColumn get predictedSex => text().nullable()();
  TextColumn get predictedPhenotype => text().nullable()();

  /// 'viable' | 'infertile' | 'died' | null (unknown yet)
  TextColumn get actualOutcome => text().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
