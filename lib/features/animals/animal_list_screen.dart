import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../home/species_selector.dart';
import '../settings/settings_button.dart';
import 'add_animal_screen.dart';
import 'animal_detail_screen.dart';

class AnimalListScreen extends ConsumerWidget {
  const AnimalListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSpecies = ref.watch(currentSpeciesProvider).value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animals'),
        actions: const [
          SpeciesSelector(),
          SizedBox(width: 4),
          SettingsButton(),
          SizedBox(width: 4),
        ],
      ),
      body: currentSpecies == null
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text('No species seeded yet.', textAlign: TextAlign.center),
              ),
            )
          : _AnimalListBody(speciesId: currentSpecies.id),
      floatingActionButton: FloatingActionButton(
        onPressed: currentSpecies == null
            ? null
            : () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AddAnimalScreen(speciesId: currentSpecies.id),
                  ),
                ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AnimalListBody extends ConsumerWidget {
  final String speciesId;
  const _AnimalListBody({required this.speciesId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animalsAsync = ref.watch(animalsProvider(speciesId));

    return animalsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
      data: (animals) {
        if (animals.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'No animals yet. Tap + to add your first one.',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        return ListView.separated(
          itemCount: animals.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final animal = animals[i];
            return ListTile(
              leading: CircleAvatar(
                child: Icon(
                  animal.sex == 'male'
                      ? Icons.male
                      : animal.sex == 'female'
                          ? Icons.female
                          : Icons.help_outline,
                ),
              ),
              title: Text(animal.name),
              subtitle: Text([
                animal.sex,
                if (animal.phenotypeDescription != null)
                  animal.phenotypeDescription!,
              ].join(' · ')),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AnimalDetailScreen(animalId: animal.id),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
