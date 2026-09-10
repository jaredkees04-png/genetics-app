import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database/app_database.dart';
import '../data/repositories/animal_repository.dart';
import '../data/repositories/breeding_repository.dart';
import '../data/repositories/genetics_repository.dart';
import '../data/repositories/trait_repository.dart';
import '../domain/genetics/genetics_models.dart';

/// Overridden with a real, already-seeded instance in main().
final databaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('databaseProvider must be overridden in main()');
});

final animalRepositoryProvider = Provider<AnimalRepository>(
  (ref) => AnimalRepository(ref.watch(databaseProvider)),
);

final geneticsRepositoryProvider = Provider<GeneticsRepository>(
  (ref) => GeneticsRepository(ref.watch(databaseProvider)),
);

final breedingRepositoryProvider = Provider<BreedingRepository>(
  (ref) => BreedingRepository(
    ref.watch(databaseProvider),
    ref.watch(geneticsRepositoryProvider),
  ),
);

final traitRepositoryProvider = Provider<TraitRepository>(
  (ref) => TraitRepository(ref.watch(databaseProvider)),
);

final speciesListProvider = StreamProvider<List<SpeciesRow>>(
  (ref) => ref.watch(animalRepositoryProvider).watchSpecies(),
);

/// v1 only ever seeds one species; this is the convenience accessor the
/// UI uses everywhere it needs "the current species".
final chickenSpeciesProvider = FutureProvider<SpeciesRow>((ref) async {
  final list = await ref.watch(speciesListProvider.future);
  return list.firstWhere((s) => s.name == 'Chicken');
});

final lociForChickenProvider = FutureProvider((ref) async {
  final species = await ref.watch(chickenSpeciesProvider.future);
  return ref.watch(geneticsRepositoryProvider).lociForSpecies(species.id);
});

final phenotypeTraitsForChickenProvider =
    FutureProvider<List<PhenotypeTraitInfo>>((ref) async {
  final species = await ref.watch(chickenSpeciesProvider.future);
  return ref
      .watch(geneticsRepositoryProvider)
      .phenotypeTraitsForSpecies(species.id);
});

final traitDefinitionsForChickenProvider =
    StreamProvider<List<TraitDefinition>>((ref) async* {
  final species = await ref.watch(chickenSpeciesProvider.future);
  yield* ref.watch(traitRepositoryProvider).watchTraitDefinitions(species.id);
});

final animalGenotypesProvider = StreamProvider.family<List<AnimalGenotype>, String>(
  (ref, animalId) => ref.watch(animalRepositoryProvider).watchGenotypes(animalId),
);

final animalPhenotypeObservationsProvider =
    StreamProvider.family<List<AnimalPhenotypeObservation>, String>(
  (ref, animalId) =>
      ref.watch(animalRepositoryProvider).watchPhenotypeObservations(animalId),
);

final animalTraitRecordsProvider =
    StreamProvider.family<List<TraitRecord>, String>(
  (ref, animalId) => ref.watch(traitRepositoryProvider).watchTraitRecords(animalId),
);

final animalsProvider = StreamProvider.family<List<Animal>, String?>(
  (ref, speciesId) =>
      ref.watch(animalRepositoryProvider).watchAnimals(speciesId: speciesId),
);

final animalByIdProvider = FutureProvider.family<Animal?, String>(
  (ref, animalId) => ref.watch(animalRepositoryProvider).getAnimal(animalId),
);

final pairingsProvider = StreamProvider.family<List<BreedingPairing>, String?>(
  (ref, speciesId) =>
      ref.watch(breedingRepositoryProvider).watchPairings(speciesId: speciesId),
);

final geneticsPredictionProvider =
    FutureProvider.family<PairingGeneticsPrediction, String>(
  (ref, pairingId) =>
      ref.watch(breedingRepositoryProvider).computeGeneticsPrediction(pairingId),
);

final traitPredictionsProvider =
    FutureProvider.family<List<TraitPredictionRow>, String>(
  (ref, pairingId) =>
      ref.watch(breedingRepositoryProvider).computeTraitPredictions(pairingId),
);
