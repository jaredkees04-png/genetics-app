import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/providers.dart';
import 'data/database/app_database.dart';
import 'data/seed/chicken_genetics_seed.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();
  await ChickenGeneticsSeed(database).run();

  runApp(
    ProviderScope(
      overrides: [databaseProvider.overrideWithValue(database)],
      child: const GeneticsApp(),
    ),
  );
}
