import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';

/// A compact dropdown for switching which species the Animals/Breeding
/// tabs show. Hidden when only one species is seeded, since there's
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
        return DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: current.id,
            icon: const Icon(Icons.arrow_drop_down),
            items: list
                .map((s) => DropdownMenuItem(value: s.id, child: Text(s.name)))
                .toList(),
            onChanged: (id) =>
                ref.read(selectedSpeciesIdProvider.notifier).select(id),
          ),
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}
