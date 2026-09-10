// Basic smoke test: the app boots to the Animals tab without throwing.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:genetics_app/app/app.dart';
import 'package:genetics_app/app/providers.dart';
import 'package:genetics_app/data/database/app_database.dart';
import 'package:genetics_app/data/seed/chicken_genetics_seed.dart';
import 'package:drift/native.dart';

void main() {
  testWidgets('App boots and shows Animals tab', (tester) async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    await ChickenGeneticsSeed(database).run();

    final container = ProviderContainer(
      overrides: [databaseProvider.overrideWithValue(database)],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const GeneticsApp(),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Animals'), findsWidgets);
  });
}
