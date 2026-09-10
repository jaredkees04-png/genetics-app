import 'package:flutter/material.dart';

import 'settings_screen.dart';

/// A gear icon dropped into the app bar of each main tab - see
/// SpeciesSelector for the sibling widget it's placed alongside.
class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings_outlined),
      tooltip: 'Settings',
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const SettingsScreen()),
      ),
    );
  }
}
