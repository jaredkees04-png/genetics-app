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

final speciesByIdProvider = FutureProvider.family<SpeciesRow?, String>(
  (ref, speciesId) async {
    final list = await ref.watch(speciesListProvider.future);
    for (final s in list) {
      if (s.id == speciesId) return s;
    }
    return null;
  },
);

class _SelectedSpeciesId extends Notifier<String?> {
  @override
  String? build() => null;

  void select(String? speciesId) => state = speciesId;
}

/// User's explicit species choice, via the selector in the app bar. Null
/// means "no explicit choice yet" - [currentSpeciesProvider] then falls
/// back to the first seeded species.
final selectedSpeciesIdProvider =
    NotifierProvider<_SelectedSpeciesId, String?>(_SelectedSpeciesId.new);

/// The species screens should show data for right now: the explicit
/// selection if one was made and still exists, otherwise the first
/// seeded species, otherwise null (nothing seeded yet).
final currentSpeciesProvider = Provider<AsyncValue<SpeciesRow?>>((ref) {
  final selectedId = ref.watch(selectedSpeciesIdProvider);
  final speciesListAsync = ref.watch(speciesListProvider);
  return speciesListAsync.whenData((list) {
    if (list.isEmpty) return null;
    for (final s in list) {
      if (s.id == selectedId) return s;
    }
    return list.first;
  });
});

final lociForSpeciesProvider = FutureProvider.family<List<LocusInfo>, String>(
  (ref, speciesId) =>
      ref.watch(geneticsRepositoryProvider).lociForSpecies(speciesId),
);

final phenotypeTraitsForSpeciesProvider =
    FutureProvider.family<List<PhenotypeTraitInfo>, String>(
  (ref, speciesId) =>
      ref.watch(geneticsRepositoryProvider).phenotypeTraitsForSpecies(speciesId),
);

final traitDefinitionsForSpeciesProvider =
    StreamProvider.family<List<TraitDefinition>, String>(
  (ref, speciesId) =>
      ref.watch(traitRepositoryProvider).watchTraitDefinitions(speciesId),
);

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
