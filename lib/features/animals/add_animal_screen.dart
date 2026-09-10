import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../data/database/app_database.dart';
import '../../domain/genetics/genetics_models.dart';
import 'widgets/locus_genotype_field.dart';

class AddAnimalScreen extends ConsumerStatefulWidget {
  final String speciesId;
  const AddAnimalScreen({super.key, required this.speciesId});

  @override
  ConsumerState<AddAnimalScreen> createState() => _AddAnimalScreenState();
}

class _AddAnimalScreenState extends ConsumerState<AddAnimalScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  String _sex = 'unknown';
  String? _sireId;
  String? _damId;

  /// locusId -> (allele1Id, allele2Id)
  final Map<String, (String?, String?)> _genotypeSelections = {};

  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final speciesAsync = ref.watch(speciesByIdProvider(widget.speciesId));
    final lociAsync = ref.watch(lociForSpeciesProvider(widget.speciesId));
    final animalsAsync = ref.watch(animalsProvider(widget.speciesId));

    return Scaffold(
      appBar: AppBar(title: const Text('Add Animal')),
      body: speciesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
        data: (species) {
          if (species == null) {
            return const Center(child: Text('Species not found.'));
          }
          final sexSystem = parseSexDeterminationSystem(
              species.sexDeterminationSystem);
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text('Species: ${species.name}',
                    style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name / Tag'),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: _sex,
                  decoration: const InputDecoration(labelText: 'Sex'),
                  items: const [
                    DropdownMenuItem(value: 'male', child: Text('Male')),
                    DropdownMenuItem(value: 'female', child: Text('Female')),
                    DropdownMenuItem(
                        value: 'unknown', child: Text('Unknown')),
                  ],
                  onChanged: (v) => setState(() => _sex = v ?? 'unknown'),
                ),
                const SizedBox(height: 12),
                animalsAsync.when(
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (animals) {
                    final sires =
                        animals.where((a) => a.sex == 'male').toList();
                    final dams =
                        animals.where((a) => a.sex == 'female').toList();
                    return Column(
                      children: [
                        DropdownButtonFormField<String?>(
                          initialValue: _sireId,
                          decoration:
                              const InputDecoration(labelText: 'Sire (optional)'),
                          items: [
                            const DropdownMenuItem(
                                value: null, child: Text('Unknown')),
                            ...sires.map((a) => DropdownMenuItem(
                                value: a.id, child: Text(a.name))),
                          ],
                          onChanged: (v) => setState(() => _sireId = v),
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String?>(
                          initialValue: _damId,
                          decoration:
                              const InputDecoration(labelText: 'Dam (optional)'),
                          items: [
                            const DropdownMenuItem(
                                value: null, child: Text('Unknown')),
                            ...dams.map((a) => DropdownMenuItem(
                                value: a.id, child: Text(a.name))),
                          ],
                          onChanged: (v) => setState(() => _damId = v),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24),
                Text('Known genotype (optional)',
                    style: Theme.of(context).textTheme.titleMedium),
                const Text(
                  'Leave a locus unset if you don\'t know it - '
                  'predictions will simply skip loci with unknown '
                  'genotype for either parent.',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                lociAsync.when(
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (loci) => Column(
                    children: [
                      for (final locus in loci)
                        _buildLocusRow(locus, sexSystem),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _notesController,
                  decoration: const InputDecoration(labelText: 'Notes'),
                  maxLines: 2,
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _saving ? null : () => _save(species),
                  child: _saving
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Save Animal'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLocusRow(LocusInfo locus, SexDeterminationSystem sexSystem) {
    final hemizygous = isHemizygousForAnimal(locus, _sex, sexSystem);
    final current = _genotypeSelections[locus.id] ?? (null, null);

    return LocusGenotypeField(
      locus: locus,
      hemizygous: hemizygous,
      allele1Id: current.$1,
      allele2Id: current.$2,
      onChanged: (a1, a2) => setState(() {
        _genotypeSelections[locus.id] = (a1, a2);
      }),
    );
  }

  Future<void> _save(SpeciesRow species) async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final repo = ref.read(animalRepositoryProvider);
      final animalId = await repo.addAnimal(
        speciesId: species.id,
        name: _nameController.text.trim(),
        sex: _sex,
        sireId: _sireId,
        damId: _damId,
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
      );

      for (final entry in _genotypeSelections.entries) {
        final (a1, a2) = entry.value;
        if (a1 == null) continue;
        await repo.setGenotype(
          animalId: animalId,
          locusId: entry.key,
          allele1Id: a1,
          allele2Id: a2,
        );
      }

      if (mounted) Navigator.of(context).pop();
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}
