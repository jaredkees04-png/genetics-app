import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'animal_tables.dart';
import 'genetics_tables.dart';
import 'species_tables.dart';

/// A visually-observable characteristic a breeder can record even without
/// a genotype test (e.g. "Plumage Pattern", "Coat Color").
class PhenotypeTraits extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get speciesId =>
      text().references(Species, #id, onDelete: KeyAction.cascade)();
  TextColumn get key => text()();
  TextColumn get name => text()();

  /// Set when this trait maps cleanly to a single locus (e.g. barring);
  /// left null when it's a composite result of several loci interacting
  /// (in which case it is descriptive only, not used for inference).
  TextColumn get relatedLocusId =>
      text().nullable().references(Loci, #id, onDelete: KeyAction.setNull)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Pick-list values for a PhenotypeTrait.
class PhenotypeTraitOptions extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get phenotypeTraitId => text()
      .references(PhenotypeTraits, #id, onDelete: KeyAction.cascade)();
  TextColumn get label => text()();

  /// JSON list of plausible allele-id combinations at the related locus
  /// consistent with this visible option (each inner list is 1 allele id
  /// for a hemizygous outcome, or 2 for a diploid outcome). Used by the
  /// genetics engine as a lightweight fallback when genotype is unknown
  /// but phenotype was observed - never as a substitute for a
  /// known/tested genotype.
  TextColumn get plausibleGenotypesJson => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class AnimalPhenotypeObservations extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get animalId =>
      text().references(Animals, #id, onDelete: KeyAction.cascade)();
  TextColumn get phenotypeTraitId => text()
      .references(PhenotypeTraits, #id, onDelete: KeyAction.cascade)();
  TextColumn get selectedOptionId => text().nullable().references(
      PhenotypeTraitOptions, #id,
      onDelete: KeyAction.setNull)();
  TextColumn get freeTextValue => text().nullable()();
  DateTimeColumn get observedDate => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}
