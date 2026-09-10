import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../data/repositories/breeding_repository.dart';
import '../../domain/genetics/genetics_models.dart';

class BreedingPredictionScreen extends ConsumerWidget {
  final String pairingId;
  final String sireName;
  final String damName;

  const BreedingPredictionScreen({
    super.key,
    required this.pairingId,
    required this.sireName,
    required this.damName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final geneticsAsync = ref.watch(geneticsPredictionProvider(pairingId));
    final traitsAsync = ref.watch(traitPredictionsProvider(pairingId));

    return Scaffold(
      appBar: AppBar(title: Text('$sireName × $damName')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Plumage prediction',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          geneticsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Text('Error: $e'),
            data: (prediction) => _GeneticsResult(prediction: prediction),
          ),
          const SizedBox(height: 24),
          Text('Production estimate',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          traitsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Text('Error: $e'),
            data: (rows) => Column(
              children: [
                for (final row in rows)
                  Card(
                    child: ListTile(
                      title: Text(row.traitName),
                      subtitle: Text(row.basis),
                      trailing: Text(
                        row.predictedValue == null
                            ? 'N/A'
                            : '${row.predictedValue!.toStringAsFixed(1)} ${row.unit}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GeneticsResult extends StatelessWidget {
  final PairingGeneticsPrediction prediction;
  const _GeneticsResult({required this.prediction});

  @override
  Widget build(BuildContext context) {
    if (prediction.outcomes.isEmpty) {
      return const Text('No prediction available.');
    }

    final bySex = <AnimalSex, List<OffspringPredictionRow>>{};
    for (final o in prediction.outcomes) {
      bySex.putIfAbsent(o.sex, () => []).add(o);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (prediction.skippedLoci.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'Not predicted (genotype unknown for at least one parent): '
              '${prediction.skippedLoci.join(', ')}',
              style: const TextStyle(color: Colors.orange, fontSize: 12),
            ),
          ),
        for (final sex in [AnimalSex.male, AnimalSex.female])
          if (bySex[sex] != null) _SexSection(sex: sex, rows: bySex[sex]!),
      ],
    );
  }
}

class _SexSection extends StatelessWidget {
  final AnimalSex sex;
  final List<OffspringPredictionRow> rows;
  const _SexSection({required this.sex, required this.rows});

  @override
  Widget build(BuildContext context) {
    final label = sex == AnimalSex.male ? 'Male offspring' : 'Female offspring';
    final totalProbability =
        rows.fold<double>(0, (acc, r) => acc + r.probability);

    final sorted = [...rows]
      ..sort((a, b) => b.probability.compareTo(a.probability));

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label (${(totalProbability * 100).toStringAsFixed(0)}% of clutch)',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          for (final row in sorted)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  SizedBox(
                    width: 56,
                    child: Text(
                      '${(row.probability * 100).toStringAsFixed(1)}%',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(child: Text(row.description)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
