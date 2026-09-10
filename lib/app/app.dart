import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/home/home_screen.dart';
import 'app_settings.dart';
import 'theme.dart';

class GeneticsApp extends ConsumerWidget {
  const GeneticsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final colorScheme = ref.watch(appColorSchemeProvider);

    return MaterialApp(
      title: 'Livestock Genetics',
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(colorScheme.seedColor),
      darkTheme: buildDarkTheme(colorScheme.seedColor),
      themeMode: themeMode,
      home: const HomeScreen(),
    );
  }
}
