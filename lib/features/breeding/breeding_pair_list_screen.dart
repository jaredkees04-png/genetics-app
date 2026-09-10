import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import 'add_breeding_pair_screen.dart';
import 'breeding_prediction_screen.dart';

class BreedingPairListScreen extends ConsumerWidget {
  const BreedingPairListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pairingsAsync = ref.watch(pairingsProvider(null));
    final animalsAsync = ref.watch(animalsProvider(null));

    return Scaffold(
      appBar: AppBar(title: const Text('Breeding Pairs')),
      body: pairingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
        data: (pairings) {
          if (pairings.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'No breeding pairs yet. Add at least two animals of '
                  'opposite sex first, then tap + to pair them.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          final animalsById = {
            for (final a in animalsAsync.value ?? []) a.id: a,
          };
          return ListView.separated(
            itemCount: pairings.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final pairing = pairings[i];
              final sire = animalsById[pairing.sireId];
              final dam = animalsById[pairing.damId];
              return ListTile(
                leading: const Icon(Icons.favorite_outline),
                title: Text(
                    '${sire?.name ?? '?'} × ${dam?.name ?? '?'}'),
                subtitle: Text('Status: ${pairing.status}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BreedingPredictionScreen(
                      pairingId: pairing.id,
                      sireName: sire?.name ?? 'Sire',
                      damName: dam?.name ?? 'Dam',
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const AddBreedingPairScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
