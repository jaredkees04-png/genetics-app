import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:uuid/uuid.dart';

import 'tables/animal_tables.dart';
import 'tables/breeding_tables.dart';
import 'tables/genetics_tables.dart';
import 'tables/phenotype_tables.dart';
import 'tables/species_tables.dart';
import 'tables/trait_tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Species,
    SpeciesReproductionProfiles,
    Breeds,
    AnimalGroups,
    Animals,
    Loci,
    Alleles,
    AnimalGenotypes,
    PhenotypeTraits,
    PhenotypeTraitOptions,
    AnimalPhenotypeObservations,
    BreedingPairings,
    BreedingPredictions,
    BreedingEvents,
    Offspring,
    TraitDefinitions,
    TraitRecords,
    TraitPredictions,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'genetics_app_db');
  }
}
