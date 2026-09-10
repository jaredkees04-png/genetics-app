import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';

/// A dropdown for switching which species the Animals/Breeding tabs
/// show, styled as a colored pill to match the FAB (same
/// primaryContainer/16px-radius treatment) rather than a bare text
/// dropdown. Hidden when only one species is seeded, since there's
/// nothing to switch between yet.
class SpeciesSelector extends ConsumerWidget {
  const SpeciesSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speciesAsync = ref.watch(speciesListProvider);
    final current = ref.watch(currentSpeciesProvider).value;

    return speciesAsync.maybeWhen(
      data: (list) {
        if (list.length <= 1 || current == null) return const SizedBox.shrink();
        final colorScheme = Theme.of(context).colorScheme;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorScheme.onSurface, width: 1.5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: current.id,
              isDense: true,
              icon: Icon(Icons.arrow_drop_down, color: colorScheme.onPrimaryContainer),
              style: TextStyle(
                color: colorScheme.onPrimaryContainer,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              dropdownColor: colorScheme.surfaceContainerHigh,
              items: list
                  .map((s) => DropdownMenuItem(value: s.id, child: Text(s.name)))
                  .toList(),
              onChanged: (id) =>
                  ref.read(selectedSpeciesIdProvider.notifier).select(id),
            ),
          ),
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}
