import 'dart:convert';

import 'package:drift/drift.dart';

import '../../domain/genetics/chicken_phenotype_resolver.dart';
import '../../domain/genetics/genetics_engine.dart';
import '../../domain/genetics/genetics_models.dart';
import '../../domain/genetics/phenotype_resolver.dart';
import '../database/app_database.dart';
import '../database/id_generator.dart';
import 'genetics_repository.dart';

/// A single genotype outcome for one locus, ready for display.
class LocusPredictionRow {
  final String locusKey;
  final String locusName;
  final String genotypeLabel;
  final String phenotypeLabel;
  final double probabilityWithinSex;

  const LocusPredictionRow({
    required this.locusKey,
    required this.locusName,
    required this.genotypeLabel,
    required this.phenotypeLabel,
    required this.probabilityWithinSex,
  });
}

/// One combined offspring outcome (every locus resolved together) for
/// display, grouped by predicted sex.
class OffspringPredictionRow {
  final AnimalSex sex;
  final double probability;
  final String description;

  const OffspringPredictionRow({
    required this.sex,
    required this.probability,
    required this.description,
  });
}

class PairingGeneticsPrediction {
  final List<OffspringPredictionRow> outcomes;
  final List<String> skippedLoci;

  const PairingGeneticsPrediction({
    required this.outcomes,
    required this.skippedLoci,
  });
}

class TraitPredictionRow {
  final String traitName;
  final String unit;
  final double? predictedValue;
  final String basis;

  const TraitPredictionRow({
    required this.traitName,
    required this.unit,
    required this.predictedValue,
    required this.basis,
  });
}

/// Orchestrates a pairing's Punnett-square style color/pattern
/// prediction and its quantitative production-trait estimates, and
/// persists a snapshot of each so there's a record of what was predicted
/// and when.
class BreedingRepository {
  final AppDatabase db;
  final GeneticsRepository genetics;
  static const _engine = GeneticsEngine();

  const BreedingRepository(this.db, this.genetics);

  /// Species without a dedicated resolver fall back to raw genotype
  /// labels (e.g. "E/e+") instead of a named phenotype.
  PhenotypeResolver _resolverForSpecies(String speciesName) {
    if (speciesName == 'Chicken') return const ChickenPhenotypeResolver();
    return const DefaultPhenotypeResolver();
  }

  Stream<List<BreedingPairing>> watchPairings({String? speciesId}) {
    final query = db.select(db.breedingPairings)
      ..where((t) => t.deletedAt.isNull());
    if (speciesId != null) {
      query.where((t) => t.speciesId.equals(speciesId));
    }
    query.orderBy([
      (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
    ]);
    return query.watch();
  }

  Future<String> createPairing({
    required String speciesId,
    required String sireId,
    required String damId,
    DateTime? pairingDate,
    String? notes,
  }) async {
    final id = newId();
    await db.into(db.breedingPairings).insert(
          BreedingPairingsCompanion.insert(
            id: Value(id),
            speciesId: speciesId,
            sireId: sireId,
            damId: damId,
            pairingDate: Value(pairingDate),
            notes: Value(notes),
          ),
        );
    return id;
  }

  Future<PairingGeneticsPrediction> computeGeneticsPrediction(
      String pairingId) async {
    final pairing = await (db.select(db.breedingPairings)
          ..where((t) => t.id.equals(pairingId)))
        .getSingle();
    final species = await (db.select(db.species)
          ..where((t) => t.id.equals(pairing.speciesId)))
        .getSingle();
    final sire = await (db.select(db.animals)
          ..where((t) => t.id.equals(pairing.sireId)))
        .getSingle();
    final dam = await (db.select(db.animals)
          ..where((t) => t.id.equals(pairing.damId)))
        .getSingle();

    final sexSystem = parseSexDeterminationSystem(species.sexDeterminationSystem);
    final loci = await genetics.lociForSpecies(species.id);

    final sireGenotypes = await genetics.resolveGenotypesForAnimal(
      animalId: sire.id,
      animalSex: _parseSex(sire.sex),
      loci: loci,
      sexSystem: sexSystem,
    );
    final damGenotypes = await genetics.resolveGenotypesForAnimal(
      animalId: dam.id,
      animalSex: _parseSex(dam.sex),
      loci: loci,
      sexSystem: sexSystem,
    );

    final prediction = _engine.predictPairing(
      loci: loci,
      sireGenotypesByLocusId: sireGenotypes,
      damGenotypesByLocusId: damGenotypes,
      sexSystem: sexSystem,
    );

    final resolver = _resolverForSpecies(species.name);
    final locusById = {for (final l in loci) l.id: l};

    final rows = prediction.outcomes.map((outcome) {
      final byKey = outcome.genotypesByLocusId.map(
        (locusId, genotype) =>
            MapEntry(locusById[locusId]!.key, genotype),
      );
      return OffspringPredictionRow(
        sex: outcome.sex,
        probability: outcome.probability,
        description: byKey.isEmpty
            ? '(no loci with known genotype for this pairing)'
            : resolver.describeOffspring(byKey),
      );
    }).toList();

    final skippedNames = prediction.skippedLoci
        .map((key) => loci.firstWhere((l) => l.key == key).name)
        .toList();

    final result = PairingGeneticsPrediction(
      outcomes: rows,
      skippedLoci: skippedNames,
    );

    await db.into(db.breedingPredictions).insert(
          BreedingPredictionsCompanion.insert(
            pairingId: pairingId,
            resultJson: _encodeSnapshot(result),
          ),
        );

    return result;
  }

  String _encodeSnapshot(PairingGeneticsPrediction result) {
    return jsonEncode({
      'skippedLoci': result.skippedLoci,
      'outcomes': result.outcomes
          .map((o) => {
                'sex': o.sex.name,
                'probability': o.probability,
                'description': o.description,
              })
          .toList(),
    });
  }

  Future<List<TraitPredictionRow>> computeTraitPredictions(
      String pairingId) async {
    final pairing = await (db.select(db.breedingPairings)
          ..where((t) => t.id.equals(pairingId)))
        .getSingle();
    final traitDefs = await (db.select(db.traitDefinitions)
          ..where((t) => t.speciesId.equals(pairing.speciesId)))
        .get();

    final rows = <TraitPredictionRow>[];
    for (final trait in traitDefs) {
      final sireAvg = await _averageTraitValue(pairing.sireId, trait.id);
      final damAvg = await _averageTraitValue(pairing.damId, trait.id);

      double? predicted;
      String basis;
      if (sireAvg != null && damAvg != null) {
        predicted = (sireAvg + damAvg) / 2;
        basis = 'Mid-parent average of father and mother records';
      } else if (sireAvg != null) {
        predicted = sireAvg;
        basis = 'Father records only (no mother records yet)';
      } else if (damAvg != null) {
        predicted = damAvg;
        basis = 'Mother records only (no father records yet)';
      } else {
        predicted = null;
        basis = 'No records for either parent yet';
      }

      if (predicted != null) {
        await db.into(db.traitPredictions).insert(
              TraitPredictionsCompanion.insert(
                pairingId: pairingId,
                traitDefinitionId: trait.id,
                predictedValue: predicted,
                basis: Value(basis),
              ),
            );
      }

      rows.add(TraitPredictionRow(
        traitName: trait.name,
        unit: trait.unit,
        predictedValue: predicted,
        basis: basis,
      ));
    }
    return rows;
  }

  Future<double?> _averageTraitValue(String animalId, String traitDefId) async {
    final records = await (db.select(db.traitRecords)
          ..where((t) =>
              t.animalId.equals(animalId) &
              t.traitDefinitionId.equals(traitDefId)))
        .get();
    if (records.isEmpty) return null;
    final sum = records.fold<double>(0, (acc, r) => acc + r.value);
    return sum / records.length;
  }

  AnimalSex _parseSex(String value) {
    switch (value) {
      case 'male':
        return AnimalSex.male;
      case 'female':
        return AnimalSex.female;
      default:
        return AnimalSex.unknown;
    }
  }
}
