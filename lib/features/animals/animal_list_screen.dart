import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import 'add_animal_screen.dart';

class AnimalListScreen extends ConsumerWidget {
  const AnimalListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animalsAsync = ref.watch(animalsProvider(null));

    return Scaffold(
      appBar: AppBar(title: const Text('Animals')),
      body: animalsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
        data: (animals) {
          if (animals.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'No animals yet. Tap + to add your first bird.',
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
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const AddAnimalScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
