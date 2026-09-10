// Exercises AnimalDetailScreen end-to-end against a real (in-memory) DB
// to catch provider wiring bugs the analyzer can't see.
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:genetics_app/app/providers.dart';
import 'package:genetics_app/data/database/app_database.dart';
import 'package:genetics_app/data/repositories/animal_repository.dart';
import 'package:genetics_app/data/seed/chicken_genetics_seed.dart';
import 'package:genetics_app/features/animals/animal_detail_screen.dart';

void main() {
  testWidgets('AnimalDetailScreen renders genotype, phenotype, and trait sections',
      (tester) async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    await ChickenGeneticsSeed(database).run();

    final species = await (database.select(database.species)
          ..where((t) => t.name.equals('Chicken')))
        .getSingle();
    final animalId = await AnimalRepository(database).addAnimal(
      speciesId: species.id,
      name: 'Test Hen',
      sex: 'female',
    );

    final container = ProviderContainer(
      overrides: [databaseProvider.overrideWithValue(database)],
    );
    addTearDown(container.dispose);

    // The detail screen is a tall scrolling list; without this the
    // trait-records section (near the bottom) is never built by the
    // lazy sliver list and find.text() can't see it.
    await tester.binding.setSurfaceSize(const Size(400, 2000));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: AnimalDetailScreen(animalId: animalId),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Coloring & Pattern Genes'), findsOneWidget);
    expect(find.text('Observed Phenotype'), findsOneWidget);
    expect(find.text('Production Records'), findsOneWidget);
    expect(find.textContaining('Egg-laying rate'), findsOneWidget);
  });
}
