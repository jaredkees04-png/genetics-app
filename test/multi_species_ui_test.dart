// With multiple species seeded, the species selector should appear and
// switching it should filter the animal list - exercising the
// selectedSpeciesIdProvider/currentSpeciesProvider wiring end-to-end.
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:genetics_app/app/providers.dart';
import 'package:genetics_app/data/database/app_database.dart';
import 'package:genetics_app/data/repositories/animal_repository.dart';
import 'package:genetics_app/data/seed/cattle_genetics_seed.dart';
import 'package:genetics_app/data/seed/chicken_genetics_seed.dart';
import 'package:genetics_app/data/seed/goat_genetics_seed.dart';
import 'package:genetics_app/features/animals/animal_list_screen.dart';

void main() {
  testWidgets('species selector switches the animal list', (tester) async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    await ChickenGeneticsSeed(database).run();
    await GoatGeneticsSeed(database).run();
    await CattleGeneticsSeed(database).run();

    final chicken = await (database.select(database.species)
          ..where((t) => t.name.equals('Chicken')))
        .getSingle();
    final goat = await (database.select(database.species)
          ..where((t) => t.name.equals('Goat')))
        .getSingle();

    final animalRepo = AnimalRepository(database);
    await animalRepo.addAnimal(speciesId: chicken.id, name: 'Hen One', sex: 'female');
    await animalRepo.addAnimal(speciesId: goat.id, name: 'Nanny One', sex: 'female');

    final container = ProviderContainer(
      overrides: [databaseProvider.overrideWithValue(database)],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: AnimalListScreen()),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    // Defaults to the first seeded species (Chicken).
    expect(find.text('Hen One'), findsOneWidget);
    expect(find.text('Nanny One'), findsNothing);

    // Switch to Goat via the species dropdown.
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Goat').last);
    await tester.pumpAndSettle();

    expect(find.text('Nanny One'), findsOneWidget);
    expect(find.text('Hen One'), findsNothing);
  });
}
