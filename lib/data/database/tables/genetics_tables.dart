import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'animal_tables.dart';
import 'species_tables.dart';

/// A gene locus (e.g. "E - Extended Black", "B - Barring"). Species-scoped
/// so a new species' whole genetic system is just seed data, never a
/// schema change.
@DataClassName('Locus')
class Loci extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get speciesId =>
      text().references(Species, #id, onDelete: KeyAction.cascade)();
  TextColumn get key => text()();
  TextColumn get name => text()();

  /// 'dominant_series' | 'incomplete_dominance' | 'codominant'
  TextColumn get inheritancePattern => text()();

  /// True for loci carried on the sex chromosome (e.g. Z-linked barring
  /// in chickens).
  BoolColumn get isSexLinked =>
      boolean().withDefault(const Constant(false))();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}

class Alleles extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get locusId =>
      text().references(Loci, #id, onDelete: KeyAction.cascade)();
  TextColumn get symbol => text()();
  TextColumn get name => text()();

  /// Lower rank = more dominant. Used for 'dominant_series' loci; ignored
  /// for incomplete-dominance/codominant loci (those are resolved by the
  /// species-specific phenotype resolver).
  IntColumn get dominanceRank => integer().nullable()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// One animal's known genotype at one locus. Deliberately EAV-style
/// (rows, not fixed columns) so a new locus - for any species - drops in
/// as a seed-data row with zero schema changes. Not every animal needs
/// every locus filled in.
class AnimalGenotypes extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get animalId =>
      text().references(Animals, #id, onDelete: KeyAction.cascade)();
  TextColumn get locusId =>
      text().references(Loci, #id, onDelete: KeyAction.cascade)();
  TextColumn get allele1Id =>
      text().references(Alleles, #id, onDelete: KeyAction.restrict)();

  /// Nullable: an animal that is hemizygous at a sex-linked locus (e.g. a
  /// hen at a Z-linked locus in a ZW species) has only one allele here.
  TextColumn get allele2Id => text()
      .nullable()
      .references(Alleles, #id, onDelete: KeyAction.restrict)();

  /// 'known' (tested/pedigree-certain) | 'inferred' (from observed
  /// phenotype) | 'assumed'
  TextColumn get source => text().withDefault(const Constant('known'))();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}
