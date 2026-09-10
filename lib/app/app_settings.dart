import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Preset accent colors a user can pick from in Settings. Each becomes a
/// full Material 3 light+dark ColorScheme via [ColorScheme.fromSeed], so
/// adding a new option here is the only step needed - no other theme
/// code changes.
enum AppColorScheme {
  green('Green', Color(0xFF3E6B4F)),
  blue('Blue', Color(0xFF2E5C8A)),
  rust('Rust', Color(0xFF8A4A2E)),
  plum('Plum', Color(0xFF6B3E5C)),
  slate('Slate', Color(0xFF46505C));

  final String label;
  final Color seedColor;
  const AppColorScheme(this.label, this.seedColor);
}

/// Overridden with a real, already-loaded instance in main().
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(
      'sharedPreferencesProvider must be overridden in main()');
});

const _themeModeKey = 'settings.theme_mode';
const _colorSchemeKey = 'settings.color_scheme';

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    final stored = ref.read(sharedPreferencesProvider).getString(_themeModeKey);
    return ThemeMode.values
        .firstWhere((m) => m.name == stored, orElse: () => ThemeMode.system);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    await ref.read(sharedPreferencesProvider).setString(_themeModeKey, mode.name);
  }
}

final themeModeProvider =
    NotifierProvider<ThemeModeNotifier, ThemeMode>(ThemeModeNotifier.new);

class AppColorSchemeNotifier extends Notifier<AppColorScheme> {
  @override
  AppColorScheme build() {
    final stored =
        ref.read(sharedPreferencesProvider).getString(_colorSchemeKey);
    return AppColorScheme.values.firstWhere((c) => c.name == stored,
        orElse: () => AppColorScheme.green);
  }

  Future<void> setColorScheme(AppColorScheme scheme) async {
    state = scheme;
    await ref
        .read(sharedPreferencesProvider)
        .setString(_colorSchemeKey, scheme.name);
  }
}

final appColorSchemeProvider =
    NotifierProvider<AppColorSchemeNotifier, AppColorScheme>(
        AppColorSchemeNotifier.new);
