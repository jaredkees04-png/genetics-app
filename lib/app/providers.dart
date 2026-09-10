import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database/app_database.dart';
import '../data/repositories/animal_repository.dart';
import '../data/repositories/breeding_repository.dart';
import '../data/repositories/genetics_repository.dart';

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

final animalsProvider = StreamProvider.family<List<Animal>, String?>(
  (ref, speciesId) =>
      ref.watch(animalRepositoryProvider).watchAnimals(speciesId: speciesId),
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
