import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../data/database/app_database.dart';
import '../../domain/genetics/genetics_models.dart';
import 'widgets/locus_genotype_field.dart';

class AnimalDetailScreen extends ConsumerWidget {
  final String animalId;
  const AnimalDetailScreen({super.key, required this.animalId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animalAsync = ref.watch(animalByIdProvider(animalId));

    return Scaffold(
      appBar: AppBar(title: Text(animalAsync.value?.name ?? 'Animal')),
      body: animalAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
        data: (animal) {
          if (animal == null) {
            return const Center(child: Text('Animal not found.'));
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _InfoSection(animal: animal),
              const SizedBox(height: 24),
              _GenotypeSection(animal: animal),
              const SizedBox(height: 24),
              _PhenotypeSection(animal: animal),
              const SizedBox(height: 24),
              _TraitRecordsSection(animal: animal),
            ],
          );
        },
      ),
    );
  }
}

class _InfoSection extends ConsumerWidget {
  final Animal animal;
  const _InfoSection({required this.animal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animalsAsync = ref.watch(animalsProvider(animal.speciesId));
    String nameFor(String? id) {
      if (id == null) return 'Unknown';
      for (final a in animalsAsync.value ?? const <Animal>[]) {
        if (a.id == id) return a.name;
      }
      return 'Unknown';
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(animal.name, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Sex: ${animal.sex}'),
            Text('Father: ${nameFor(animal.sireId)}'),
            Text('Mother: ${nameFor(animal.damId)}'),
            if (animal.notes != null && animal.notes!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('Notes: ${animal.notes}'),
              ),
          ],
        ),
      ),
    );
  }
}

class _GenotypeSection extends ConsumerWidget {
  final Animal animal;
  const _GenotypeSection({required this.animal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speciesAsync = ref.watch(speciesByIdProvider(animal.speciesId));
    final lociAsync = ref.watch(lociForSpeciesProvider(animal.speciesId));
    final genotypesAsync = ref.watch(animalGenotypesProvider(animal.id));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Genotype', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        lociAsync.when(
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
          data: (loci) {
            final species = speciesAsync.value;
            if (species == null) return const SizedBox.shrink();
            final sexSystem =
                parseSexDeterminationSystem(species.sexDeterminationSystem);
            final genotypes = genotypesAsync.value ?? const <AnimalGenotype>[];
            return Column(
              children: [
                for (final locus in loci)
                  _buildRow(context, ref, locus, genotypes, sexSystem),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildRow(BuildContext context, WidgetRef ref, LocusInfo locus,
      List<AnimalGenotype> genotypes, SexDeterminationSystem sexSystem) {
    AnimalGenotype? existing;
    for (final g in genotypes) {
      if (g.locusId == locus.id) existing = g;
    }
    final hemizygous = isHemizygousForAnimal(locus, animal.sex, sexSystem);

    return LocusGenotypeField(
      locus: locus,
      hemizygous: hemizygous,
      allele1Id: existing?.allele1Id,
      allele2Id: existing?.allele2Id,
      onChanged: (a1, a2) async {
        final repo = ref.read(animalRepositoryProvider);
        if (a1 == null) {
          await repo.clearGenotype(animalId: animal.id, locusId: locus.id);
        } else {
          await repo.setGenotype(
            animalId: animal.id,
            locusId: locus.id,
            allele1Id: a1,
            allele2Id: a2,
          );
        }
      },
    );
  }
}

class _PhenotypeSection extends ConsumerWidget {
  final Animal animal;
  const _PhenotypeSection({required this.animal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final traitsAsync = ref.watch(phenotypeTraitsForSpeciesProvider(animal.speciesId));
    final observationsAsync =
        ref.watch(animalPhenotypeObservationsProvider(animal.id));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Observed Phenotype', style: Theme.of(context).textTheme.titleMedium),
        const Text(
          'Use this when you know what the animal looks like but not its '
          'tested genotype.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        traitsAsync.when(
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
          data: (traits) {
            final observations =
                observationsAsync.value ?? const <AnimalPhenotypeObservation>[];
            return Column(
              children: [
                for (final trait in traits)
                  _buildRow(context, ref, trait, observations),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildRow(BuildContext context, WidgetRef ref, PhenotypeTraitInfo trait,
      List<AnimalPhenotypeObservation> observations) {
    AnimalPhenotypeObservation? existing;
    for (final o in observations) {
      if (o.phenotypeTraitId == trait.id) existing = o;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String?>(
        initialValue: existing?.selectedOptionId,
        isExpanded: true,
        decoration: InputDecoration(labelText: trait.name, isDense: true),
        items: [
          const DropdownMenuItem(value: null, child: Text('Unknown')),
          ...trait.options.map(
              (o) => DropdownMenuItem(value: o.id, child: Text(o.label))),
        ],
        onChanged: (v) => ref.read(animalRepositoryProvider).setPhenotypeObservation(
              animalId: animal.id,
              phenotypeTraitId: trait.id,
              selectedOptionId: v,
            ),
      ),
    );
  }
}

class _TraitRecordsSection extends ConsumerWidget {
  final Animal animal;
  const _TraitRecordsSection({required this.animal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final traitDefsAsync =
        ref.watch(traitDefinitionsForSpeciesProvider(animal.speciesId));
    final recordsAsync = ref.watch(animalTraitRecordsProvider(animal.id));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Production Records', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        traitDefsAsync.when(
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
          data: (traitDefs) {
            final records = recordsAsync.value ?? const <TraitRecord>[];
            return Column(
              children: [
                for (final def in traitDefs)
                  _TraitDefSection(
                    animal: animal,
                    traitDef: def,
                    records:
                        records.where((r) => r.traitDefinitionId == def.id).toList(),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _TraitDefSection extends ConsumerWidget {
  final Animal animal;
  final TraitDefinition traitDef;
  final List<TraitRecord> records;

  const _TraitDefSection({
    required this.animal,
    required this.traitDef,
    required this.records,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('${traitDef.name} (${traitDef.unit})',
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
                TextButton.icon(
                  onPressed: () => _showAddDialog(context, ref),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Add'),
                ),
              ],
            ),
            if (records.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text('No records yet.',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              )
            else
              for (final r in records)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Text(_formatDate(r.recordedDate)),
                      const SizedBox(width: 12),
                      Text(r.value.toStringAsFixed(1)),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  Future<void> _showAddDialog(BuildContext context, WidgetRef ref) async {
    final valueController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (dialogContext, setDialogState) {
            return AlertDialog(
              title: Text('Add ${traitDef.name} record'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(_formatDate(selectedDate)),
                    trailing: const Icon(Icons.calendar_today, size: 18),
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: dialogContext,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setDialogState(() => selectedDate = picked);
                      }
                    },
                  ),
                  TextField(
                    controller: valueController,
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true),
                    decoration: InputDecoration(labelText: traitDef.unit),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () async {
                    final value = double.tryParse(valueController.text);
                    if (value == null) return;
                    await ref.read(traitRepositoryProvider).addTraitRecord(
                          animalId: animal.id,
                          traitDefinitionId: traitDef.id,
                          recordedDate: selectedDate,
                          value: value,
                        );
                    if (dialogContext.mounted) Navigator.of(dialogContext).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
