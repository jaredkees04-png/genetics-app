import 'package:flutter/material.dart';

/// Builds a proper light/dark Material 3 theme pair from any seed color -
/// see AppColorScheme in app_settings.dart for the picker that chooses
/// which one.
ThemeData buildLightTheme(Color seedColor) =>
    _buildTheme(ColorScheme.fromSeed(seedColor: seedColor));

ThemeData buildDarkTheme(Color seedColor) => _buildTheme(
      ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.dark,
      ),
    );

ThemeData _buildTheme(ColorScheme colorScheme) {
  final radius = BorderRadius.circular(14);

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 3,
      surfaceTintColor: colorScheme.surfaceTint,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(borderRadius: radius),
      margin: EdgeInsets.zero,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: colorScheme.surfaceContainer,
      indicatorColor: colorScheme.secondaryContainer,
      elevation: 0,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primaryContainer,
      foregroundColor: colorScheme.onPrimaryContainer,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      // Extra top padding (vs. bottom) leaves room for the label to float
      // up inside the filled box without colliding with its top edge -
      // a plain symmetric padding was too tight for that transition.
      contentPadding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerTheme: DividerThemeData(color: colorScheme.outlineVariant),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: SegmentedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        side: BorderSide(color: colorScheme.outline, width: 1.5),
      ),
    ),
  );
}
