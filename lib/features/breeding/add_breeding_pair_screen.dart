import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import 'breeding_prediction_screen.dart';

class AddBreedingPairScreen extends ConsumerStatefulWidget {
  const AddBreedingPairScreen({super.key});

  @override
  ConsumerState<AddBreedingPairScreen> createState() =>
      _AddBreedingPairScreenState();
}

class _AddBreedingPairScreenState
    extends ConsumerState<AddBreedingPairScreen> {
  String? _sireId;
  String? _damId;
  final _notesController = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animalsAsync = ref.watch(animalsProvider(null));
    final speciesAsync = ref.watch(chickenSpeciesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Add Breeding Pair')),
      body: animalsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
        data: (animals) {
          final sires = animals.where((a) => a.sex == 'male').toList();
          final dams = animals.where((a) => a.sex == 'female').toList();

          if (sires.isEmpty || dams.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'You need at least one male and one female animal '
                'before you can create a breeding pair.',
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              DropdownButtonFormField<String>(
                initialValue: _sireId,
                decoration: const InputDecoration(labelText: 'Sire'),
                items: sires
                    .map((a) =>
                        DropdownMenuItem(value: a.id, child: Text(a.name)))
                    .toList(),
                onChanged: (v) => setState(() => _sireId = v),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _damId,
                decoration: const InputDecoration(labelText: 'Dam'),
                items: dams
                    .map((a) =>
                        DropdownMenuItem(value: a.id, child: Text(a.name)))
                    .toList(),
                onChanged: (v) => setState(() => _damId = v),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Notes'),
                maxLines: 2,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _saving || _sireId == null || _damId == null
                    ? null
                    : () => _save(speciesAsync.value?.id),
                child: _saving
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Create Pairing'),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _save(String? speciesId) async {
    if (speciesId == null || _sireId == null || _damId == null) return;
    setState(() => _saving = true);
    try {
      final repo = ref.read(breedingRepositoryProvider);
      final pairingId = await repo.createPairing(
        speciesId: speciesId,
        sireId: _sireId!,
        damId: _damId!,
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
      );

      if (!mounted) return;
      final animals = ref.read(animalsProvider(null)).value ?? [];
      String nameFor(String? id, String fallback) {
        for (final a in animals) {
          if (a.id == id) return a.name;
        }
        return fallback;
      }

      final sireName = nameFor(_sireId, 'Sire');
      final damName = nameFor(_damId, 'Dam');

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => BreedingPredictionScreen(
            pairingId: pairingId,
            sireName: sireName,
            damName: damName,
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}
