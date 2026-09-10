// Verifies theme mode and accent color choices actually update state and
// get persisted to SharedPreferences, not just that the UI renders.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:genetics_app/app/app_settings.dart';
import 'package:genetics_app/features/settings/settings_screen.dart';

void main() {
  testWidgets('changing theme mode and accent color updates state and persists',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    final container = ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );
    addTearDown(container.dispose);

    // Defaults before any change.
    expect(container.read(themeModeProvider), ThemeMode.system);
    expect(container.read(appColorSchemeProvider), AppColorScheme.green);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: SettingsScreen()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Dark'));
    await tester.pumpAndSettle();

    expect(container.read(themeModeProvider), ThemeMode.dark);
    expect(prefs.getString('settings.theme_mode'), 'dark');

    await tester.tap(find.text('Blue'));
    await tester.pumpAndSettle();

    expect(container.read(appColorSchemeProvider), AppColorScheme.blue);
    expect(prefs.getString('settings.color_scheme'), 'blue');
  });

  testWidgets('a stored preference is picked up as the initial state',
      (tester) async {
    SharedPreferences.setMockInitialValues({
      'settings.theme_mode': 'light',
      'settings.color_scheme': 'rust',
    });
    final prefs = await SharedPreferences.getInstance();

    final container = ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );
    addTearDown(container.dispose);

    expect(container.read(themeModeProvider), ThemeMode.light);
    expect(container.read(appColorSchemeProvider), AppColorScheme.rust);
  });
}
