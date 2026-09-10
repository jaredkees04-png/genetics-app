// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SpeciesTable extends Species with TableInfo<$SpeciesTable, SpeciesRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpeciesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sexDeterminationSystemMeta =
      const VerificationMeta('sexDeterminationSystem');
  @override
  late final GeneratedColumn<String> sexDeterminationSystem =
      GeneratedColumn<String>(
        'sex_determination_system',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    sexDeterminationSystem,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'species';
  @override
  VerificationContext validateIntegrity(
    Insertable<SpeciesRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sex_determination_system')) {
      context.handle(
        _sexDeterminationSystemMeta,
        sexDeterminationSystem.isAcceptableOrUnknown(
          data['sex_determination_system']!,
          _sexDeterminationSystemMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sexDeterminationSystemMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SpeciesRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpeciesRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sexDeterminationSystem: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex_determination_system'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SpeciesTable createAlias(String alias) {
    return $SpeciesTable(attachedDatabase, alias);
  }
}

class SpeciesRow extends DataClass implements Insertable<SpeciesRow> {
  final String id;
  final String name;
  final String sexDeterminationSystem;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SpeciesRow({
    required this.id,
    required this.name,
    required this.sexDeterminationSystem,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['sex_determination_system'] = Variable<String>(sexDeterminationSystem);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SpeciesCompanion toCompanion(bool nullToAbsent) {
    return SpeciesCompanion(
      id: Value(id),
      name: Value(name),
      sexDeterminationSystem: Value(sexDeterminationSystem),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SpeciesRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpeciesRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sexDeterminationSystem: serializer.fromJson<String>(
        json['sexDeterminationSystem'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'sexDeterminationSystem': serializer.toJson<String>(
        sexDeterminationSystem,
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SpeciesRow copyWith({
    String? id,
    String? name,
    String? sexDeterminationSystem,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SpeciesRow(
    id: id ?? this.id,
    name: name ?? this.name,
    sexDeterminationSystem:
        sexDeterminationSystem ?? this.sexDeterminationSystem,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SpeciesRow copyWithCompanion(SpeciesCompanion data) {
    return SpeciesRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sexDeterminationSystem: data.sexDeterminationSystem.present
          ? data.sexDeterminationSystem.value
          : this.sexDeterminationSystem,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpeciesRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sexDeterminationSystem: $sexDeterminationSystem, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, sexDeterminationSystem, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpeciesRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.sexDeterminationSystem == this.sexDeterminationSystem &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SpeciesCompanion extends UpdateCompanion<SpeciesRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> sexDeterminationSystem;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SpeciesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sexDeterminationSystem = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SpeciesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String sexDeterminationSystem,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       sexDeterminationSystem = Value(sexDeterminationSystem);
  static Insertable<SpeciesRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? sexDeterminationSystem,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sexDeterminationSystem != null)
        'sex_determination_system': sexDeterminationSystem,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SpeciesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? sexDeterminationSystem,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SpeciesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sexDeterminationSystem:
          sexDeterminationSystem ?? this.sexDeterminationSystem,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sexDeterminationSystem.present) {
      map['sex_determination_system'] = Variable<String>(
        sexDeterminationSystem.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpeciesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sexDeterminationSystem: $sexDeterminationSystem, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SpeciesReproductionProfilesTable extends SpeciesReproductionProfiles
    with
        TableInfo<
          $SpeciesReproductionProfilesTable,
          SpeciesReproductionProfile
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpeciesReproductionProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _speciesIdMeta = const VerificationMeta(
    'speciesId',
  );
  @override
  late final GeneratedColumn<String> speciesId = GeneratedColumn<String>(
    'species_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES species (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _gestationOrIncubationDaysMeta =
      const VerificationMeta('gestationOrIncubationDays');
  @override
  late final GeneratedColumn<int> gestationOrIncubationDays =
      GeneratedColumn<int>(
        'gestation_or_incubation_days',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _offspringUnitMeta = const VerificationMeta(
    'offspringUnit',
  );
  @override
  late final GeneratedColumn<String> offspringUnit = GeneratedColumn<String>(
    'offspring_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typicalOffspringMinMeta =
      const VerificationMeta('typicalOffspringMin');
  @override
  late final GeneratedColumn<int> typicalOffspringMin = GeneratedColumn<int>(
    'typical_offspring_min',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typicalOffspringMaxMeta =
      const VerificationMeta('typicalOffspringMax');
  @override
  late final GeneratedColumn<int> typicalOffspringMax = GeneratedColumn<int>(
    'typical_offspring_max',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    speciesId,
    gestationOrIncubationDays,
    offspringUnit,
    typicalOffspringMin,
    typicalOffspringMax,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'species_reproduction_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<SpeciesReproductionProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('species_id')) {
      context.handle(
        _speciesIdMeta,
        speciesId.isAcceptableOrUnknown(data['species_id']!, _speciesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesIdMeta);
    }
    if (data.containsKey('gestation_or_incubation_days')) {
      context.handle(
        _gestationOrIncubationDaysMeta,
        gestationOrIncubationDays.isAcceptableOrUnknown(
          data['gestation_or_incubation_days']!,
          _gestationOrIncubationDaysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_gestationOrIncubationDaysMeta);
    }
    if (data.containsKey('offspring_unit')) {
      context.handle(
        _offspringUnitMeta,
        offspringUnit.isAcceptableOrUnknown(
          data['offspring_unit']!,
          _offspringUnitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_offspringUnitMeta);
    }
    if (data.containsKey('typical_offspring_min')) {
      context.handle(
        _typicalOffspringMinMeta,
        typicalOffspringMin.isAcceptableOrUnknown(
          data['typical_offspring_min']!,
          _typicalOffspringMinMeta,
        ),
      );
    }
    if (data.containsKey('typical_offspring_max')) {
      context.handle(
        _typicalOffspringMaxMeta,
        typicalOffspringMax.isAcceptableOrUnknown(
          data['typical_offspring_max']!,
          _typicalOffspringMaxMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SpeciesReproductionProfile map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpeciesReproductionProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      speciesId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species_id'],
      )!,
      gestationOrIncubationDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}gestation_or_incubation_days'],
      )!,
      offspringUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}offspring_unit'],
      )!,
      typicalOffspringMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}typical_offspring_min'],
      ),
      typicalOffspringMax: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}typical_offspring_max'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SpeciesReproductionProfilesTable createAlias(String alias) {
    return $SpeciesReproductionProfilesTable(attachedDatabase, alias);
  }
}

class SpeciesReproductionProfile extends DataClass
    implements Insertable<SpeciesReproductionProfile> {
  final String id;
  final String speciesId;

  /// Incubation days (eggs) or gestation days (live birth).
  final int gestationOrIncubationDays;

  /// 'clutch' | 'litter' | 'single_or_twin_birth'
  final String offspringUnit;
  final int? typicalOffspringMin;
  final int? typicalOffspringMax;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SpeciesReproductionProfile({
    required this.id,
    required this.speciesId,
    required this.gestationOrIncubationDays,
    required this.offspringUnit,
    this.typicalOffspringMin,
    this.typicalOffspringMax,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['species_id'] = Variable<String>(speciesId);
    map['gestation_or_incubation_days'] = Variable<int>(
      gestationOrIncubationDays,
    );
    map['offspring_unit'] = Variable<String>(offspringUnit);
    if (!nullToAbsent || typicalOffspringMin != null) {
      map['typical_offspring_min'] = Variable<int>(typicalOffspringMin);
    }
    if (!nullToAbsent || typicalOffspringMax != null) {
      map['typical_offspring_max'] = Variable<int>(typicalOffspringMax);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SpeciesReproductionProfilesCompanion toCompanion(bool nullToAbsent) {
    return SpeciesReproductionProfilesCompanion(
      id: Value(id),
      speciesId: Value(speciesId),
      gestationOrIncubationDays: Value(gestationOrIncubationDays),
      offspringUnit: Value(offspringUnit),
      typicalOffspringMin: typicalOffspringMin == null && nullToAbsent
          ? const Value.absent()
          : Value(typicalOffspringMin),
      typicalOffspringMax: typicalOffspringMax == null && nullToAbsent
          ? const Value.absent()
          : Value(typicalOffspringMax),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SpeciesReproductionProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpeciesReproductionProfile(
      id: serializer.fromJson<String>(json['id']),
      speciesId: serializer.fromJson<String>(json['speciesId']),
      gestationOrIncubationDays: serializer.fromJson<int>(
        json['gestationOrIncubationDays'],
      ),
      offspringUnit: serializer.fromJson<String>(json['offspringUnit']),
      typicalOffspringMin: serializer.fromJson<int?>(
        json['typicalOffspringMin'],
      ),
      typicalOffspringMax: serializer.fromJson<int?>(
        json['typicalOffspringMax'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'speciesId': serializer.toJson<String>(speciesId),
      'gestationOrIncubationDays': serializer.toJson<int>(
        gestationOrIncubationDays,
      ),
      'offspringUnit': serializer.toJson<String>(offspringUnit),
      'typicalOffspringMin': serializer.toJson<int?>(typicalOffspringMin),
      'typicalOffspringMax': serializer.toJson<int?>(typicalOffspringMax),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SpeciesReproductionProfile copyWith({
    String? id,
    String? speciesId,
    int? gestationOrIncubationDays,
    String? offspringUnit,
    Value<int?> typicalOffspringMin = const Value.absent(),
    Value<int?> typicalOffspringMax = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SpeciesReproductionProfile(
    id: id ?? this.id,
    speciesId: speciesId ?? this.speciesId,
    gestationOrIncubationDays:
        gestationOrIncubationDays ?? this.gestationOrIncubationDays,
    offspringUnit: offspringUnit ?? this.offspringUnit,
    typicalOffspringMin: typicalOffspringMin.present
        ? typicalOffspringMin.value
        : this.typicalOffspringMin,
    typicalOffspringMax: typicalOffspringMax.present
        ? typicalOffspringMax.value
        : this.typicalOffspringMax,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SpeciesReproductionProfile copyWithCompanion(
    SpeciesReproductionProfilesCompanion data,
  ) {
    return SpeciesReproductionProfile(
      id: data.id.present ? data.id.value : this.id,
      speciesId: data.speciesId.present ? data.speciesId.value : this.speciesId,
      gestationOrIncubationDays: data.gestationOrIncubationDays.present
          ? data.gestationOrIncubationDays.value
          : this.gestationOrIncubationDays,
      offspringUnit: data.offspringUnit.present
          ? data.offspringUnit.value
          : this.offspringUnit,
      typicalOffspringMin: data.typicalOffspringMin.present
          ? data.typicalOffspringMin.value
          : this.typicalOffspringMin,
      typicalOffspringMax: data.typicalOffspringMax.present
          ? data.typicalOffspringMax.value
          : this.typicalOffspringMax,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpeciesReproductionProfile(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('gestationOrIncubationDays: $gestationOrIncubationDays, ')
          ..write('offspringUnit: $offspringUnit, ')
          ..write('typicalOffspringMin: $typicalOffspringMin, ')
          ..write('typicalOffspringMax: $typicalOffspringMax, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    speciesId,
    gestationOrIncubationDays,
    offspringUnit,
    typicalOffspringMin,
    typicalOffspringMax,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpeciesReproductionProfile &&
          other.id == this.id &&
          other.speciesId == this.speciesId &&
          other.gestationOrIncubationDays == this.gestationOrIncubationDays &&
          other.offspringUnit == this.offspringUnit &&
          other.typicalOffspringMin == this.typicalOffspringMin &&
          other.typicalOffspringMax == this.typicalOffspringMax &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SpeciesReproductionProfilesCompanion
    extends UpdateCompanion<SpeciesReproductionProfile> {
  final Value<String> id;
  final Value<String> speciesId;
  final Value<int> gestationOrIncubationDays;
  final Value<String> offspringUnit;
  final Value<int?> typicalOffspringMin;
  final Value<int?> typicalOffspringMax;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SpeciesReproductionProfilesCompanion({
    this.id = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.gestationOrIncubationDays = const Value.absent(),
    this.offspringUnit = const Value.absent(),
    this.typicalOffspringMin = const Value.absent(),
    this.typicalOffspringMax = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SpeciesReproductionProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String speciesId,
    required int gestationOrIncubationDays,
    required String offspringUnit,
    this.typicalOffspringMin = const Value.absent(),
    this.typicalOffspringMax = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : speciesId = Value(speciesId),
       gestationOrIncubationDays = Value(gestationOrIncubationDays),
       offspringUnit = Value(offspringUnit);
  static Insertable<SpeciesReproductionProfile> custom({
    Expression<String>? id,
    Expression<String>? speciesId,
    Expression<int>? gestationOrIncubationDays,
    Expression<String>? offspringUnit,
    Expression<int>? typicalOffspringMin,
    Expression<int>? typicalOffspringMax,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (speciesId != null) 'species_id': speciesId,
      if (gestationOrIncubationDays != null)
        'gestation_or_incubation_days': gestationOrIncubationDays,
      if (offspringUnit != null) 'offspring_unit': offspringUnit,
      if (typicalOffspringMin != null)
        'typical_offspring_min': typicalOffspringMin,
      if (typicalOffspringMax != null)
        'typical_offspring_max': typicalOffspringMax,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SpeciesReproductionProfilesCompanion copyWith({
    Value<String>? id,
    Value<String>? speciesId,
    Value<int>? gestationOrIncubationDays,
    Value<String>? offspringUnit,
    Value<int?>? typicalOffspringMin,
    Value<int?>? typicalOffspringMax,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SpeciesReproductionProfilesCompanion(
      id: id ?? this.id,
      speciesId: speciesId ?? this.speciesId,
      gestationOrIncubationDays:
          gestationOrIncubationDays ?? this.gestationOrIncubationDays,
      offspringUnit: offspringUnit ?? this.offspringUnit,
      typicalOffspringMin: typicalOffspringMin ?? this.typicalOffspringMin,
      typicalOffspringMax: typicalOffspringMax ?? this.typicalOffspringMax,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<String>(speciesId.value);
    }
    if (gestationOrIncubationDays.present) {
      map['gestation_or_incubation_days'] = Variable<int>(
        gestationOrIncubationDays.value,
      );
    }
    if (offspringUnit.present) {
      map['offspring_unit'] = Variable<String>(offspringUnit.value);
    }
    if (typicalOffspringMin.present) {
      map['typical_offspring_min'] = Variable<int>(typicalOffspringMin.value);
    }
    if (typicalOffspringMax.present) {
      map['typical_offspring_max'] = Variable<int>(typicalOffspringMax.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpeciesReproductionProfilesCompanion(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('gestationOrIncubationDays: $gestationOrIncubationDays, ')
          ..write('offspringUnit: $offspringUnit, ')
          ..write('typicalOffspringMin: $typicalOffspringMin, ')
          ..write('typicalOffspringMax: $typicalOffspringMax, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BreedsTable extends Breeds with TableInfo<$BreedsTable, Breed> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BreedsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _speciesIdMeta = const VerificationMeta(
    'speciesId',
  );
  @override
  late final GeneratedColumn<String> speciesId = GeneratedColumn<String>(
    'species_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES species (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    speciesId,
    name,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'breeds';
  @override
  VerificationContext validateIntegrity(
    Insertable<Breed> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('species_id')) {
      context.handle(
        _speciesIdMeta,
        speciesId.isAcceptableOrUnknown(data['species_id']!, _speciesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Breed map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Breed(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      speciesId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $BreedsTable createAlias(String alias) {
    return $BreedsTable(attachedDatabase, alias);
  }
}

class Breed extends DataClass implements Insertable<Breed> {
  final String id;
  final String speciesId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Breed({
    required this.id,
    required this.speciesId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['species_id'] = Variable<String>(speciesId);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BreedsCompanion toCompanion(bool nullToAbsent) {
    return BreedsCompanion(
      id: Value(id),
      speciesId: Value(speciesId),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Breed.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Breed(
      id: serializer.fromJson<String>(json['id']),
      speciesId: serializer.fromJson<String>(json['speciesId']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'speciesId': serializer.toJson<String>(speciesId),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Breed copyWith({
    String? id,
    String? speciesId,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Breed(
    id: id ?? this.id,
    speciesId: speciesId ?? this.speciesId,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Breed copyWithCompanion(BreedsCompanion data) {
    return Breed(
      id: data.id.present ? data.id.value : this.id,
      speciesId: data.speciesId.present ? data.speciesId.value : this.speciesId,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Breed(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, speciesId, name, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Breed &&
          other.id == this.id &&
          other.speciesId == this.speciesId &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BreedsCompanion extends UpdateCompanion<Breed> {
  final Value<String> id;
  final Value<String> speciesId;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const BreedsCompanion({
    this.id = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BreedsCompanion.insert({
    this.id = const Value.absent(),
    required String speciesId,
    required String name,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : speciesId = Value(speciesId),
       name = Value(name);
  static Insertable<Breed> custom({
    Expression<String>? id,
    Expression<String>? speciesId,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (speciesId != null) 'species_id': speciesId,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BreedsCompanion copyWith({
    Value<String>? id,
    Value<String>? speciesId,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return BreedsCompanion(
      id: id ?? this.id,
      speciesId: speciesId ?? this.speciesId,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<String>(speciesId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BreedsCompanion(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnimalGroupsTable extends AnimalGroups
    with TableInfo<$AnimalGroupsTable, AnimalGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnimalGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _speciesIdMeta = const VerificationMeta(
    'speciesId',
  );
  @override
  late final GeneratedColumn<String> speciesId = GeneratedColumn<String>(
    'species_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES species (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    speciesId,
    name,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'animal_groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnimalGroup> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('species_id')) {
      context.handle(
        _speciesIdMeta,
        speciesId.isAcceptableOrUnknown(data['species_id']!, _speciesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnimalGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnimalGroup(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      speciesId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AnimalGroupsTable createAlias(String alias) {
    return $AnimalGroupsTable(attachedDatabase, alias);
  }
}

class AnimalGroup extends DataClass implements Insertable<AnimalGroup> {
  final String id;
  final String speciesId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AnimalGroup({
    required this.id,
    required this.speciesId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['species_id'] = Variable<String>(speciesId);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AnimalGroupsCompanion toCompanion(bool nullToAbsent) {
    return AnimalGroupsCompanion(
      id: Value(id),
      speciesId: Value(speciesId),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AnimalGroup.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnimalGroup(
      id: serializer.fromJson<String>(json['id']),
      speciesId: serializer.fromJson<String>(json['speciesId']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'speciesId': serializer.toJson<String>(speciesId),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AnimalGroup copyWith({
    String? id,
    String? speciesId,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => AnimalGroup(
    id: id ?? this.id,
    speciesId: speciesId ?? this.speciesId,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AnimalGroup copyWithCompanion(AnimalGroupsCompanion data) {
    return AnimalGroup(
      id: data.id.present ? data.id.value : this.id,
      speciesId: data.speciesId.present ? data.speciesId.value : this.speciesId,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnimalGroup(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, speciesId, name, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnimalGroup &&
          other.id == this.id &&
          other.speciesId == this.speciesId &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AnimalGroupsCompanion extends UpdateCompanion<AnimalGroup> {
  final Value<String> id;
  final Value<String> speciesId;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AnimalGroupsCompanion({
    this.id = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnimalGroupsCompanion.insert({
    this.id = const Value.absent(),
    required String speciesId,
    required String name,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : speciesId = Value(speciesId),
       name = Value(name);
  static Insertable<AnimalGroup> custom({
    Expression<String>? id,
    Expression<String>? speciesId,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (speciesId != null) 'species_id': speciesId,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnimalGroupsCompanion copyWith({
    Value<String>? id,
    Value<String>? speciesId,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AnimalGroupsCompanion(
      id: id ?? this.id,
      speciesId: speciesId ?? this.speciesId,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<String>(speciesId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnimalGroupsCompanion(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnimalsTable extends Animals with TableInfo<$AnimalsTable, Animal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnimalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _speciesIdMeta = const VerificationMeta(
    'speciesId',
  );
  @override
  late final GeneratedColumn<String> speciesId = GeneratedColumn<String>(
    'species_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES species (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _breedIdMeta = const VerificationMeta(
    'breedId',
  );
  @override
  late final GeneratedColumn<String> breedId = GeneratedColumn<String>(
    'breed_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES breeds (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _groupIdMeta = const VerificationMeta(
    'groupId',
  );
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
    'group_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES animal_groups (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
    'sex',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _birthDateMeta = const VerificationMeta(
    'birthDate',
  );
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
    'birth_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sireIdMeta = const VerificationMeta('sireId');
  @override
  late final GeneratedColumn<String> sireId = GeneratedColumn<String>(
    'sire_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES animals (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _damIdMeta = const VerificationMeta('damId');
  @override
  late final GeneratedColumn<String> damId = GeneratedColumn<String>(
    'dam_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES animals (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _phenotypeDescriptionMeta =
      const VerificationMeta('phenotypeDescription');
  @override
  late final GeneratedColumn<String> phenotypeDescription =
      GeneratedColumn<String>(
        'phenotype_description',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    speciesId,
    breedId,
    groupId,
    name,
    sex,
    birthDate,
    sireId,
    damId,
    status,
    phenotypeDescription,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'animals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Animal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('species_id')) {
      context.handle(
        _speciesIdMeta,
        speciesId.isAcceptableOrUnknown(data['species_id']!, _speciesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesIdMeta);
    }
    if (data.containsKey('breed_id')) {
      context.handle(
        _breedIdMeta,
        breedId.isAcceptableOrUnknown(data['breed_id']!, _breedIdMeta),
      );
    }
    if (data.containsKey('group_id')) {
      context.handle(
        _groupIdMeta,
        groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(
        _birthDateMeta,
        birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta),
      );
    }
    if (data.containsKey('sire_id')) {
      context.handle(
        _sireIdMeta,
        sireId.isAcceptableOrUnknown(data['sire_id']!, _sireIdMeta),
      );
    }
    if (data.containsKey('dam_id')) {
      context.handle(
        _damIdMeta,
        damId.isAcceptableOrUnknown(data['dam_id']!, _damIdMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('phenotype_description')) {
      context.handle(
        _phenotypeDescriptionMeta,
        phenotypeDescription.isAcceptableOrUnknown(
          data['phenotype_description']!,
          _phenotypeDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Animal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Animal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      speciesId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species_id'],
      )!,
      breedId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breed_id'],
      ),
      groupId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex'],
      )!,
      birthDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birth_date'],
      ),
      sireId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sire_id'],
      ),
      damId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dam_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      phenotypeDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phenotype_description'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $AnimalsTable createAlias(String alias) {
    return $AnimalsTable(attachedDatabase, alias);
  }
}

class Animal extends DataClass implements Insertable<Animal> {
  final String id;
  final String speciesId;
  final String? breedId;
  final String? groupId;
  final String name;

  /// 'male' | 'female' | 'unknown'
  final String sex;
  final DateTime? birthDate;
  final String? sireId;
  final String? damId;

  /// 'active' | 'sold' | 'deceased' | 'culled'
  final String status;

  /// Free-text visual description shown for reference; not used by the
  /// genetics engine (see AnimalPhenotypeObservations for structured data).
  final String? phenotypeDescription;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const Animal({
    required this.id,
    required this.speciesId,
    this.breedId,
    this.groupId,
    required this.name,
    required this.sex,
    this.birthDate,
    this.sireId,
    this.damId,
    required this.status,
    this.phenotypeDescription,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['species_id'] = Variable<String>(speciesId);
    if (!nullToAbsent || breedId != null) {
      map['breed_id'] = Variable<String>(breedId);
    }
    if (!nullToAbsent || groupId != null) {
      map['group_id'] = Variable<String>(groupId);
    }
    map['name'] = Variable<String>(name);
    map['sex'] = Variable<String>(sex);
    if (!nullToAbsent || birthDate != null) {
      map['birth_date'] = Variable<DateTime>(birthDate);
    }
    if (!nullToAbsent || sireId != null) {
      map['sire_id'] = Variable<String>(sireId);
    }
    if (!nullToAbsent || damId != null) {
      map['dam_id'] = Variable<String>(damId);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || phenotypeDescription != null) {
      map['phenotype_description'] = Variable<String>(phenotypeDescription);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  AnimalsCompanion toCompanion(bool nullToAbsent) {
    return AnimalsCompanion(
      id: Value(id),
      speciesId: Value(speciesId),
      breedId: breedId == null && nullToAbsent
          ? const Value.absent()
          : Value(breedId),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      name: Value(name),
      sex: Value(sex),
      birthDate: birthDate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthDate),
      sireId: sireId == null && nullToAbsent
          ? const Value.absent()
          : Value(sireId),
      damId: damId == null && nullToAbsent
          ? const Value.absent()
          : Value(damId),
      status: Value(status),
      phenotypeDescription: phenotypeDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(phenotypeDescription),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Animal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Animal(
      id: serializer.fromJson<String>(json['id']),
      speciesId: serializer.fromJson<String>(json['speciesId']),
      breedId: serializer.fromJson<String?>(json['breedId']),
      groupId: serializer.fromJson<String?>(json['groupId']),
      name: serializer.fromJson<String>(json['name']),
      sex: serializer.fromJson<String>(json['sex']),
      birthDate: serializer.fromJson<DateTime?>(json['birthDate']),
      sireId: serializer.fromJson<String?>(json['sireId']),
      damId: serializer.fromJson<String?>(json['damId']),
      status: serializer.fromJson<String>(json['status']),
      phenotypeDescription: serializer.fromJson<String?>(
        json['phenotypeDescription'],
      ),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'speciesId': serializer.toJson<String>(speciesId),
      'breedId': serializer.toJson<String?>(breedId),
      'groupId': serializer.toJson<String?>(groupId),
      'name': serializer.toJson<String>(name),
      'sex': serializer.toJson<String>(sex),
      'birthDate': serializer.toJson<DateTime?>(birthDate),
      'sireId': serializer.toJson<String?>(sireId),
      'damId': serializer.toJson<String?>(damId),
      'status': serializer.toJson<String>(status),
      'phenotypeDescription': serializer.toJson<String?>(phenotypeDescription),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Animal copyWith({
    String? id,
    String? speciesId,
    Value<String?> breedId = const Value.absent(),
    Value<String?> groupId = const Value.absent(),
    String? name,
    String? sex,
    Value<DateTime?> birthDate = const Value.absent(),
    Value<String?> sireId = const Value.absent(),
    Value<String?> damId = const Value.absent(),
    String? status,
    Value<String?> phenotypeDescription = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => Animal(
    id: id ?? this.id,
    speciesId: speciesId ?? this.speciesId,
    breedId: breedId.present ? breedId.value : this.breedId,
    groupId: groupId.present ? groupId.value : this.groupId,
    name: name ?? this.name,
    sex: sex ?? this.sex,
    birthDate: birthDate.present ? birthDate.value : this.birthDate,
    sireId: sireId.present ? sireId.value : this.sireId,
    damId: damId.present ? damId.value : this.damId,
    status: status ?? this.status,
    phenotypeDescription: phenotypeDescription.present
        ? phenotypeDescription.value
        : this.phenotypeDescription,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  Animal copyWithCompanion(AnimalsCompanion data) {
    return Animal(
      id: data.id.present ? data.id.value : this.id,
      speciesId: data.speciesId.present ? data.speciesId.value : this.speciesId,
      breedId: data.breedId.present ? data.breedId.value : this.breedId,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      name: data.name.present ? data.name.value : this.name,
      sex: data.sex.present ? data.sex.value : this.sex,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      sireId: data.sireId.present ? data.sireId.value : this.sireId,
      damId: data.damId.present ? data.damId.value : this.damId,
      status: data.status.present ? data.status.value : this.status,
      phenotypeDescription: data.phenotypeDescription.present
          ? data.phenotypeDescription.value
          : this.phenotypeDescription,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Animal(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('breedId: $breedId, ')
          ..write('groupId: $groupId, ')
          ..write('name: $name, ')
          ..write('sex: $sex, ')
          ..write('birthDate: $birthDate, ')
          ..write('sireId: $sireId, ')
          ..write('damId: $damId, ')
          ..write('status: $status, ')
          ..write('phenotypeDescription: $phenotypeDescription, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    speciesId,
    breedId,
    groupId,
    name,
    sex,
    birthDate,
    sireId,
    damId,
    status,
    phenotypeDescription,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Animal &&
          other.id == this.id &&
          other.speciesId == this.speciesId &&
          other.breedId == this.breedId &&
          other.groupId == this.groupId &&
          other.name == this.name &&
          other.sex == this.sex &&
          other.birthDate == this.birthDate &&
          other.sireId == this.sireId &&
          other.damId == this.damId &&
          other.status == this.status &&
          other.phenotypeDescription == this.phenotypeDescription &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class AnimalsCompanion extends UpdateCompanion<Animal> {
  final Value<String> id;
  final Value<String> speciesId;
  final Value<String?> breedId;
  final Value<String?> groupId;
  final Value<String> name;
  final Value<String> sex;
  final Value<DateTime?> birthDate;
  final Value<String?> sireId;
  final Value<String?> damId;
  final Value<String> status;
  final Value<String?> phenotypeDescription;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const AnimalsCompanion({
    this.id = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.breedId = const Value.absent(),
    this.groupId = const Value.absent(),
    this.name = const Value.absent(),
    this.sex = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.sireId = const Value.absent(),
    this.damId = const Value.absent(),
    this.status = const Value.absent(),
    this.phenotypeDescription = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnimalsCompanion.insert({
    this.id = const Value.absent(),
    required String speciesId,
    this.breedId = const Value.absent(),
    this.groupId = const Value.absent(),
    required String name,
    required String sex,
    this.birthDate = const Value.absent(),
    this.sireId = const Value.absent(),
    this.damId = const Value.absent(),
    this.status = const Value.absent(),
    this.phenotypeDescription = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : speciesId = Value(speciesId),
       name = Value(name),
       sex = Value(sex);
  static Insertable<Animal> custom({
    Expression<String>? id,
    Expression<String>? speciesId,
    Expression<String>? breedId,
    Expression<String>? groupId,
    Expression<String>? name,
    Expression<String>? sex,
    Expression<DateTime>? birthDate,
    Expression<String>? sireId,
    Expression<String>? damId,
    Expression<String>? status,
    Expression<String>? phenotypeDescription,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (speciesId != null) 'species_id': speciesId,
      if (breedId != null) 'breed_id': breedId,
      if (groupId != null) 'group_id': groupId,
      if (name != null) 'name': name,
      if (sex != null) 'sex': sex,
      if (birthDate != null) 'birth_date': birthDate,
      if (sireId != null) 'sire_id': sireId,
      if (damId != null) 'dam_id': damId,
      if (status != null) 'status': status,
      if (phenotypeDescription != null)
        'phenotype_description': phenotypeDescription,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnimalsCompanion copyWith({
    Value<String>? id,
    Value<String>? speciesId,
    Value<String?>? breedId,
    Value<String?>? groupId,
    Value<String>? name,
    Value<String>? sex,
    Value<DateTime?>? birthDate,
    Value<String?>? sireId,
    Value<String?>? damId,
    Value<String>? status,
    Value<String?>? phenotypeDescription,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return AnimalsCompanion(
      id: id ?? this.id,
      speciesId: speciesId ?? this.speciesId,
      breedId: breedId ?? this.breedId,
      groupId: groupId ?? this.groupId,
      name: name ?? this.name,
      sex: sex ?? this.sex,
      birthDate: birthDate ?? this.birthDate,
      sireId: sireId ?? this.sireId,
      damId: damId ?? this.damId,
      status: status ?? this.status,
      phenotypeDescription: phenotypeDescription ?? this.phenotypeDescription,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<String>(speciesId.value);
    }
    if (breedId.present) {
      map['breed_id'] = Variable<String>(breedId.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (sireId.present) {
      map['sire_id'] = Variable<String>(sireId.value);
    }
    if (damId.present) {
      map['dam_id'] = Variable<String>(damId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (phenotypeDescription.present) {
      map['phenotype_description'] = Variable<String>(
        phenotypeDescription.value,
      );
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnimalsCompanion(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('breedId: $breedId, ')
          ..write('groupId: $groupId, ')
          ..write('name: $name, ')
          ..write('sex: $sex, ')
          ..write('birthDate: $birthDate, ')
          ..write('sireId: $sireId, ')
          ..write('damId: $damId, ')
          ..write('status: $status, ')
          ..write('phenotypeDescription: $phenotypeDescription, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LociTable extends Loci with TableInfo<$LociTable, Locus> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LociTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _speciesIdMeta = const VerificationMeta(
    'speciesId',
  );
  @override
  late final GeneratedColumn<String> speciesId = GeneratedColumn<String>(
    'species_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES species (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _inheritancePatternMeta =
      const VerificationMeta('inheritancePattern');
  @override
  late final GeneratedColumn<String> inheritancePattern =
      GeneratedColumn<String>(
        'inheritance_pattern',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _isSexLinkedMeta = const VerificationMeta(
    'isSexLinked',
  );
  @override
  late final GeneratedColumn<bool> isSexLinked = GeneratedColumn<bool>(
    'is_sex_linked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sex_linked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    speciesId,
    key,
    name,
    inheritancePattern,
    isSexLinked,
    description,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loci';
  @override
  VerificationContext validateIntegrity(
    Insertable<Locus> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('species_id')) {
      context.handle(
        _speciesIdMeta,
        speciesId.isAcceptableOrUnknown(data['species_id']!, _speciesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesIdMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('inheritance_pattern')) {
      context.handle(
        _inheritancePatternMeta,
        inheritancePattern.isAcceptableOrUnknown(
          data['inheritance_pattern']!,
          _inheritancePatternMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inheritancePatternMeta);
    }
    if (data.containsKey('is_sex_linked')) {
      context.handle(
        _isSexLinkedMeta,
        isSexLinked.isAcceptableOrUnknown(
          data['is_sex_linked']!,
          _isSexLinkedMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Locus map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Locus(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      speciesId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species_id'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      inheritancePattern: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inheritance_pattern'],
      )!,
      isSexLinked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sex_linked'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LociTable createAlias(String alias) {
    return $LociTable(attachedDatabase, alias);
  }
}

class Locus extends DataClass implements Insertable<Locus> {
  final String id;
  final String speciesId;
  final String key;
  final String name;

  /// 'dominant_series' | 'incomplete_dominance' | 'codominant'
  final String inheritancePattern;

  /// True for loci carried on the sex chromosome (e.g. Z-linked barring
  /// in chickens).
  final bool isSexLinked;
  final String? description;
  final DateTime createdAt;
  const Locus({
    required this.id,
    required this.speciesId,
    required this.key,
    required this.name,
    required this.inheritancePattern,
    required this.isSexLinked,
    this.description,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['species_id'] = Variable<String>(speciesId);
    map['key'] = Variable<String>(key);
    map['name'] = Variable<String>(name);
    map['inheritance_pattern'] = Variable<String>(inheritancePattern);
    map['is_sex_linked'] = Variable<bool>(isSexLinked);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LociCompanion toCompanion(bool nullToAbsent) {
    return LociCompanion(
      id: Value(id),
      speciesId: Value(speciesId),
      key: Value(key),
      name: Value(name),
      inheritancePattern: Value(inheritancePattern),
      isSexLinked: Value(isSexLinked),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory Locus.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Locus(
      id: serializer.fromJson<String>(json['id']),
      speciesId: serializer.fromJson<String>(json['speciesId']),
      key: serializer.fromJson<String>(json['key']),
      name: serializer.fromJson<String>(json['name']),
      inheritancePattern: serializer.fromJson<String>(
        json['inheritancePattern'],
      ),
      isSexLinked: serializer.fromJson<bool>(json['isSexLinked']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'speciesId': serializer.toJson<String>(speciesId),
      'key': serializer.toJson<String>(key),
      'name': serializer.toJson<String>(name),
      'inheritancePattern': serializer.toJson<String>(inheritancePattern),
      'isSexLinked': serializer.toJson<bool>(isSexLinked),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Locus copyWith({
    String? id,
    String? speciesId,
    String? key,
    String? name,
    String? inheritancePattern,
    bool? isSexLinked,
    Value<String?> description = const Value.absent(),
    DateTime? createdAt,
  }) => Locus(
    id: id ?? this.id,
    speciesId: speciesId ?? this.speciesId,
    key: key ?? this.key,
    name: name ?? this.name,
    inheritancePattern: inheritancePattern ?? this.inheritancePattern,
    isSexLinked: isSexLinked ?? this.isSexLinked,
    description: description.present ? description.value : this.description,
    createdAt: createdAt ?? this.createdAt,
  );
  Locus copyWithCompanion(LociCompanion data) {
    return Locus(
      id: data.id.present ? data.id.value : this.id,
      speciesId: data.speciesId.present ? data.speciesId.value : this.speciesId,
      key: data.key.present ? data.key.value : this.key,
      name: data.name.present ? data.name.value : this.name,
      inheritancePattern: data.inheritancePattern.present
          ? data.inheritancePattern.value
          : this.inheritancePattern,
      isSexLinked: data.isSexLinked.present
          ? data.isSexLinked.value
          : this.isSexLinked,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Locus(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('key: $key, ')
          ..write('name: $name, ')
          ..write('inheritancePattern: $inheritancePattern, ')
          ..write('isSexLinked: $isSexLinked, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    speciesId,
    key,
    name,
    inheritancePattern,
    isSexLinked,
    description,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Locus &&
          other.id == this.id &&
          other.speciesId == this.speciesId &&
          other.key == this.key &&
          other.name == this.name &&
          other.inheritancePattern == this.inheritancePattern &&
          other.isSexLinked == this.isSexLinked &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class LociCompanion extends UpdateCompanion<Locus> {
  final Value<String> id;
  final Value<String> speciesId;
  final Value<String> key;
  final Value<String> name;
  final Value<String> inheritancePattern;
  final Value<bool> isSexLinked;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const LociCompanion({
    this.id = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.key = const Value.absent(),
    this.name = const Value.absent(),
    this.inheritancePattern = const Value.absent(),
    this.isSexLinked = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LociCompanion.insert({
    this.id = const Value.absent(),
    required String speciesId,
    required String key,
    required String name,
    required String inheritancePattern,
    this.isSexLinked = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : speciesId = Value(speciesId),
       key = Value(key),
       name = Value(name),
       inheritancePattern = Value(inheritancePattern);
  static Insertable<Locus> custom({
    Expression<String>? id,
    Expression<String>? speciesId,
    Expression<String>? key,
    Expression<String>? name,
    Expression<String>? inheritancePattern,
    Expression<bool>? isSexLinked,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (speciesId != null) 'species_id': speciesId,
      if (key != null) 'key': key,
      if (name != null) 'name': name,
      if (inheritancePattern != null) 'inheritance_pattern': inheritancePattern,
      if (isSexLinked != null) 'is_sex_linked': isSexLinked,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LociCompanion copyWith({
    Value<String>? id,
    Value<String>? speciesId,
    Value<String>? key,
    Value<String>? name,
    Value<String>? inheritancePattern,
    Value<bool>? isSexLinked,
    Value<String?>? description,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return LociCompanion(
      id: id ?? this.id,
      speciesId: speciesId ?? this.speciesId,
      key: key ?? this.key,
      name: name ?? this.name,
      inheritancePattern: inheritancePattern ?? this.inheritancePattern,
      isSexLinked: isSexLinked ?? this.isSexLinked,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<String>(speciesId.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (inheritancePattern.present) {
      map['inheritance_pattern'] = Variable<String>(inheritancePattern.value);
    }
    if (isSexLinked.present) {
      map['is_sex_linked'] = Variable<bool>(isSexLinked.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LociCompanion(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('key: $key, ')
          ..write('name: $name, ')
          ..write('inheritancePattern: $inheritancePattern, ')
          ..write('isSexLinked: $isSexLinked, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AllelesTable extends Alleles with TableInfo<$AllelesTable, Allele> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AllelesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _locusIdMeta = const VerificationMeta(
    'locusId',
  );
  @override
  late final GeneratedColumn<String> locusId = GeneratedColumn<String>(
    'locus_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES loci (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
    'symbol',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dominanceRankMeta = const VerificationMeta(
    'dominanceRank',
  );
  @override
  late final GeneratedColumn<int> dominanceRank = GeneratedColumn<int>(
    'dominance_rank',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    locusId,
    symbol,
    name,
    dominanceRank,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alleles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Allele> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('locus_id')) {
      context.handle(
        _locusIdMeta,
        locusId.isAcceptableOrUnknown(data['locus_id']!, _locusIdMeta),
      );
    } else if (isInserting) {
      context.missing(_locusIdMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(
        _symbolMeta,
        symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta),
      );
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('dominance_rank')) {
      context.handle(
        _dominanceRankMeta,
        dominanceRank.isAcceptableOrUnknown(
          data['dominance_rank']!,
          _dominanceRankMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Allele map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Allele(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      locusId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}locus_id'],
      )!,
      symbol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symbol'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      dominanceRank: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dominance_rank'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $AllelesTable createAlias(String alias) {
    return $AllelesTable(attachedDatabase, alias);
  }
}

class Allele extends DataClass implements Insertable<Allele> {
  final String id;
  final String locusId;
  final String symbol;
  final String name;

  /// Lower rank = more dominant. Used for 'dominant_series' loci; ignored
  /// for incomplete-dominance/codominant loci (those are resolved by the
  /// species-specific phenotype resolver).
  final int? dominanceRank;
  final String? description;
  const Allele({
    required this.id,
    required this.locusId,
    required this.symbol,
    required this.name,
    this.dominanceRank,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['locus_id'] = Variable<String>(locusId);
    map['symbol'] = Variable<String>(symbol);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || dominanceRank != null) {
      map['dominance_rank'] = Variable<int>(dominanceRank);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  AllelesCompanion toCompanion(bool nullToAbsent) {
    return AllelesCompanion(
      id: Value(id),
      locusId: Value(locusId),
      symbol: Value(symbol),
      name: Value(name),
      dominanceRank: dominanceRank == null && nullToAbsent
          ? const Value.absent()
          : Value(dominanceRank),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Allele.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Allele(
      id: serializer.fromJson<String>(json['id']),
      locusId: serializer.fromJson<String>(json['locusId']),
      symbol: serializer.fromJson<String>(json['symbol']),
      name: serializer.fromJson<String>(json['name']),
      dominanceRank: serializer.fromJson<int?>(json['dominanceRank']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'locusId': serializer.toJson<String>(locusId),
      'symbol': serializer.toJson<String>(symbol),
      'name': serializer.toJson<String>(name),
      'dominanceRank': serializer.toJson<int?>(dominanceRank),
      'description': serializer.toJson<String?>(description),
    };
  }

  Allele copyWith({
    String? id,
    String? locusId,
    String? symbol,
    String? name,
    Value<int?> dominanceRank = const Value.absent(),
    Value<String?> description = const Value.absent(),
  }) => Allele(
    id: id ?? this.id,
    locusId: locusId ?? this.locusId,
    symbol: symbol ?? this.symbol,
    name: name ?? this.name,
    dominanceRank: dominanceRank.present
        ? dominanceRank.value
        : this.dominanceRank,
    description: description.present ? description.value : this.description,
  );
  Allele copyWithCompanion(AllelesCompanion data) {
    return Allele(
      id: data.id.present ? data.id.value : this.id,
      locusId: data.locusId.present ? data.locusId.value : this.locusId,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      name: data.name.present ? data.name.value : this.name,
      dominanceRank: data.dominanceRank.present
          ? data.dominanceRank.value
          : this.dominanceRank,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Allele(')
          ..write('id: $id, ')
          ..write('locusId: $locusId, ')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('dominanceRank: $dominanceRank, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, locusId, symbol, name, dominanceRank, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Allele &&
          other.id == this.id &&
          other.locusId == this.locusId &&
          other.symbol == this.symbol &&
          other.name == this.name &&
          other.dominanceRank == this.dominanceRank &&
          other.description == this.description);
}

class AllelesCompanion extends UpdateCompanion<Allele> {
  final Value<String> id;
  final Value<String> locusId;
  final Value<String> symbol;
  final Value<String> name;
  final Value<int?> dominanceRank;
  final Value<String?> description;
  final Value<int> rowid;
  const AllelesCompanion({
    this.id = const Value.absent(),
    this.locusId = const Value.absent(),
    this.symbol = const Value.absent(),
    this.name = const Value.absent(),
    this.dominanceRank = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AllelesCompanion.insert({
    this.id = const Value.absent(),
    required String locusId,
    required String symbol,
    required String name,
    this.dominanceRank = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : locusId = Value(locusId),
       symbol = Value(symbol),
       name = Value(name);
  static Insertable<Allele> custom({
    Expression<String>? id,
    Expression<String>? locusId,
    Expression<String>? symbol,
    Expression<String>? name,
    Expression<int>? dominanceRank,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (locusId != null) 'locus_id': locusId,
      if (symbol != null) 'symbol': symbol,
      if (name != null) 'name': name,
      if (dominanceRank != null) 'dominance_rank': dominanceRank,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AllelesCompanion copyWith({
    Value<String>? id,
    Value<String>? locusId,
    Value<String>? symbol,
    Value<String>? name,
    Value<int?>? dominanceRank,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return AllelesCompanion(
      id: id ?? this.id,
      locusId: locusId ?? this.locusId,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      dominanceRank: dominanceRank ?? this.dominanceRank,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (locusId.present) {
      map['locus_id'] = Variable<String>(locusId.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dominanceRank.present) {
      map['dominance_rank'] = Variable<int>(dominanceRank.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AllelesCompanion(')
          ..write('id: $id, ')
          ..write('locusId: $locusId, ')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('dominanceRank: $dominanceRank, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnimalGenotypesTable extends AnimalGenotypes
    with TableInfo<$AnimalGenotypesTable, AnimalGenotype> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnimalGenotypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _animalIdMeta = const VerificationMeta(
    'animalId',
  );
  @override
  late final GeneratedColumn<String> animalId = GeneratedColumn<String>(
    'animal_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES animals (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _locusIdMeta = const VerificationMeta(
    'locusId',
  );
  @override
  late final GeneratedColumn<String> locusId = GeneratedColumn<String>(
    'locus_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES loci (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _allele1IdMeta = const VerificationMeta(
    'allele1Id',
  );
  @override
  late final GeneratedColumn<String> allele1Id = GeneratedColumn<String>(
    'allele1_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES alleles (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _allele2IdMeta = const VerificationMeta(
    'allele2Id',
  );
  @override
  late final GeneratedColumn<String> allele2Id = GeneratedColumn<String>(
    'allele2_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES alleles (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('known'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    animalId,
    locusId,
    allele1Id,
    allele2Id,
    source,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'animal_genotypes';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnimalGenotype> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('animal_id')) {
      context.handle(
        _animalIdMeta,
        animalId.isAcceptableOrUnknown(data['animal_id']!, _animalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_animalIdMeta);
    }
    if (data.containsKey('locus_id')) {
      context.handle(
        _locusIdMeta,
        locusId.isAcceptableOrUnknown(data['locus_id']!, _locusIdMeta),
      );
    } else if (isInserting) {
      context.missing(_locusIdMeta);
    }
    if (data.containsKey('allele1_id')) {
      context.handle(
        _allele1IdMeta,
        allele1Id.isAcceptableOrUnknown(data['allele1_id']!, _allele1IdMeta),
      );
    } else if (isInserting) {
      context.missing(_allele1IdMeta);
    }
    if (data.containsKey('allele2_id')) {
      context.handle(
        _allele2IdMeta,
        allele2Id.isAcceptableOrUnknown(data['allele2_id']!, _allele2IdMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnimalGenotype map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnimalGenotype(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      animalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}animal_id'],
      )!,
      locusId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}locus_id'],
      )!,
      allele1Id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allele1_id'],
      )!,
      allele2Id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allele2_id'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AnimalGenotypesTable createAlias(String alias) {
    return $AnimalGenotypesTable(attachedDatabase, alias);
  }
}

class AnimalGenotype extends DataClass implements Insertable<AnimalGenotype> {
  final String id;
  final String animalId;
  final String locusId;
  final String allele1Id;

  /// Nullable: an animal that is hemizygous at a sex-linked locus (e.g. a
  /// hen at a Z-linked locus in a ZW species) has only one allele here.
  final String? allele2Id;

  /// 'known' (tested/pedigree-certain) | 'inferred' (from observed
  /// phenotype) | 'assumed'
  final String source;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AnimalGenotype({
    required this.id,
    required this.animalId,
    required this.locusId,
    required this.allele1Id,
    this.allele2Id,
    required this.source,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['animal_id'] = Variable<String>(animalId);
    map['locus_id'] = Variable<String>(locusId);
    map['allele1_id'] = Variable<String>(allele1Id);
    if (!nullToAbsent || allele2Id != null) {
      map['allele2_id'] = Variable<String>(allele2Id);
    }
    map['source'] = Variable<String>(source);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AnimalGenotypesCompanion toCompanion(bool nullToAbsent) {
    return AnimalGenotypesCompanion(
      id: Value(id),
      animalId: Value(animalId),
      locusId: Value(locusId),
      allele1Id: Value(allele1Id),
      allele2Id: allele2Id == null && nullToAbsent
          ? const Value.absent()
          : Value(allele2Id),
      source: Value(source),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AnimalGenotype.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnimalGenotype(
      id: serializer.fromJson<String>(json['id']),
      animalId: serializer.fromJson<String>(json['animalId']),
      locusId: serializer.fromJson<String>(json['locusId']),
      allele1Id: serializer.fromJson<String>(json['allele1Id']),
      allele2Id: serializer.fromJson<String?>(json['allele2Id']),
      source: serializer.fromJson<String>(json['source']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'animalId': serializer.toJson<String>(animalId),
      'locusId': serializer.toJson<String>(locusId),
      'allele1Id': serializer.toJson<String>(allele1Id),
      'allele2Id': serializer.toJson<String?>(allele2Id),
      'source': serializer.toJson<String>(source),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AnimalGenotype copyWith({
    String? id,
    String? animalId,
    String? locusId,
    String? allele1Id,
    Value<String?> allele2Id = const Value.absent(),
    String? source,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => AnimalGenotype(
    id: id ?? this.id,
    animalId: animalId ?? this.animalId,
    locusId: locusId ?? this.locusId,
    allele1Id: allele1Id ?? this.allele1Id,
    allele2Id: allele2Id.present ? allele2Id.value : this.allele2Id,
    source: source ?? this.source,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AnimalGenotype copyWithCompanion(AnimalGenotypesCompanion data) {
    return AnimalGenotype(
      id: data.id.present ? data.id.value : this.id,
      animalId: data.animalId.present ? data.animalId.value : this.animalId,
      locusId: data.locusId.present ? data.locusId.value : this.locusId,
      allele1Id: data.allele1Id.present ? data.allele1Id.value : this.allele1Id,
      allele2Id: data.allele2Id.present ? data.allele2Id.value : this.allele2Id,
      source: data.source.present ? data.source.value : this.source,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnimalGenotype(')
          ..write('id: $id, ')
          ..write('animalId: $animalId, ')
          ..write('locusId: $locusId, ')
          ..write('allele1Id: $allele1Id, ')
          ..write('allele2Id: $allele2Id, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    animalId,
    locusId,
    allele1Id,
    allele2Id,
    source,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnimalGenotype &&
          other.id == this.id &&
          other.animalId == this.animalId &&
          other.locusId == this.locusId &&
          other.allele1Id == this.allele1Id &&
          other.allele2Id == this.allele2Id &&
          other.source == this.source &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AnimalGenotypesCompanion extends UpdateCompanion<AnimalGenotype> {
  final Value<String> id;
  final Value<String> animalId;
  final Value<String> locusId;
  final Value<String> allele1Id;
  final Value<String?> allele2Id;
  final Value<String> source;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AnimalGenotypesCompanion({
    this.id = const Value.absent(),
    this.animalId = const Value.absent(),
    this.locusId = const Value.absent(),
    this.allele1Id = const Value.absent(),
    this.allele2Id = const Value.absent(),
    this.source = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnimalGenotypesCompanion.insert({
    this.id = const Value.absent(),
    required String animalId,
    required String locusId,
    required String allele1Id,
    this.allele2Id = const Value.absent(),
    this.source = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : animalId = Value(animalId),
       locusId = Value(locusId),
       allele1Id = Value(allele1Id);
  static Insertable<AnimalGenotype> custom({
    Expression<String>? id,
    Expression<String>? animalId,
    Expression<String>? locusId,
    Expression<String>? allele1Id,
    Expression<String>? allele2Id,
    Expression<String>? source,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (animalId != null) 'animal_id': animalId,
      if (locusId != null) 'locus_id': locusId,
      if (allele1Id != null) 'allele1_id': allele1Id,
      if (allele2Id != null) 'allele2_id': allele2Id,
      if (source != null) 'source': source,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnimalGenotypesCompanion copyWith({
    Value<String>? id,
    Value<String>? animalId,
    Value<String>? locusId,
    Value<String>? allele1Id,
    Value<String?>? allele2Id,
    Value<String>? source,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AnimalGenotypesCompanion(
      id: id ?? this.id,
      animalId: animalId ?? this.animalId,
      locusId: locusId ?? this.locusId,
      allele1Id: allele1Id ?? this.allele1Id,
      allele2Id: allele2Id ?? this.allele2Id,
      source: source ?? this.source,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (animalId.present) {
      map['animal_id'] = Variable<String>(animalId.value);
    }
    if (locusId.present) {
      map['locus_id'] = Variable<String>(locusId.value);
    }
    if (allele1Id.present) {
      map['allele1_id'] = Variable<String>(allele1Id.value);
    }
    if (allele2Id.present) {
      map['allele2_id'] = Variable<String>(allele2Id.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnimalGenotypesCompanion(')
          ..write('id: $id, ')
          ..write('animalId: $animalId, ')
          ..write('locusId: $locusId, ')
          ..write('allele1Id: $allele1Id, ')
          ..write('allele2Id: $allele2Id, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PhenotypeTraitsTable extends PhenotypeTraits
    with TableInfo<$PhenotypeTraitsTable, PhenotypeTrait> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhenotypeTraitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _speciesIdMeta = const VerificationMeta(
    'speciesId',
  );
  @override
  late final GeneratedColumn<String> speciesId = GeneratedColumn<String>(
    'species_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES species (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relatedLocusIdMeta = const VerificationMeta(
    'relatedLocusId',
  );
  @override
  late final GeneratedColumn<String> relatedLocusId = GeneratedColumn<String>(
    'related_locus_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES loci (id) ON DELETE SET NULL',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    speciesId,
    key,
    name,
    relatedLocusId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'phenotype_traits';
  @override
  VerificationContext validateIntegrity(
    Insertable<PhenotypeTrait> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('species_id')) {
      context.handle(
        _speciesIdMeta,
        speciesId.isAcceptableOrUnknown(data['species_id']!, _speciesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesIdMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('related_locus_id')) {
      context.handle(
        _relatedLocusIdMeta,
        relatedLocusId.isAcceptableOrUnknown(
          data['related_locus_id']!,
          _relatedLocusIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PhenotypeTrait map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhenotypeTrait(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      speciesId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species_id'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      relatedLocusId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_locus_id'],
      ),
    );
  }

  @override
  $PhenotypeTraitsTable createAlias(String alias) {
    return $PhenotypeTraitsTable(attachedDatabase, alias);
  }
}

class PhenotypeTrait extends DataClass implements Insertable<PhenotypeTrait> {
  final String id;
  final String speciesId;
  final String key;
  final String name;

  /// Set when this trait maps cleanly to a single locus (e.g. barring);
  /// left null when it's a composite result of several loci interacting
  /// (in which case it is descriptive only, not used for inference).
  final String? relatedLocusId;
  const PhenotypeTrait({
    required this.id,
    required this.speciesId,
    required this.key,
    required this.name,
    this.relatedLocusId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['species_id'] = Variable<String>(speciesId);
    map['key'] = Variable<String>(key);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || relatedLocusId != null) {
      map['related_locus_id'] = Variable<String>(relatedLocusId);
    }
    return map;
  }

  PhenotypeTraitsCompanion toCompanion(bool nullToAbsent) {
    return PhenotypeTraitsCompanion(
      id: Value(id),
      speciesId: Value(speciesId),
      key: Value(key),
      name: Value(name),
      relatedLocusId: relatedLocusId == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedLocusId),
    );
  }

  factory PhenotypeTrait.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhenotypeTrait(
      id: serializer.fromJson<String>(json['id']),
      speciesId: serializer.fromJson<String>(json['speciesId']),
      key: serializer.fromJson<String>(json['key']),
      name: serializer.fromJson<String>(json['name']),
      relatedLocusId: serializer.fromJson<String?>(json['relatedLocusId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'speciesId': serializer.toJson<String>(speciesId),
      'key': serializer.toJson<String>(key),
      'name': serializer.toJson<String>(name),
      'relatedLocusId': serializer.toJson<String?>(relatedLocusId),
    };
  }

  PhenotypeTrait copyWith({
    String? id,
    String? speciesId,
    String? key,
    String? name,
    Value<String?> relatedLocusId = const Value.absent(),
  }) => PhenotypeTrait(
    id: id ?? this.id,
    speciesId: speciesId ?? this.speciesId,
    key: key ?? this.key,
    name: name ?? this.name,
    relatedLocusId: relatedLocusId.present
        ? relatedLocusId.value
        : this.relatedLocusId,
  );
  PhenotypeTrait copyWithCompanion(PhenotypeTraitsCompanion data) {
    return PhenotypeTrait(
      id: data.id.present ? data.id.value : this.id,
      speciesId: data.speciesId.present ? data.speciesId.value : this.speciesId,
      key: data.key.present ? data.key.value : this.key,
      name: data.name.present ? data.name.value : this.name,
      relatedLocusId: data.relatedLocusId.present
          ? data.relatedLocusId.value
          : this.relatedLocusId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhenotypeTrait(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('key: $key, ')
          ..write('name: $name, ')
          ..write('relatedLocusId: $relatedLocusId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, speciesId, key, name, relatedLocusId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhenotypeTrait &&
          other.id == this.id &&
          other.speciesId == this.speciesId &&
          other.key == this.key &&
          other.name == this.name &&
          other.relatedLocusId == this.relatedLocusId);
}

class PhenotypeTraitsCompanion extends UpdateCompanion<PhenotypeTrait> {
  final Value<String> id;
  final Value<String> speciesId;
  final Value<String> key;
  final Value<String> name;
  final Value<String?> relatedLocusId;
  final Value<int> rowid;
  const PhenotypeTraitsCompanion({
    this.id = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.key = const Value.absent(),
    this.name = const Value.absent(),
    this.relatedLocusId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PhenotypeTraitsCompanion.insert({
    this.id = const Value.absent(),
    required String speciesId,
    required String key,
    required String name,
    this.relatedLocusId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : speciesId = Value(speciesId),
       key = Value(key),
       name = Value(name);
  static Insertable<PhenotypeTrait> custom({
    Expression<String>? id,
    Expression<String>? speciesId,
    Expression<String>? key,
    Expression<String>? name,
    Expression<String>? relatedLocusId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (speciesId != null) 'species_id': speciesId,
      if (key != null) 'key': key,
      if (name != null) 'name': name,
      if (relatedLocusId != null) 'related_locus_id': relatedLocusId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PhenotypeTraitsCompanion copyWith({
    Value<String>? id,
    Value<String>? speciesId,
    Value<String>? key,
    Value<String>? name,
    Value<String?>? relatedLocusId,
    Value<int>? rowid,
  }) {
    return PhenotypeTraitsCompanion(
      id: id ?? this.id,
      speciesId: speciesId ?? this.speciesId,
      key: key ?? this.key,
      name: name ?? this.name,
      relatedLocusId: relatedLocusId ?? this.relatedLocusId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<String>(speciesId.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (relatedLocusId.present) {
      map['related_locus_id'] = Variable<String>(relatedLocusId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhenotypeTraitsCompanion(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('key: $key, ')
          ..write('name: $name, ')
          ..write('relatedLocusId: $relatedLocusId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PhenotypeTraitOptionsTable extends PhenotypeTraitOptions
    with TableInfo<$PhenotypeTraitOptionsTable, PhenotypeTraitOption> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhenotypeTraitOptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _phenotypeTraitIdMeta = const VerificationMeta(
    'phenotypeTraitId',
  );
  @override
  late final GeneratedColumn<String> phenotypeTraitId = GeneratedColumn<String>(
    'phenotype_trait_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES phenotype_traits (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _plausibleGenotypesJsonMeta =
      const VerificationMeta('plausibleGenotypesJson');
  @override
  late final GeneratedColumn<String> plausibleGenotypesJson =
      GeneratedColumn<String>(
        'plausible_genotypes_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    phenotypeTraitId,
    label,
    plausibleGenotypesJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'phenotype_trait_options';
  @override
  VerificationContext validateIntegrity(
    Insertable<PhenotypeTraitOption> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('phenotype_trait_id')) {
      context.handle(
        _phenotypeTraitIdMeta,
        phenotypeTraitId.isAcceptableOrUnknown(
          data['phenotype_trait_id']!,
          _phenotypeTraitIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phenotypeTraitIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('plausible_genotypes_json')) {
      context.handle(
        _plausibleGenotypesJsonMeta,
        plausibleGenotypesJson.isAcceptableOrUnknown(
          data['plausible_genotypes_json']!,
          _plausibleGenotypesJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PhenotypeTraitOption map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhenotypeTraitOption(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      phenotypeTraitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phenotype_trait_id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      plausibleGenotypesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plausible_genotypes_json'],
      ),
    );
  }

  @override
  $PhenotypeTraitOptionsTable createAlias(String alias) {
    return $PhenotypeTraitOptionsTable(attachedDatabase, alias);
  }
}

class PhenotypeTraitOption extends DataClass
    implements Insertable<PhenotypeTraitOption> {
  final String id;
  final String phenotypeTraitId;
  final String label;

  /// JSON list of plausible allele-id combinations at the related locus
  /// consistent with this visible option (each inner list is 1 allele id
  /// for a hemizygous outcome, or 2 for a diploid outcome). Used by the
  /// genetics engine as a lightweight fallback when genotype is unknown
  /// but phenotype was observed - never as a substitute for a
  /// known/tested genotype.
  final String? plausibleGenotypesJson;
  const PhenotypeTraitOption({
    required this.id,
    required this.phenotypeTraitId,
    required this.label,
    this.plausibleGenotypesJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['phenotype_trait_id'] = Variable<String>(phenotypeTraitId);
    map['label'] = Variable<String>(label);
    if (!nullToAbsent || plausibleGenotypesJson != null) {
      map['plausible_genotypes_json'] = Variable<String>(
        plausibleGenotypesJson,
      );
    }
    return map;
  }

  PhenotypeTraitOptionsCompanion toCompanion(bool nullToAbsent) {
    return PhenotypeTraitOptionsCompanion(
      id: Value(id),
      phenotypeTraitId: Value(phenotypeTraitId),
      label: Value(label),
      plausibleGenotypesJson: plausibleGenotypesJson == null && nullToAbsent
          ? const Value.absent()
          : Value(plausibleGenotypesJson),
    );
  }

  factory PhenotypeTraitOption.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhenotypeTraitOption(
      id: serializer.fromJson<String>(json['id']),
      phenotypeTraitId: serializer.fromJson<String>(json['phenotypeTraitId']),
      label: serializer.fromJson<String>(json['label']),
      plausibleGenotypesJson: serializer.fromJson<String?>(
        json['plausibleGenotypesJson'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'phenotypeTraitId': serializer.toJson<String>(phenotypeTraitId),
      'label': serializer.toJson<String>(label),
      'plausibleGenotypesJson': serializer.toJson<String?>(
        plausibleGenotypesJson,
      ),
    };
  }

  PhenotypeTraitOption copyWith({
    String? id,
    String? phenotypeTraitId,
    String? label,
    Value<String?> plausibleGenotypesJson = const Value.absent(),
  }) => PhenotypeTraitOption(
    id: id ?? this.id,
    phenotypeTraitId: phenotypeTraitId ?? this.phenotypeTraitId,
    label: label ?? this.label,
    plausibleGenotypesJson: plausibleGenotypesJson.present
        ? plausibleGenotypesJson.value
        : this.plausibleGenotypesJson,
  );
  PhenotypeTraitOption copyWithCompanion(PhenotypeTraitOptionsCompanion data) {
    return PhenotypeTraitOption(
      id: data.id.present ? data.id.value : this.id,
      phenotypeTraitId: data.phenotypeTraitId.present
          ? data.phenotypeTraitId.value
          : this.phenotypeTraitId,
      label: data.label.present ? data.label.value : this.label,
      plausibleGenotypesJson: data.plausibleGenotypesJson.present
          ? data.plausibleGenotypesJson.value
          : this.plausibleGenotypesJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhenotypeTraitOption(')
          ..write('id: $id, ')
          ..write('phenotypeTraitId: $phenotypeTraitId, ')
          ..write('label: $label, ')
          ..write('plausibleGenotypesJson: $plausibleGenotypesJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, phenotypeTraitId, label, plausibleGenotypesJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhenotypeTraitOption &&
          other.id == this.id &&
          other.phenotypeTraitId == this.phenotypeTraitId &&
          other.label == this.label &&
          other.plausibleGenotypesJson == this.plausibleGenotypesJson);
}

class PhenotypeTraitOptionsCompanion
    extends UpdateCompanion<PhenotypeTraitOption> {
  final Value<String> id;
  final Value<String> phenotypeTraitId;
  final Value<String> label;
  final Value<String?> plausibleGenotypesJson;
  final Value<int> rowid;
  const PhenotypeTraitOptionsCompanion({
    this.id = const Value.absent(),
    this.phenotypeTraitId = const Value.absent(),
    this.label = const Value.absent(),
    this.plausibleGenotypesJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PhenotypeTraitOptionsCompanion.insert({
    this.id = const Value.absent(),
    required String phenotypeTraitId,
    required String label,
    this.plausibleGenotypesJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : phenotypeTraitId = Value(phenotypeTraitId),
       label = Value(label);
  static Insertable<PhenotypeTraitOption> custom({
    Expression<String>? id,
    Expression<String>? phenotypeTraitId,
    Expression<String>? label,
    Expression<String>? plausibleGenotypesJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (phenotypeTraitId != null) 'phenotype_trait_id': phenotypeTraitId,
      if (label != null) 'label': label,
      if (plausibleGenotypesJson != null)
        'plausible_genotypes_json': plausibleGenotypesJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PhenotypeTraitOptionsCompanion copyWith({
    Value<String>? id,
    Value<String>? phenotypeTraitId,
    Value<String>? label,
    Value<String?>? plausibleGenotypesJson,
    Value<int>? rowid,
  }) {
    return PhenotypeTraitOptionsCompanion(
      id: id ?? this.id,
      phenotypeTraitId: phenotypeTraitId ?? this.phenotypeTraitId,
      label: label ?? this.label,
      plausibleGenotypesJson:
          plausibleGenotypesJson ?? this.plausibleGenotypesJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (phenotypeTraitId.present) {
      map['phenotype_trait_id'] = Variable<String>(phenotypeTraitId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (plausibleGenotypesJson.present) {
      map['plausible_genotypes_json'] = Variable<String>(
        plausibleGenotypesJson.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhenotypeTraitOptionsCompanion(')
          ..write('id: $id, ')
          ..write('phenotypeTraitId: $phenotypeTraitId, ')
          ..write('label: $label, ')
          ..write('plausibleGenotypesJson: $plausibleGenotypesJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnimalPhenotypeObservationsTable extends AnimalPhenotypeObservations
    with
        TableInfo<
          $AnimalPhenotypeObservationsTable,
          AnimalPhenotypeObservation
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnimalPhenotypeObservationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _animalIdMeta = const VerificationMeta(
    'animalId',
  );
  @override
  late final GeneratedColumn<String> animalId = GeneratedColumn<String>(
    'animal_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES animals (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _phenotypeTraitIdMeta = const VerificationMeta(
    'phenotypeTraitId',
  );
  @override
  late final GeneratedColumn<String> phenotypeTraitId = GeneratedColumn<String>(
    'phenotype_trait_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES phenotype_traits (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _selectedOptionIdMeta = const VerificationMeta(
    'selectedOptionId',
  );
  @override
  late final GeneratedColumn<String> selectedOptionId = GeneratedColumn<String>(
    'selected_option_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES phenotype_trait_options (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _freeTextValueMeta = const VerificationMeta(
    'freeTextValue',
  );
  @override
  late final GeneratedColumn<String> freeTextValue = GeneratedColumn<String>(
    'free_text_value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _observedDateMeta = const VerificationMeta(
    'observedDate',
  );
  @override
  late final GeneratedColumn<DateTime> observedDate = GeneratedColumn<DateTime>(
    'observed_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    animalId,
    phenotypeTraitId,
    selectedOptionId,
    freeTextValue,
    observedDate,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'animal_phenotype_observations';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnimalPhenotypeObservation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('animal_id')) {
      context.handle(
        _animalIdMeta,
        animalId.isAcceptableOrUnknown(data['animal_id']!, _animalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_animalIdMeta);
    }
    if (data.containsKey('phenotype_trait_id')) {
      context.handle(
        _phenotypeTraitIdMeta,
        phenotypeTraitId.isAcceptableOrUnknown(
          data['phenotype_trait_id']!,
          _phenotypeTraitIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phenotypeTraitIdMeta);
    }
    if (data.containsKey('selected_option_id')) {
      context.handle(
        _selectedOptionIdMeta,
        selectedOptionId.isAcceptableOrUnknown(
          data['selected_option_id']!,
          _selectedOptionIdMeta,
        ),
      );
    }
    if (data.containsKey('free_text_value')) {
      context.handle(
        _freeTextValueMeta,
        freeTextValue.isAcceptableOrUnknown(
          data['free_text_value']!,
          _freeTextValueMeta,
        ),
      );
    }
    if (data.containsKey('observed_date')) {
      context.handle(
        _observedDateMeta,
        observedDate.isAcceptableOrUnknown(
          data['observed_date']!,
          _observedDateMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnimalPhenotypeObservation map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnimalPhenotypeObservation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      animalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}animal_id'],
      )!,
      phenotypeTraitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phenotype_trait_id'],
      )!,
      selectedOptionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_option_id'],
      ),
      freeTextValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}free_text_value'],
      ),
      observedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}observed_date'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AnimalPhenotypeObservationsTable createAlias(String alias) {
    return $AnimalPhenotypeObservationsTable(attachedDatabase, alias);
  }
}

class AnimalPhenotypeObservation extends DataClass
    implements Insertable<AnimalPhenotypeObservation> {
  final String id;
  final String animalId;
  final String phenotypeTraitId;
  final String? selectedOptionId;
  final String? freeTextValue;
  final DateTime? observedDate;
  final String? notes;
  final DateTime createdAt;
  const AnimalPhenotypeObservation({
    required this.id,
    required this.animalId,
    required this.phenotypeTraitId,
    this.selectedOptionId,
    this.freeTextValue,
    this.observedDate,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['animal_id'] = Variable<String>(animalId);
    map['phenotype_trait_id'] = Variable<String>(phenotypeTraitId);
    if (!nullToAbsent || selectedOptionId != null) {
      map['selected_option_id'] = Variable<String>(selectedOptionId);
    }
    if (!nullToAbsent || freeTextValue != null) {
      map['free_text_value'] = Variable<String>(freeTextValue);
    }
    if (!nullToAbsent || observedDate != null) {
      map['observed_date'] = Variable<DateTime>(observedDate);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AnimalPhenotypeObservationsCompanion toCompanion(bool nullToAbsent) {
    return AnimalPhenotypeObservationsCompanion(
      id: Value(id),
      animalId: Value(animalId),
      phenotypeTraitId: Value(phenotypeTraitId),
      selectedOptionId: selectedOptionId == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedOptionId),
      freeTextValue: freeTextValue == null && nullToAbsent
          ? const Value.absent()
          : Value(freeTextValue),
      observedDate: observedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(observedDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory AnimalPhenotypeObservation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnimalPhenotypeObservation(
      id: serializer.fromJson<String>(json['id']),
      animalId: serializer.fromJson<String>(json['animalId']),
      phenotypeTraitId: serializer.fromJson<String>(json['phenotypeTraitId']),
      selectedOptionId: serializer.fromJson<String?>(json['selectedOptionId']),
      freeTextValue: serializer.fromJson<String?>(json['freeTextValue']),
      observedDate: serializer.fromJson<DateTime?>(json['observedDate']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'animalId': serializer.toJson<String>(animalId),
      'phenotypeTraitId': serializer.toJson<String>(phenotypeTraitId),
      'selectedOptionId': serializer.toJson<String?>(selectedOptionId),
      'freeTextValue': serializer.toJson<String?>(freeTextValue),
      'observedDate': serializer.toJson<DateTime?>(observedDate),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AnimalPhenotypeObservation copyWith({
    String? id,
    String? animalId,
    String? phenotypeTraitId,
    Value<String?> selectedOptionId = const Value.absent(),
    Value<String?> freeTextValue = const Value.absent(),
    Value<DateTime?> observedDate = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => AnimalPhenotypeObservation(
    id: id ?? this.id,
    animalId: animalId ?? this.animalId,
    phenotypeTraitId: phenotypeTraitId ?? this.phenotypeTraitId,
    selectedOptionId: selectedOptionId.present
        ? selectedOptionId.value
        : this.selectedOptionId,
    freeTextValue: freeTextValue.present
        ? freeTextValue.value
        : this.freeTextValue,
    observedDate: observedDate.present ? observedDate.value : this.observedDate,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  AnimalPhenotypeObservation copyWithCompanion(
    AnimalPhenotypeObservationsCompanion data,
  ) {
    return AnimalPhenotypeObservation(
      id: data.id.present ? data.id.value : this.id,
      animalId: data.animalId.present ? data.animalId.value : this.animalId,
      phenotypeTraitId: data.phenotypeTraitId.present
          ? data.phenotypeTraitId.value
          : this.phenotypeTraitId,
      selectedOptionId: data.selectedOptionId.present
          ? data.selectedOptionId.value
          : this.selectedOptionId,
      freeTextValue: data.freeTextValue.present
          ? data.freeTextValue.value
          : this.freeTextValue,
      observedDate: data.observedDate.present
          ? data.observedDate.value
          : this.observedDate,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnimalPhenotypeObservation(')
          ..write('id: $id, ')
          ..write('animalId: $animalId, ')
          ..write('phenotypeTraitId: $phenotypeTraitId, ')
          ..write('selectedOptionId: $selectedOptionId, ')
          ..write('freeTextValue: $freeTextValue, ')
          ..write('observedDate: $observedDate, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    animalId,
    phenotypeTraitId,
    selectedOptionId,
    freeTextValue,
    observedDate,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnimalPhenotypeObservation &&
          other.id == this.id &&
          other.animalId == this.animalId &&
          other.phenotypeTraitId == this.phenotypeTraitId &&
          other.selectedOptionId == this.selectedOptionId &&
          other.freeTextValue == this.freeTextValue &&
          other.observedDate == this.observedDate &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class AnimalPhenotypeObservationsCompanion
    extends UpdateCompanion<AnimalPhenotypeObservation> {
  final Value<String> id;
  final Value<String> animalId;
  final Value<String> phenotypeTraitId;
  final Value<String?> selectedOptionId;
  final Value<String?> freeTextValue;
  final Value<DateTime?> observedDate;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AnimalPhenotypeObservationsCompanion({
    this.id = const Value.absent(),
    this.animalId = const Value.absent(),
    this.phenotypeTraitId = const Value.absent(),
    this.selectedOptionId = const Value.absent(),
    this.freeTextValue = const Value.absent(),
    this.observedDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnimalPhenotypeObservationsCompanion.insert({
    this.id = const Value.absent(),
    required String animalId,
    required String phenotypeTraitId,
    this.selectedOptionId = const Value.absent(),
    this.freeTextValue = const Value.absent(),
    this.observedDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : animalId = Value(animalId),
       phenotypeTraitId = Value(phenotypeTraitId);
  static Insertable<AnimalPhenotypeObservation> custom({
    Expression<String>? id,
    Expression<String>? animalId,
    Expression<String>? phenotypeTraitId,
    Expression<String>? selectedOptionId,
    Expression<String>? freeTextValue,
    Expression<DateTime>? observedDate,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (animalId != null) 'animal_id': animalId,
      if (phenotypeTraitId != null) 'phenotype_trait_id': phenotypeTraitId,
      if (selectedOptionId != null) 'selected_option_id': selectedOptionId,
      if (freeTextValue != null) 'free_text_value': freeTextValue,
      if (observedDate != null) 'observed_date': observedDate,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnimalPhenotypeObservationsCompanion copyWith({
    Value<String>? id,
    Value<String>? animalId,
    Value<String>? phenotypeTraitId,
    Value<String?>? selectedOptionId,
    Value<String?>? freeTextValue,
    Value<DateTime?>? observedDate,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return AnimalPhenotypeObservationsCompanion(
      id: id ?? this.id,
      animalId: animalId ?? this.animalId,
      phenotypeTraitId: phenotypeTraitId ?? this.phenotypeTraitId,
      selectedOptionId: selectedOptionId ?? this.selectedOptionId,
      freeTextValue: freeTextValue ?? this.freeTextValue,
      observedDate: observedDate ?? this.observedDate,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (animalId.present) {
      map['animal_id'] = Variable<String>(animalId.value);
    }
    if (phenotypeTraitId.present) {
      map['phenotype_trait_id'] = Variable<String>(phenotypeTraitId.value);
    }
    if (selectedOptionId.present) {
      map['selected_option_id'] = Variable<String>(selectedOptionId.value);
    }
    if (freeTextValue.present) {
      map['free_text_value'] = Variable<String>(freeTextValue.value);
    }
    if (observedDate.present) {
      map['observed_date'] = Variable<DateTime>(observedDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnimalPhenotypeObservationsCompanion(')
          ..write('id: $id, ')
          ..write('animalId: $animalId, ')
          ..write('phenotypeTraitId: $phenotypeTraitId, ')
          ..write('selectedOptionId: $selectedOptionId, ')
          ..write('freeTextValue: $freeTextValue, ')
          ..write('observedDate: $observedDate, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BreedingPairingsTable extends BreedingPairings
    with TableInfo<$BreedingPairingsTable, BreedingPairing> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BreedingPairingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _speciesIdMeta = const VerificationMeta(
    'speciesId',
  );
  @override
  late final GeneratedColumn<String> speciesId = GeneratedColumn<String>(
    'species_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES species (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _sireIdMeta = const VerificationMeta('sireId');
  @override
  late final GeneratedColumn<String> sireId = GeneratedColumn<String>(
    'sire_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES animals (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _damIdMeta = const VerificationMeta('damId');
  @override
  late final GeneratedColumn<String> damId = GeneratedColumn<String>(
    'dam_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES animals (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _pairingDateMeta = const VerificationMeta(
    'pairingDate',
  );
  @override
  late final GeneratedColumn<DateTime> pairingDate = GeneratedColumn<DateTime>(
    'pairing_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('planned'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    speciesId,
    sireId,
    damId,
    pairingDate,
    status,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'breeding_pairings';
  @override
  VerificationContext validateIntegrity(
    Insertable<BreedingPairing> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('species_id')) {
      context.handle(
        _speciesIdMeta,
        speciesId.isAcceptableOrUnknown(data['species_id']!, _speciesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesIdMeta);
    }
    if (data.containsKey('sire_id')) {
      context.handle(
        _sireIdMeta,
        sireId.isAcceptableOrUnknown(data['sire_id']!, _sireIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sireIdMeta);
    }
    if (data.containsKey('dam_id')) {
      context.handle(
        _damIdMeta,
        damId.isAcceptableOrUnknown(data['dam_id']!, _damIdMeta),
      );
    } else if (isInserting) {
      context.missing(_damIdMeta);
    }
    if (data.containsKey('pairing_date')) {
      context.handle(
        _pairingDateMeta,
        pairingDate.isAcceptableOrUnknown(
          data['pairing_date']!,
          _pairingDateMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BreedingPairing map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BreedingPairing(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      speciesId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species_id'],
      )!,
      sireId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sire_id'],
      )!,
      damId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dam_id'],
      )!,
      pairingDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}pairing_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $BreedingPairingsTable createAlias(String alias) {
    return $BreedingPairingsTable(attachedDatabase, alias);
  }
}

class BreedingPairing extends DataClass implements Insertable<BreedingPairing> {
  final String id;
  final String speciesId;
  final String sireId;
  final String damId;
  final DateTime? pairingDate;

  /// 'planned' | 'active' | 'completed'
  final String status;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const BreedingPairing({
    required this.id,
    required this.speciesId,
    required this.sireId,
    required this.damId,
    this.pairingDate,
    required this.status,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['species_id'] = Variable<String>(speciesId);
    map['sire_id'] = Variable<String>(sireId);
    map['dam_id'] = Variable<String>(damId);
    if (!nullToAbsent || pairingDate != null) {
      map['pairing_date'] = Variable<DateTime>(pairingDate);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  BreedingPairingsCompanion toCompanion(bool nullToAbsent) {
    return BreedingPairingsCompanion(
      id: Value(id),
      speciesId: Value(speciesId),
      sireId: Value(sireId),
      damId: Value(damId),
      pairingDate: pairingDate == null && nullToAbsent
          ? const Value.absent()
          : Value(pairingDate),
      status: Value(status),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory BreedingPairing.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BreedingPairing(
      id: serializer.fromJson<String>(json['id']),
      speciesId: serializer.fromJson<String>(json['speciesId']),
      sireId: serializer.fromJson<String>(json['sireId']),
      damId: serializer.fromJson<String>(json['damId']),
      pairingDate: serializer.fromJson<DateTime?>(json['pairingDate']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'speciesId': serializer.toJson<String>(speciesId),
      'sireId': serializer.toJson<String>(sireId),
      'damId': serializer.toJson<String>(damId),
      'pairingDate': serializer.toJson<DateTime?>(pairingDate),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  BreedingPairing copyWith({
    String? id,
    String? speciesId,
    String? sireId,
    String? damId,
    Value<DateTime?> pairingDate = const Value.absent(),
    String? status,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => BreedingPairing(
    id: id ?? this.id,
    speciesId: speciesId ?? this.speciesId,
    sireId: sireId ?? this.sireId,
    damId: damId ?? this.damId,
    pairingDate: pairingDate.present ? pairingDate.value : this.pairingDate,
    status: status ?? this.status,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  BreedingPairing copyWithCompanion(BreedingPairingsCompanion data) {
    return BreedingPairing(
      id: data.id.present ? data.id.value : this.id,
      speciesId: data.speciesId.present ? data.speciesId.value : this.speciesId,
      sireId: data.sireId.present ? data.sireId.value : this.sireId,
      damId: data.damId.present ? data.damId.value : this.damId,
      pairingDate: data.pairingDate.present
          ? data.pairingDate.value
          : this.pairingDate,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BreedingPairing(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('sireId: $sireId, ')
          ..write('damId: $damId, ')
          ..write('pairingDate: $pairingDate, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    speciesId,
    sireId,
    damId,
    pairingDate,
    status,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BreedingPairing &&
          other.id == this.id &&
          other.speciesId == this.speciesId &&
          other.sireId == this.sireId &&
          other.damId == this.damId &&
          other.pairingDate == this.pairingDate &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class BreedingPairingsCompanion extends UpdateCompanion<BreedingPairing> {
  final Value<String> id;
  final Value<String> speciesId;
  final Value<String> sireId;
  final Value<String> damId;
  final Value<DateTime?> pairingDate;
  final Value<String> status;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const BreedingPairingsCompanion({
    this.id = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.sireId = const Value.absent(),
    this.damId = const Value.absent(),
    this.pairingDate = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BreedingPairingsCompanion.insert({
    this.id = const Value.absent(),
    required String speciesId,
    required String sireId,
    required String damId,
    this.pairingDate = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : speciesId = Value(speciesId),
       sireId = Value(sireId),
       damId = Value(damId);
  static Insertable<BreedingPairing> custom({
    Expression<String>? id,
    Expression<String>? speciesId,
    Expression<String>? sireId,
    Expression<String>? damId,
    Expression<DateTime>? pairingDate,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (speciesId != null) 'species_id': speciesId,
      if (sireId != null) 'sire_id': sireId,
      if (damId != null) 'dam_id': damId,
      if (pairingDate != null) 'pairing_date': pairingDate,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BreedingPairingsCompanion copyWith({
    Value<String>? id,
    Value<String>? speciesId,
    Value<String>? sireId,
    Value<String>? damId,
    Value<DateTime?>? pairingDate,
    Value<String>? status,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return BreedingPairingsCompanion(
      id: id ?? this.id,
      speciesId: speciesId ?? this.speciesId,
      sireId: sireId ?? this.sireId,
      damId: damId ?? this.damId,
      pairingDate: pairingDate ?? this.pairingDate,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<String>(speciesId.value);
    }
    if (sireId.present) {
      map['sire_id'] = Variable<String>(sireId.value);
    }
    if (damId.present) {
      map['dam_id'] = Variable<String>(damId.value);
    }
    if (pairingDate.present) {
      map['pairing_date'] = Variable<DateTime>(pairingDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BreedingPairingsCompanion(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('sireId: $sireId, ')
          ..write('damId: $damId, ')
          ..write('pairingDate: $pairingDate, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BreedingPredictionsTable extends BreedingPredictions
    with TableInfo<$BreedingPredictionsTable, BreedingPrediction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BreedingPredictionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _pairingIdMeta = const VerificationMeta(
    'pairingId',
  );
  @override
  late final GeneratedColumn<String> pairingId = GeneratedColumn<String>(
    'pairing_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES breeding_pairings (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _computedAtMeta = const VerificationMeta(
    'computedAt',
  );
  @override
  late final GeneratedColumn<DateTime> computedAt = GeneratedColumn<DateTime>(
    'computed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _resultJsonMeta = const VerificationMeta(
    'resultJson',
  );
  @override
  late final GeneratedColumn<String> resultJson = GeneratedColumn<String>(
    'result_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, pairingId, computedAt, resultJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'breeding_predictions';
  @override
  VerificationContext validateIntegrity(
    Insertable<BreedingPrediction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pairing_id')) {
      context.handle(
        _pairingIdMeta,
        pairingId.isAcceptableOrUnknown(data['pairing_id']!, _pairingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pairingIdMeta);
    }
    if (data.containsKey('computed_at')) {
      context.handle(
        _computedAtMeta,
        computedAt.isAcceptableOrUnknown(data['computed_at']!, _computedAtMeta),
      );
    }
    if (data.containsKey('result_json')) {
      context.handle(
        _resultJsonMeta,
        resultJson.isAcceptableOrUnknown(data['result_json']!, _resultJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_resultJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BreedingPrediction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BreedingPrediction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      pairingId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pairing_id'],
      )!,
      computedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}computed_at'],
      )!,
      resultJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result_json'],
      )!,
    );
  }

  @override
  $BreedingPredictionsTable createAlias(String alias) {
    return $BreedingPredictionsTable(attachedDatabase, alias);
  }
}

class BreedingPrediction extends DataClass
    implements Insertable<BreedingPrediction> {
  final String id;
  final String pairingId;
  final DateTime computedAt;

  /// Serialized PairingPrediction (see domain/genetics).
  final String resultJson;
  const BreedingPrediction({
    required this.id,
    required this.pairingId,
    required this.computedAt,
    required this.resultJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pairing_id'] = Variable<String>(pairingId);
    map['computed_at'] = Variable<DateTime>(computedAt);
    map['result_json'] = Variable<String>(resultJson);
    return map;
  }

  BreedingPredictionsCompanion toCompanion(bool nullToAbsent) {
    return BreedingPredictionsCompanion(
      id: Value(id),
      pairingId: Value(pairingId),
      computedAt: Value(computedAt),
      resultJson: Value(resultJson),
    );
  }

  factory BreedingPrediction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BreedingPrediction(
      id: serializer.fromJson<String>(json['id']),
      pairingId: serializer.fromJson<String>(json['pairingId']),
      computedAt: serializer.fromJson<DateTime>(json['computedAt']),
      resultJson: serializer.fromJson<String>(json['resultJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pairingId': serializer.toJson<String>(pairingId),
      'computedAt': serializer.toJson<DateTime>(computedAt),
      'resultJson': serializer.toJson<String>(resultJson),
    };
  }

  BreedingPrediction copyWith({
    String? id,
    String? pairingId,
    DateTime? computedAt,
    String? resultJson,
  }) => BreedingPrediction(
    id: id ?? this.id,
    pairingId: pairingId ?? this.pairingId,
    computedAt: computedAt ?? this.computedAt,
    resultJson: resultJson ?? this.resultJson,
  );
  BreedingPrediction copyWithCompanion(BreedingPredictionsCompanion data) {
    return BreedingPrediction(
      id: data.id.present ? data.id.value : this.id,
      pairingId: data.pairingId.present ? data.pairingId.value : this.pairingId,
      computedAt: data.computedAt.present
          ? data.computedAt.value
          : this.computedAt,
      resultJson: data.resultJson.present
          ? data.resultJson.value
          : this.resultJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BreedingPrediction(')
          ..write('id: $id, ')
          ..write('pairingId: $pairingId, ')
          ..write('computedAt: $computedAt, ')
          ..write('resultJson: $resultJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pairingId, computedAt, resultJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BreedingPrediction &&
          other.id == this.id &&
          other.pairingId == this.pairingId &&
          other.computedAt == this.computedAt &&
          other.resultJson == this.resultJson);
}

class BreedingPredictionsCompanion extends UpdateCompanion<BreedingPrediction> {
  final Value<String> id;
  final Value<String> pairingId;
  final Value<DateTime> computedAt;
  final Value<String> resultJson;
  final Value<int> rowid;
  const BreedingPredictionsCompanion({
    this.id = const Value.absent(),
    this.pairingId = const Value.absent(),
    this.computedAt = const Value.absent(),
    this.resultJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BreedingPredictionsCompanion.insert({
    this.id = const Value.absent(),
    required String pairingId,
    this.computedAt = const Value.absent(),
    required String resultJson,
    this.rowid = const Value.absent(),
  }) : pairingId = Value(pairingId),
       resultJson = Value(resultJson);
  static Insertable<BreedingPrediction> custom({
    Expression<String>? id,
    Expression<String>? pairingId,
    Expression<DateTime>? computedAt,
    Expression<String>? resultJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pairingId != null) 'pairing_id': pairingId,
      if (computedAt != null) 'computed_at': computedAt,
      if (resultJson != null) 'result_json': resultJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BreedingPredictionsCompanion copyWith({
    Value<String>? id,
    Value<String>? pairingId,
    Value<DateTime>? computedAt,
    Value<String>? resultJson,
    Value<int>? rowid,
  }) {
    return BreedingPredictionsCompanion(
      id: id ?? this.id,
      pairingId: pairingId ?? this.pairingId,
      computedAt: computedAt ?? this.computedAt,
      resultJson: resultJson ?? this.resultJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pairingId.present) {
      map['pairing_id'] = Variable<String>(pairingId.value);
    }
    if (computedAt.present) {
      map['computed_at'] = Variable<DateTime>(computedAt.value);
    }
    if (resultJson.present) {
      map['result_json'] = Variable<String>(resultJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BreedingPredictionsCompanion(')
          ..write('id: $id, ')
          ..write('pairingId: $pairingId, ')
          ..write('computedAt: $computedAt, ')
          ..write('resultJson: $resultJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BreedingEventsTable extends BreedingEvents
    with TableInfo<$BreedingEventsTable, BreedingEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BreedingEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _pairingIdMeta = const VerificationMeta(
    'pairingId',
  );
  @override
  late final GeneratedColumn<String> pairingId = GeneratedColumn<String>(
    'pairing_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES breeding_pairings (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _eventDateMeta = const VerificationMeta(
    'eventDate',
  );
  @override
  late final GeneratedColumn<DateTime> eventDate = GeneratedColumn<DateTime>(
    'event_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expectedOffspringDateMeta =
      const VerificationMeta('expectedOffspringDate');
  @override
  late final GeneratedColumn<DateTime> expectedOffspringDate =
      GeneratedColumn<DateTime>(
        'expected_offspring_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _actualOffspringDateMeta =
      const VerificationMeta('actualOffspringDate');
  @override
  late final GeneratedColumn<DateTime> actualOffspringDate =
      GeneratedColumn<DateTime>(
        'actual_offspring_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('predicted'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pairingId,
    eventDate,
    expectedOffspringDate,
    actualOffspringDate,
    status,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'breeding_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<BreedingEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pairing_id')) {
      context.handle(
        _pairingIdMeta,
        pairingId.isAcceptableOrUnknown(data['pairing_id']!, _pairingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pairingIdMeta);
    }
    if (data.containsKey('event_date')) {
      context.handle(
        _eventDateMeta,
        eventDate.isAcceptableOrUnknown(data['event_date']!, _eventDateMeta),
      );
    } else if (isInserting) {
      context.missing(_eventDateMeta);
    }
    if (data.containsKey('expected_offspring_date')) {
      context.handle(
        _expectedOffspringDateMeta,
        expectedOffspringDate.isAcceptableOrUnknown(
          data['expected_offspring_date']!,
          _expectedOffspringDateMeta,
        ),
      );
    }
    if (data.containsKey('actual_offspring_date')) {
      context.handle(
        _actualOffspringDateMeta,
        actualOffspringDate.isAcceptableOrUnknown(
          data['actual_offspring_date']!,
          _actualOffspringDateMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BreedingEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BreedingEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      pairingId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pairing_id'],
      )!,
      eventDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}event_date'],
      )!,
      expectedOffspringDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expected_offspring_date'],
      ),
      actualOffspringDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}actual_offspring_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BreedingEventsTable createAlias(String alias) {
    return $BreedingEventsTable(attachedDatabase, alias);
  }
}

class BreedingEvent extends DataClass implements Insertable<BreedingEvent> {
  final String id;
  final String pairingId;
  final DateTime eventDate;
  final DateTime? expectedOffspringDate;
  final DateTime? actualOffspringDate;

  /// 'predicted' | 'incubating' | 'hatched' | 'born' | 'failed'
  final String status;
  final String? notes;
  final DateTime createdAt;
  const BreedingEvent({
    required this.id,
    required this.pairingId,
    required this.eventDate,
    this.expectedOffspringDate,
    this.actualOffspringDate,
    required this.status,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pairing_id'] = Variable<String>(pairingId);
    map['event_date'] = Variable<DateTime>(eventDate);
    if (!nullToAbsent || expectedOffspringDate != null) {
      map['expected_offspring_date'] = Variable<DateTime>(
        expectedOffspringDate,
      );
    }
    if (!nullToAbsent || actualOffspringDate != null) {
      map['actual_offspring_date'] = Variable<DateTime>(actualOffspringDate);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BreedingEventsCompanion toCompanion(bool nullToAbsent) {
    return BreedingEventsCompanion(
      id: Value(id),
      pairingId: Value(pairingId),
      eventDate: Value(eventDate),
      expectedOffspringDate: expectedOffspringDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedOffspringDate),
      actualOffspringDate: actualOffspringDate == null && nullToAbsent
          ? const Value.absent()
          : Value(actualOffspringDate),
      status: Value(status),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory BreedingEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BreedingEvent(
      id: serializer.fromJson<String>(json['id']),
      pairingId: serializer.fromJson<String>(json['pairingId']),
      eventDate: serializer.fromJson<DateTime>(json['eventDate']),
      expectedOffspringDate: serializer.fromJson<DateTime?>(
        json['expectedOffspringDate'],
      ),
      actualOffspringDate: serializer.fromJson<DateTime?>(
        json['actualOffspringDate'],
      ),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pairingId': serializer.toJson<String>(pairingId),
      'eventDate': serializer.toJson<DateTime>(eventDate),
      'expectedOffspringDate': serializer.toJson<DateTime?>(
        expectedOffspringDate,
      ),
      'actualOffspringDate': serializer.toJson<DateTime?>(actualOffspringDate),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BreedingEvent copyWith({
    String? id,
    String? pairingId,
    DateTime? eventDate,
    Value<DateTime?> expectedOffspringDate = const Value.absent(),
    Value<DateTime?> actualOffspringDate = const Value.absent(),
    String? status,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => BreedingEvent(
    id: id ?? this.id,
    pairingId: pairingId ?? this.pairingId,
    eventDate: eventDate ?? this.eventDate,
    expectedOffspringDate: expectedOffspringDate.present
        ? expectedOffspringDate.value
        : this.expectedOffspringDate,
    actualOffspringDate: actualOffspringDate.present
        ? actualOffspringDate.value
        : this.actualOffspringDate,
    status: status ?? this.status,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  BreedingEvent copyWithCompanion(BreedingEventsCompanion data) {
    return BreedingEvent(
      id: data.id.present ? data.id.value : this.id,
      pairingId: data.pairingId.present ? data.pairingId.value : this.pairingId,
      eventDate: data.eventDate.present ? data.eventDate.value : this.eventDate,
      expectedOffspringDate: data.expectedOffspringDate.present
          ? data.expectedOffspringDate.value
          : this.expectedOffspringDate,
      actualOffspringDate: data.actualOffspringDate.present
          ? data.actualOffspringDate.value
          : this.actualOffspringDate,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BreedingEvent(')
          ..write('id: $id, ')
          ..write('pairingId: $pairingId, ')
          ..write('eventDate: $eventDate, ')
          ..write('expectedOffspringDate: $expectedOffspringDate, ')
          ..write('actualOffspringDate: $actualOffspringDate, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pairingId,
    eventDate,
    expectedOffspringDate,
    actualOffspringDate,
    status,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BreedingEvent &&
          other.id == this.id &&
          other.pairingId == this.pairingId &&
          other.eventDate == this.eventDate &&
          other.expectedOffspringDate == this.expectedOffspringDate &&
          other.actualOffspringDate == this.actualOffspringDate &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class BreedingEventsCompanion extends UpdateCompanion<BreedingEvent> {
  final Value<String> id;
  final Value<String> pairingId;
  final Value<DateTime> eventDate;
  final Value<DateTime?> expectedOffspringDate;
  final Value<DateTime?> actualOffspringDate;
  final Value<String> status;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const BreedingEventsCompanion({
    this.id = const Value.absent(),
    this.pairingId = const Value.absent(),
    this.eventDate = const Value.absent(),
    this.expectedOffspringDate = const Value.absent(),
    this.actualOffspringDate = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BreedingEventsCompanion.insert({
    this.id = const Value.absent(),
    required String pairingId,
    required DateTime eventDate,
    this.expectedOffspringDate = const Value.absent(),
    this.actualOffspringDate = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : pairingId = Value(pairingId),
       eventDate = Value(eventDate);
  static Insertable<BreedingEvent> custom({
    Expression<String>? id,
    Expression<String>? pairingId,
    Expression<DateTime>? eventDate,
    Expression<DateTime>? expectedOffspringDate,
    Expression<DateTime>? actualOffspringDate,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pairingId != null) 'pairing_id': pairingId,
      if (eventDate != null) 'event_date': eventDate,
      if (expectedOffspringDate != null)
        'expected_offspring_date': expectedOffspringDate,
      if (actualOffspringDate != null)
        'actual_offspring_date': actualOffspringDate,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BreedingEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? pairingId,
    Value<DateTime>? eventDate,
    Value<DateTime?>? expectedOffspringDate,
    Value<DateTime?>? actualOffspringDate,
    Value<String>? status,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return BreedingEventsCompanion(
      id: id ?? this.id,
      pairingId: pairingId ?? this.pairingId,
      eventDate: eventDate ?? this.eventDate,
      expectedOffspringDate:
          expectedOffspringDate ?? this.expectedOffspringDate,
      actualOffspringDate: actualOffspringDate ?? this.actualOffspringDate,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pairingId.present) {
      map['pairing_id'] = Variable<String>(pairingId.value);
    }
    if (eventDate.present) {
      map['event_date'] = Variable<DateTime>(eventDate.value);
    }
    if (expectedOffspringDate.present) {
      map['expected_offspring_date'] = Variable<DateTime>(
        expectedOffspringDate.value,
      );
    }
    if (actualOffspringDate.present) {
      map['actual_offspring_date'] = Variable<DateTime>(
        actualOffspringDate.value,
      );
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BreedingEventsCompanion(')
          ..write('id: $id, ')
          ..write('pairingId: $pairingId, ')
          ..write('eventDate: $eventDate, ')
          ..write('expectedOffspringDate: $expectedOffspringDate, ')
          ..write('actualOffspringDate: $actualOffspringDate, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OffspringTable extends Offspring
    with TableInfo<$OffspringTable, OffspringRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OffspringTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _breedingEventIdMeta = const VerificationMeta(
    'breedingEventId',
  );
  @override
  late final GeneratedColumn<String> breedingEventId = GeneratedColumn<String>(
    'breeding_event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES breeding_events (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _animalIdMeta = const VerificationMeta(
    'animalId',
  );
  @override
  late final GeneratedColumn<String> animalId = GeneratedColumn<String>(
    'animal_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES animals (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _sequenceNumberMeta = const VerificationMeta(
    'sequenceNumber',
  );
  @override
  late final GeneratedColumn<int> sequenceNumber = GeneratedColumn<int>(
    'sequence_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _predictedSexMeta = const VerificationMeta(
    'predictedSex',
  );
  @override
  late final GeneratedColumn<String> predictedSex = GeneratedColumn<String>(
    'predicted_sex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _predictedPhenotypeMeta =
      const VerificationMeta('predictedPhenotype');
  @override
  late final GeneratedColumn<String> predictedPhenotype =
      GeneratedColumn<String>(
        'predicted_phenotype',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _actualOutcomeMeta = const VerificationMeta(
    'actualOutcome',
  );
  @override
  late final GeneratedColumn<String> actualOutcome = GeneratedColumn<String>(
    'actual_outcome',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    breedingEventId,
    animalId,
    sequenceNumber,
    predictedSex,
    predictedPhenotype,
    actualOutcome,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offspring';
  @override
  VerificationContext validateIntegrity(
    Insertable<OffspringRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('breeding_event_id')) {
      context.handle(
        _breedingEventIdMeta,
        breedingEventId.isAcceptableOrUnknown(
          data['breeding_event_id']!,
          _breedingEventIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_breedingEventIdMeta);
    }
    if (data.containsKey('animal_id')) {
      context.handle(
        _animalIdMeta,
        animalId.isAcceptableOrUnknown(data['animal_id']!, _animalIdMeta),
      );
    }
    if (data.containsKey('sequence_number')) {
      context.handle(
        _sequenceNumberMeta,
        sequenceNumber.isAcceptableOrUnknown(
          data['sequence_number']!,
          _sequenceNumberMeta,
        ),
      );
    }
    if (data.containsKey('predicted_sex')) {
      context.handle(
        _predictedSexMeta,
        predictedSex.isAcceptableOrUnknown(
          data['predicted_sex']!,
          _predictedSexMeta,
        ),
      );
    }
    if (data.containsKey('predicted_phenotype')) {
      context.handle(
        _predictedPhenotypeMeta,
        predictedPhenotype.isAcceptableOrUnknown(
          data['predicted_phenotype']!,
          _predictedPhenotypeMeta,
        ),
      );
    }
    if (data.containsKey('actual_outcome')) {
      context.handle(
        _actualOutcomeMeta,
        actualOutcome.isAcceptableOrUnknown(
          data['actual_outcome']!,
          _actualOutcomeMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OffspringRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OffspringRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      breedingEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breeding_event_id'],
      )!,
      animalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}animal_id'],
      ),
      sequenceNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sequence_number'],
      ),
      predictedSex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}predicted_sex'],
      ),
      predictedPhenotype: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}predicted_phenotype'],
      ),
      actualOutcome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}actual_outcome'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $OffspringTable createAlias(String alias) {
    return $OffspringTable(attachedDatabase, alias);
  }
}

class OffspringRecord extends DataClass implements Insertable<OffspringRecord> {
  final String id;
  final String breedingEventId;

  /// Set once this offspring is promoted to a fully tracked Animal.
  final String? animalId;
  final int? sequenceNumber;
  final String? predictedSex;
  final String? predictedPhenotype;

  /// 'viable' | 'infertile' | 'died' | null (unknown yet)
  final String? actualOutcome;
  final String? notes;
  const OffspringRecord({
    required this.id,
    required this.breedingEventId,
    this.animalId,
    this.sequenceNumber,
    this.predictedSex,
    this.predictedPhenotype,
    this.actualOutcome,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['breeding_event_id'] = Variable<String>(breedingEventId);
    if (!nullToAbsent || animalId != null) {
      map['animal_id'] = Variable<String>(animalId);
    }
    if (!nullToAbsent || sequenceNumber != null) {
      map['sequence_number'] = Variable<int>(sequenceNumber);
    }
    if (!nullToAbsent || predictedSex != null) {
      map['predicted_sex'] = Variable<String>(predictedSex);
    }
    if (!nullToAbsent || predictedPhenotype != null) {
      map['predicted_phenotype'] = Variable<String>(predictedPhenotype);
    }
    if (!nullToAbsent || actualOutcome != null) {
      map['actual_outcome'] = Variable<String>(actualOutcome);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  OffspringCompanion toCompanion(bool nullToAbsent) {
    return OffspringCompanion(
      id: Value(id),
      breedingEventId: Value(breedingEventId),
      animalId: animalId == null && nullToAbsent
          ? const Value.absent()
          : Value(animalId),
      sequenceNumber: sequenceNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(sequenceNumber),
      predictedSex: predictedSex == null && nullToAbsent
          ? const Value.absent()
          : Value(predictedSex),
      predictedPhenotype: predictedPhenotype == null && nullToAbsent
          ? const Value.absent()
          : Value(predictedPhenotype),
      actualOutcome: actualOutcome == null && nullToAbsent
          ? const Value.absent()
          : Value(actualOutcome),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory OffspringRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OffspringRecord(
      id: serializer.fromJson<String>(json['id']),
      breedingEventId: serializer.fromJson<String>(json['breedingEventId']),
      animalId: serializer.fromJson<String?>(json['animalId']),
      sequenceNumber: serializer.fromJson<int?>(json['sequenceNumber']),
      predictedSex: serializer.fromJson<String?>(json['predictedSex']),
      predictedPhenotype: serializer.fromJson<String?>(
        json['predictedPhenotype'],
      ),
      actualOutcome: serializer.fromJson<String?>(json['actualOutcome']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'breedingEventId': serializer.toJson<String>(breedingEventId),
      'animalId': serializer.toJson<String?>(animalId),
      'sequenceNumber': serializer.toJson<int?>(sequenceNumber),
      'predictedSex': serializer.toJson<String?>(predictedSex),
      'predictedPhenotype': serializer.toJson<String?>(predictedPhenotype),
      'actualOutcome': serializer.toJson<String?>(actualOutcome),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  OffspringRecord copyWith({
    String? id,
    String? breedingEventId,
    Value<String?> animalId = const Value.absent(),
    Value<int?> sequenceNumber = const Value.absent(),
    Value<String?> predictedSex = const Value.absent(),
    Value<String?> predictedPhenotype = const Value.absent(),
    Value<String?> actualOutcome = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => OffspringRecord(
    id: id ?? this.id,
    breedingEventId: breedingEventId ?? this.breedingEventId,
    animalId: animalId.present ? animalId.value : this.animalId,
    sequenceNumber: sequenceNumber.present
        ? sequenceNumber.value
        : this.sequenceNumber,
    predictedSex: predictedSex.present ? predictedSex.value : this.predictedSex,
    predictedPhenotype: predictedPhenotype.present
        ? predictedPhenotype.value
        : this.predictedPhenotype,
    actualOutcome: actualOutcome.present
        ? actualOutcome.value
        : this.actualOutcome,
    notes: notes.present ? notes.value : this.notes,
  );
  OffspringRecord copyWithCompanion(OffspringCompanion data) {
    return OffspringRecord(
      id: data.id.present ? data.id.value : this.id,
      breedingEventId: data.breedingEventId.present
          ? data.breedingEventId.value
          : this.breedingEventId,
      animalId: data.animalId.present ? data.animalId.value : this.animalId,
      sequenceNumber: data.sequenceNumber.present
          ? data.sequenceNumber.value
          : this.sequenceNumber,
      predictedSex: data.predictedSex.present
          ? data.predictedSex.value
          : this.predictedSex,
      predictedPhenotype: data.predictedPhenotype.present
          ? data.predictedPhenotype.value
          : this.predictedPhenotype,
      actualOutcome: data.actualOutcome.present
          ? data.actualOutcome.value
          : this.actualOutcome,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OffspringRecord(')
          ..write('id: $id, ')
          ..write('breedingEventId: $breedingEventId, ')
          ..write('animalId: $animalId, ')
          ..write('sequenceNumber: $sequenceNumber, ')
          ..write('predictedSex: $predictedSex, ')
          ..write('predictedPhenotype: $predictedPhenotype, ')
          ..write('actualOutcome: $actualOutcome, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    breedingEventId,
    animalId,
    sequenceNumber,
    predictedSex,
    predictedPhenotype,
    actualOutcome,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OffspringRecord &&
          other.id == this.id &&
          other.breedingEventId == this.breedingEventId &&
          other.animalId == this.animalId &&
          other.sequenceNumber == this.sequenceNumber &&
          other.predictedSex == this.predictedSex &&
          other.predictedPhenotype == this.predictedPhenotype &&
          other.actualOutcome == this.actualOutcome &&
          other.notes == this.notes);
}

class OffspringCompanion extends UpdateCompanion<OffspringRecord> {
  final Value<String> id;
  final Value<String> breedingEventId;
  final Value<String?> animalId;
  final Value<int?> sequenceNumber;
  final Value<String?> predictedSex;
  final Value<String?> predictedPhenotype;
  final Value<String?> actualOutcome;
  final Value<String?> notes;
  final Value<int> rowid;
  const OffspringCompanion({
    this.id = const Value.absent(),
    this.breedingEventId = const Value.absent(),
    this.animalId = const Value.absent(),
    this.sequenceNumber = const Value.absent(),
    this.predictedSex = const Value.absent(),
    this.predictedPhenotype = const Value.absent(),
    this.actualOutcome = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OffspringCompanion.insert({
    this.id = const Value.absent(),
    required String breedingEventId,
    this.animalId = const Value.absent(),
    this.sequenceNumber = const Value.absent(),
    this.predictedSex = const Value.absent(),
    this.predictedPhenotype = const Value.absent(),
    this.actualOutcome = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : breedingEventId = Value(breedingEventId);
  static Insertable<OffspringRecord> custom({
    Expression<String>? id,
    Expression<String>? breedingEventId,
    Expression<String>? animalId,
    Expression<int>? sequenceNumber,
    Expression<String>? predictedSex,
    Expression<String>? predictedPhenotype,
    Expression<String>? actualOutcome,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (breedingEventId != null) 'breeding_event_id': breedingEventId,
      if (animalId != null) 'animal_id': animalId,
      if (sequenceNumber != null) 'sequence_number': sequenceNumber,
      if (predictedSex != null) 'predicted_sex': predictedSex,
      if (predictedPhenotype != null) 'predicted_phenotype': predictedPhenotype,
      if (actualOutcome != null) 'actual_outcome': actualOutcome,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OffspringCompanion copyWith({
    Value<String>? id,
    Value<String>? breedingEventId,
    Value<String?>? animalId,
    Value<int?>? sequenceNumber,
    Value<String?>? predictedSex,
    Value<String?>? predictedPhenotype,
    Value<String?>? actualOutcome,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return OffspringCompanion(
      id: id ?? this.id,
      breedingEventId: breedingEventId ?? this.breedingEventId,
      animalId: animalId ?? this.animalId,
      sequenceNumber: sequenceNumber ?? this.sequenceNumber,
      predictedSex: predictedSex ?? this.predictedSex,
      predictedPhenotype: predictedPhenotype ?? this.predictedPhenotype,
      actualOutcome: actualOutcome ?? this.actualOutcome,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (breedingEventId.present) {
      map['breeding_event_id'] = Variable<String>(breedingEventId.value);
    }
    if (animalId.present) {
      map['animal_id'] = Variable<String>(animalId.value);
    }
    if (sequenceNumber.present) {
      map['sequence_number'] = Variable<int>(sequenceNumber.value);
    }
    if (predictedSex.present) {
      map['predicted_sex'] = Variable<String>(predictedSex.value);
    }
    if (predictedPhenotype.present) {
      map['predicted_phenotype'] = Variable<String>(predictedPhenotype.value);
    }
    if (actualOutcome.present) {
      map['actual_outcome'] = Variable<String>(actualOutcome.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OffspringCompanion(')
          ..write('id: $id, ')
          ..write('breedingEventId: $breedingEventId, ')
          ..write('animalId: $animalId, ')
          ..write('sequenceNumber: $sequenceNumber, ')
          ..write('predictedSex: $predictedSex, ')
          ..write('predictedPhenotype: $predictedPhenotype, ')
          ..write('actualOutcome: $actualOutcome, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TraitDefinitionsTable extends TraitDefinitions
    with TableInfo<$TraitDefinitionsTable, TraitDefinition> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TraitDefinitionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _speciesIdMeta = const VerificationMeta(
    'speciesId',
  );
  @override
  late final GeneratedColumn<String> speciesId = GeneratedColumn<String>(
    'species_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES species (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _measurementPeriodMeta = const VerificationMeta(
    'measurementPeriod',
  );
  @override
  late final GeneratedColumn<String> measurementPeriod =
      GeneratedColumn<String>(
        'measurement_period',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _heritabilityEstimateMeta =
      const VerificationMeta('heritabilityEstimate');
  @override
  late final GeneratedColumn<double> heritabilityEstimate =
      GeneratedColumn<double>(
        'heritability_estimate',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    speciesId,
    key,
    name,
    unit,
    measurementPeriod,
    heritabilityEstimate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trait_definitions';
  @override
  VerificationContext validateIntegrity(
    Insertable<TraitDefinition> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('species_id')) {
      context.handle(
        _speciesIdMeta,
        speciesId.isAcceptableOrUnknown(data['species_id']!, _speciesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesIdMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('measurement_period')) {
      context.handle(
        _measurementPeriodMeta,
        measurementPeriod.isAcceptableOrUnknown(
          data['measurement_period']!,
          _measurementPeriodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_measurementPeriodMeta);
    }
    if (data.containsKey('heritability_estimate')) {
      context.handle(
        _heritabilityEstimateMeta,
        heritabilityEstimate.isAcceptableOrUnknown(
          data['heritability_estimate']!,
          _heritabilityEstimateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TraitDefinition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TraitDefinition(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      speciesId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species_id'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      measurementPeriod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}measurement_period'],
      )!,
      heritabilityEstimate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}heritability_estimate'],
      ),
    );
  }

  @override
  $TraitDefinitionsTable createAlias(String alias) {
    return $TraitDefinitionsTable(attachedDatabase, alias);
  }
}

class TraitDefinition extends DataClass implements Insertable<TraitDefinition> {
  final String id;
  final String speciesId;
  final String key;
  final String name;
  final String unit;

  /// 'per_day' | 'per_week' | 'per_lactation' | 'one_time'
  final String measurementPeriod;

  /// Optional 0-1 heritability estimate. Currently unused by the
  /// prediction formula (v1 is a straight mid-parent average) but kept so
  /// a future "shrink toward breed baseline" formula is a code change,
  /// not a schema change.
  final double? heritabilityEstimate;
  const TraitDefinition({
    required this.id,
    required this.speciesId,
    required this.key,
    required this.name,
    required this.unit,
    required this.measurementPeriod,
    this.heritabilityEstimate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['species_id'] = Variable<String>(speciesId);
    map['key'] = Variable<String>(key);
    map['name'] = Variable<String>(name);
    map['unit'] = Variable<String>(unit);
    map['measurement_period'] = Variable<String>(measurementPeriod);
    if (!nullToAbsent || heritabilityEstimate != null) {
      map['heritability_estimate'] = Variable<double>(heritabilityEstimate);
    }
    return map;
  }

  TraitDefinitionsCompanion toCompanion(bool nullToAbsent) {
    return TraitDefinitionsCompanion(
      id: Value(id),
      speciesId: Value(speciesId),
      key: Value(key),
      name: Value(name),
      unit: Value(unit),
      measurementPeriod: Value(measurementPeriod),
      heritabilityEstimate: heritabilityEstimate == null && nullToAbsent
          ? const Value.absent()
          : Value(heritabilityEstimate),
    );
  }

  factory TraitDefinition.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TraitDefinition(
      id: serializer.fromJson<String>(json['id']),
      speciesId: serializer.fromJson<String>(json['speciesId']),
      key: serializer.fromJson<String>(json['key']),
      name: serializer.fromJson<String>(json['name']),
      unit: serializer.fromJson<String>(json['unit']),
      measurementPeriod: serializer.fromJson<String>(json['measurementPeriod']),
      heritabilityEstimate: serializer.fromJson<double?>(
        json['heritabilityEstimate'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'speciesId': serializer.toJson<String>(speciesId),
      'key': serializer.toJson<String>(key),
      'name': serializer.toJson<String>(name),
      'unit': serializer.toJson<String>(unit),
      'measurementPeriod': serializer.toJson<String>(measurementPeriod),
      'heritabilityEstimate': serializer.toJson<double?>(heritabilityEstimate),
    };
  }

  TraitDefinition copyWith({
    String? id,
    String? speciesId,
    String? key,
    String? name,
    String? unit,
    String? measurementPeriod,
    Value<double?> heritabilityEstimate = const Value.absent(),
  }) => TraitDefinition(
    id: id ?? this.id,
    speciesId: speciesId ?? this.speciesId,
    key: key ?? this.key,
    name: name ?? this.name,
    unit: unit ?? this.unit,
    measurementPeriod: measurementPeriod ?? this.measurementPeriod,
    heritabilityEstimate: heritabilityEstimate.present
        ? heritabilityEstimate.value
        : this.heritabilityEstimate,
  );
  TraitDefinition copyWithCompanion(TraitDefinitionsCompanion data) {
    return TraitDefinition(
      id: data.id.present ? data.id.value : this.id,
      speciesId: data.speciesId.present ? data.speciesId.value : this.speciesId,
      key: data.key.present ? data.key.value : this.key,
      name: data.name.present ? data.name.value : this.name,
      unit: data.unit.present ? data.unit.value : this.unit,
      measurementPeriod: data.measurementPeriod.present
          ? data.measurementPeriod.value
          : this.measurementPeriod,
      heritabilityEstimate: data.heritabilityEstimate.present
          ? data.heritabilityEstimate.value
          : this.heritabilityEstimate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TraitDefinition(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('key: $key, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('measurementPeriod: $measurementPeriod, ')
          ..write('heritabilityEstimate: $heritabilityEstimate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    speciesId,
    key,
    name,
    unit,
    measurementPeriod,
    heritabilityEstimate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TraitDefinition &&
          other.id == this.id &&
          other.speciesId == this.speciesId &&
          other.key == this.key &&
          other.name == this.name &&
          other.unit == this.unit &&
          other.measurementPeriod == this.measurementPeriod &&
          other.heritabilityEstimate == this.heritabilityEstimate);
}

class TraitDefinitionsCompanion extends UpdateCompanion<TraitDefinition> {
  final Value<String> id;
  final Value<String> speciesId;
  final Value<String> key;
  final Value<String> name;
  final Value<String> unit;
  final Value<String> measurementPeriod;
  final Value<double?> heritabilityEstimate;
  final Value<int> rowid;
  const TraitDefinitionsCompanion({
    this.id = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.key = const Value.absent(),
    this.name = const Value.absent(),
    this.unit = const Value.absent(),
    this.measurementPeriod = const Value.absent(),
    this.heritabilityEstimate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TraitDefinitionsCompanion.insert({
    this.id = const Value.absent(),
    required String speciesId,
    required String key,
    required String name,
    required String unit,
    required String measurementPeriod,
    this.heritabilityEstimate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : speciesId = Value(speciesId),
       key = Value(key),
       name = Value(name),
       unit = Value(unit),
       measurementPeriod = Value(measurementPeriod);
  static Insertable<TraitDefinition> custom({
    Expression<String>? id,
    Expression<String>? speciesId,
    Expression<String>? key,
    Expression<String>? name,
    Expression<String>? unit,
    Expression<String>? measurementPeriod,
    Expression<double>? heritabilityEstimate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (speciesId != null) 'species_id': speciesId,
      if (key != null) 'key': key,
      if (name != null) 'name': name,
      if (unit != null) 'unit': unit,
      if (measurementPeriod != null) 'measurement_period': measurementPeriod,
      if (heritabilityEstimate != null)
        'heritability_estimate': heritabilityEstimate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TraitDefinitionsCompanion copyWith({
    Value<String>? id,
    Value<String>? speciesId,
    Value<String>? key,
    Value<String>? name,
    Value<String>? unit,
    Value<String>? measurementPeriod,
    Value<double?>? heritabilityEstimate,
    Value<int>? rowid,
  }) {
    return TraitDefinitionsCompanion(
      id: id ?? this.id,
      speciesId: speciesId ?? this.speciesId,
      key: key ?? this.key,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      measurementPeriod: measurementPeriod ?? this.measurementPeriod,
      heritabilityEstimate: heritabilityEstimate ?? this.heritabilityEstimate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<String>(speciesId.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (measurementPeriod.present) {
      map['measurement_period'] = Variable<String>(measurementPeriod.value);
    }
    if (heritabilityEstimate.present) {
      map['heritability_estimate'] = Variable<double>(
        heritabilityEstimate.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TraitDefinitionsCompanion(')
          ..write('id: $id, ')
          ..write('speciesId: $speciesId, ')
          ..write('key: $key, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('measurementPeriod: $measurementPeriod, ')
          ..write('heritabilityEstimate: $heritabilityEstimate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TraitRecordsTable extends TraitRecords
    with TableInfo<$TraitRecordsTable, TraitRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TraitRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _animalIdMeta = const VerificationMeta(
    'animalId',
  );
  @override
  late final GeneratedColumn<String> animalId = GeneratedColumn<String>(
    'animal_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES animals (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _traitDefinitionIdMeta = const VerificationMeta(
    'traitDefinitionId',
  );
  @override
  late final GeneratedColumn<String> traitDefinitionId =
      GeneratedColumn<String>(
        'trait_definition_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES trait_definitions (id) ON DELETE CASCADE',
        ),
      );
  static const VerificationMeta _recordedDateMeta = const VerificationMeta(
    'recordedDate',
  );
  @override
  late final GeneratedColumn<DateTime> recordedDate = GeneratedColumn<DateTime>(
    'recorded_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    animalId,
    traitDefinitionId,
    recordedDate,
    value,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trait_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<TraitRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('animal_id')) {
      context.handle(
        _animalIdMeta,
        animalId.isAcceptableOrUnknown(data['animal_id']!, _animalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_animalIdMeta);
    }
    if (data.containsKey('trait_definition_id')) {
      context.handle(
        _traitDefinitionIdMeta,
        traitDefinitionId.isAcceptableOrUnknown(
          data['trait_definition_id']!,
          _traitDefinitionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_traitDefinitionIdMeta);
    }
    if (data.containsKey('recorded_date')) {
      context.handle(
        _recordedDateMeta,
        recordedDate.isAcceptableOrUnknown(
          data['recorded_date']!,
          _recordedDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedDateMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TraitRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TraitRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      animalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}animal_id'],
      )!,
      traitDefinitionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trait_definition_id'],
      )!,
      recordedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_date'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TraitRecordsTable createAlias(String alias) {
    return $TraitRecordsTable(attachedDatabase, alias);
  }
}

class TraitRecord extends DataClass implements Insertable<TraitRecord> {
  final String id;
  final String animalId;
  final String traitDefinitionId;
  final DateTime recordedDate;
  final double value;
  final String? notes;
  final DateTime createdAt;
  const TraitRecord({
    required this.id,
    required this.animalId,
    required this.traitDefinitionId,
    required this.recordedDate,
    required this.value,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['animal_id'] = Variable<String>(animalId);
    map['trait_definition_id'] = Variable<String>(traitDefinitionId);
    map['recorded_date'] = Variable<DateTime>(recordedDate);
    map['value'] = Variable<double>(value);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TraitRecordsCompanion toCompanion(bool nullToAbsent) {
    return TraitRecordsCompanion(
      id: Value(id),
      animalId: Value(animalId),
      traitDefinitionId: Value(traitDefinitionId),
      recordedDate: Value(recordedDate),
      value: Value(value),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory TraitRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TraitRecord(
      id: serializer.fromJson<String>(json['id']),
      animalId: serializer.fromJson<String>(json['animalId']),
      traitDefinitionId: serializer.fromJson<String>(json['traitDefinitionId']),
      recordedDate: serializer.fromJson<DateTime>(json['recordedDate']),
      value: serializer.fromJson<double>(json['value']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'animalId': serializer.toJson<String>(animalId),
      'traitDefinitionId': serializer.toJson<String>(traitDefinitionId),
      'recordedDate': serializer.toJson<DateTime>(recordedDate),
      'value': serializer.toJson<double>(value),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TraitRecord copyWith({
    String? id,
    String? animalId,
    String? traitDefinitionId,
    DateTime? recordedDate,
    double? value,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => TraitRecord(
    id: id ?? this.id,
    animalId: animalId ?? this.animalId,
    traitDefinitionId: traitDefinitionId ?? this.traitDefinitionId,
    recordedDate: recordedDate ?? this.recordedDate,
    value: value ?? this.value,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  TraitRecord copyWithCompanion(TraitRecordsCompanion data) {
    return TraitRecord(
      id: data.id.present ? data.id.value : this.id,
      animalId: data.animalId.present ? data.animalId.value : this.animalId,
      traitDefinitionId: data.traitDefinitionId.present
          ? data.traitDefinitionId.value
          : this.traitDefinitionId,
      recordedDate: data.recordedDate.present
          ? data.recordedDate.value
          : this.recordedDate,
      value: data.value.present ? data.value.value : this.value,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TraitRecord(')
          ..write('id: $id, ')
          ..write('animalId: $animalId, ')
          ..write('traitDefinitionId: $traitDefinitionId, ')
          ..write('recordedDate: $recordedDate, ')
          ..write('value: $value, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    animalId,
    traitDefinitionId,
    recordedDate,
    value,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TraitRecord &&
          other.id == this.id &&
          other.animalId == this.animalId &&
          other.traitDefinitionId == this.traitDefinitionId &&
          other.recordedDate == this.recordedDate &&
          other.value == this.value &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class TraitRecordsCompanion extends UpdateCompanion<TraitRecord> {
  final Value<String> id;
  final Value<String> animalId;
  final Value<String> traitDefinitionId;
  final Value<DateTime> recordedDate;
  final Value<double> value;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TraitRecordsCompanion({
    this.id = const Value.absent(),
    this.animalId = const Value.absent(),
    this.traitDefinitionId = const Value.absent(),
    this.recordedDate = const Value.absent(),
    this.value = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TraitRecordsCompanion.insert({
    this.id = const Value.absent(),
    required String animalId,
    required String traitDefinitionId,
    required DateTime recordedDate,
    required double value,
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : animalId = Value(animalId),
       traitDefinitionId = Value(traitDefinitionId),
       recordedDate = Value(recordedDate),
       value = Value(value);
  static Insertable<TraitRecord> custom({
    Expression<String>? id,
    Expression<String>? animalId,
    Expression<String>? traitDefinitionId,
    Expression<DateTime>? recordedDate,
    Expression<double>? value,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (animalId != null) 'animal_id': animalId,
      if (traitDefinitionId != null) 'trait_definition_id': traitDefinitionId,
      if (recordedDate != null) 'recorded_date': recordedDate,
      if (value != null) 'value': value,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TraitRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? animalId,
    Value<String>? traitDefinitionId,
    Value<DateTime>? recordedDate,
    Value<double>? value,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return TraitRecordsCompanion(
      id: id ?? this.id,
      animalId: animalId ?? this.animalId,
      traitDefinitionId: traitDefinitionId ?? this.traitDefinitionId,
      recordedDate: recordedDate ?? this.recordedDate,
      value: value ?? this.value,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (animalId.present) {
      map['animal_id'] = Variable<String>(animalId.value);
    }
    if (traitDefinitionId.present) {
      map['trait_definition_id'] = Variable<String>(traitDefinitionId.value);
    }
    if (recordedDate.present) {
      map['recorded_date'] = Variable<DateTime>(recordedDate.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TraitRecordsCompanion(')
          ..write('id: $id, ')
          ..write('animalId: $animalId, ')
          ..write('traitDefinitionId: $traitDefinitionId, ')
          ..write('recordedDate: $recordedDate, ')
          ..write('value: $value, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TraitPredictionsTable extends TraitPredictions
    with TableInfo<$TraitPredictionsTable, TraitPrediction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TraitPredictionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _pairingIdMeta = const VerificationMeta(
    'pairingId',
  );
  @override
  late final GeneratedColumn<String> pairingId = GeneratedColumn<String>(
    'pairing_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES breeding_pairings (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _traitDefinitionIdMeta = const VerificationMeta(
    'traitDefinitionId',
  );
  @override
  late final GeneratedColumn<String> traitDefinitionId =
      GeneratedColumn<String>(
        'trait_definition_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES trait_definitions (id) ON DELETE CASCADE',
        ),
      );
  static const VerificationMeta _computedAtMeta = const VerificationMeta(
    'computedAt',
  );
  @override
  late final GeneratedColumn<DateTime> computedAt = GeneratedColumn<DateTime>(
    'computed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _predictedValueMeta = const VerificationMeta(
    'predictedValue',
  );
  @override
  late final GeneratedColumn<double> predictedValue = GeneratedColumn<double>(
    'predicted_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _predictedRangeLowMeta = const VerificationMeta(
    'predictedRangeLow',
  );
  @override
  late final GeneratedColumn<double> predictedRangeLow =
      GeneratedColumn<double>(
        'predicted_range_low',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _predictedRangeHighMeta =
      const VerificationMeta('predictedRangeHigh');
  @override
  late final GeneratedColumn<double> predictedRangeHigh =
      GeneratedColumn<double>(
        'predicted_range_high',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _basisMeta = const VerificationMeta('basis');
  @override
  late final GeneratedColumn<String> basis = GeneratedColumn<String>(
    'basis',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pairingId,
    traitDefinitionId,
    computedAt,
    predictedValue,
    predictedRangeLow,
    predictedRangeHigh,
    basis,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trait_predictions';
  @override
  VerificationContext validateIntegrity(
    Insertable<TraitPrediction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pairing_id')) {
      context.handle(
        _pairingIdMeta,
        pairingId.isAcceptableOrUnknown(data['pairing_id']!, _pairingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pairingIdMeta);
    }
    if (data.containsKey('trait_definition_id')) {
      context.handle(
        _traitDefinitionIdMeta,
        traitDefinitionId.isAcceptableOrUnknown(
          data['trait_definition_id']!,
          _traitDefinitionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_traitDefinitionIdMeta);
    }
    if (data.containsKey('computed_at')) {
      context.handle(
        _computedAtMeta,
        computedAt.isAcceptableOrUnknown(data['computed_at']!, _computedAtMeta),
      );
    }
    if (data.containsKey('predicted_value')) {
      context.handle(
        _predictedValueMeta,
        predictedValue.isAcceptableOrUnknown(
          data['predicted_value']!,
          _predictedValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_predictedValueMeta);
    }
    if (data.containsKey('predicted_range_low')) {
      context.handle(
        _predictedRangeLowMeta,
        predictedRangeLow.isAcceptableOrUnknown(
          data['predicted_range_low']!,
          _predictedRangeLowMeta,
        ),
      );
    }
    if (data.containsKey('predicted_range_high')) {
      context.handle(
        _predictedRangeHighMeta,
        predictedRangeHigh.isAcceptableOrUnknown(
          data['predicted_range_high']!,
          _predictedRangeHighMeta,
        ),
      );
    }
    if (data.containsKey('basis')) {
      context.handle(
        _basisMeta,
        basis.isAcceptableOrUnknown(data['basis']!, _basisMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TraitPrediction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TraitPrediction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      pairingId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pairing_id'],
      )!,
      traitDefinitionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trait_definition_id'],
      )!,
      computedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}computed_at'],
      )!,
      predictedValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}predicted_value'],
      )!,
      predictedRangeLow: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}predicted_range_low'],
      ),
      predictedRangeHigh: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}predicted_range_high'],
      ),
      basis: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}basis'],
      ),
    );
  }

  @override
  $TraitPredictionsTable createAlias(String alias) {
    return $TraitPredictionsTable(attachedDatabase, alias);
  }
}

class TraitPrediction extends DataClass implements Insertable<TraitPrediction> {
  final String id;
  final String pairingId;
  final String traitDefinitionId;
  final DateTime computedAt;
  final double predictedValue;
  final double? predictedRangeLow;
  final double? predictedRangeHigh;
  final String? basis;
  const TraitPrediction({
    required this.id,
    required this.pairingId,
    required this.traitDefinitionId,
    required this.computedAt,
    required this.predictedValue,
    this.predictedRangeLow,
    this.predictedRangeHigh,
    this.basis,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pairing_id'] = Variable<String>(pairingId);
    map['trait_definition_id'] = Variable<String>(traitDefinitionId);
    map['computed_at'] = Variable<DateTime>(computedAt);
    map['predicted_value'] = Variable<double>(predictedValue);
    if (!nullToAbsent || predictedRangeLow != null) {
      map['predicted_range_low'] = Variable<double>(predictedRangeLow);
    }
    if (!nullToAbsent || predictedRangeHigh != null) {
      map['predicted_range_high'] = Variable<double>(predictedRangeHigh);
    }
    if (!nullToAbsent || basis != null) {
      map['basis'] = Variable<String>(basis);
    }
    return map;
  }

  TraitPredictionsCompanion toCompanion(bool nullToAbsent) {
    return TraitPredictionsCompanion(
      id: Value(id),
      pairingId: Value(pairingId),
      traitDefinitionId: Value(traitDefinitionId),
      computedAt: Value(computedAt),
      predictedValue: Value(predictedValue),
      predictedRangeLow: predictedRangeLow == null && nullToAbsent
          ? const Value.absent()
          : Value(predictedRangeLow),
      predictedRangeHigh: predictedRangeHigh == null && nullToAbsent
          ? const Value.absent()
          : Value(predictedRangeHigh),
      basis: basis == null && nullToAbsent
          ? const Value.absent()
          : Value(basis),
    );
  }

  factory TraitPrediction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TraitPrediction(
      id: serializer.fromJson<String>(json['id']),
      pairingId: serializer.fromJson<String>(json['pairingId']),
      traitDefinitionId: serializer.fromJson<String>(json['traitDefinitionId']),
      computedAt: serializer.fromJson<DateTime>(json['computedAt']),
      predictedValue: serializer.fromJson<double>(json['predictedValue']),
      predictedRangeLow: serializer.fromJson<double?>(
        json['predictedRangeLow'],
      ),
      predictedRangeHigh: serializer.fromJson<double?>(
        json['predictedRangeHigh'],
      ),
      basis: serializer.fromJson<String?>(json['basis']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pairingId': serializer.toJson<String>(pairingId),
      'traitDefinitionId': serializer.toJson<String>(traitDefinitionId),
      'computedAt': serializer.toJson<DateTime>(computedAt),
      'predictedValue': serializer.toJson<double>(predictedValue),
      'predictedRangeLow': serializer.toJson<double?>(predictedRangeLow),
      'predictedRangeHigh': serializer.toJson<double?>(predictedRangeHigh),
      'basis': serializer.toJson<String?>(basis),
    };
  }

  TraitPrediction copyWith({
    String? id,
    String? pairingId,
    String? traitDefinitionId,
    DateTime? computedAt,
    double? predictedValue,
    Value<double?> predictedRangeLow = const Value.absent(),
    Value<double?> predictedRangeHigh = const Value.absent(),
    Value<String?> basis = const Value.absent(),
  }) => TraitPrediction(
    id: id ?? this.id,
    pairingId: pairingId ?? this.pairingId,
    traitDefinitionId: traitDefinitionId ?? this.traitDefinitionId,
    computedAt: computedAt ?? this.computedAt,
    predictedValue: predictedValue ?? this.predictedValue,
    predictedRangeLow: predictedRangeLow.present
        ? predictedRangeLow.value
        : this.predictedRangeLow,
    predictedRangeHigh: predictedRangeHigh.present
        ? predictedRangeHigh.value
        : this.predictedRangeHigh,
    basis: basis.present ? basis.value : this.basis,
  );
  TraitPrediction copyWithCompanion(TraitPredictionsCompanion data) {
    return TraitPrediction(
      id: data.id.present ? data.id.value : this.id,
      pairingId: data.pairingId.present ? data.pairingId.value : this.pairingId,
      traitDefinitionId: data.traitDefinitionId.present
          ? data.traitDefinitionId.value
          : this.traitDefinitionId,
      computedAt: data.computedAt.present
          ? data.computedAt.value
          : this.computedAt,
      predictedValue: data.predictedValue.present
          ? data.predictedValue.value
          : this.predictedValue,
      predictedRangeLow: data.predictedRangeLow.present
          ? data.predictedRangeLow.value
          : this.predictedRangeLow,
      predictedRangeHigh: data.predictedRangeHigh.present
          ? data.predictedRangeHigh.value
          : this.predictedRangeHigh,
      basis: data.basis.present ? data.basis.value : this.basis,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TraitPrediction(')
          ..write('id: $id, ')
          ..write('pairingId: $pairingId, ')
          ..write('traitDefinitionId: $traitDefinitionId, ')
          ..write('computedAt: $computedAt, ')
          ..write('predictedValue: $predictedValue, ')
          ..write('predictedRangeLow: $predictedRangeLow, ')
          ..write('predictedRangeHigh: $predictedRangeHigh, ')
          ..write('basis: $basis')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pairingId,
    traitDefinitionId,
    computedAt,
    predictedValue,
    predictedRangeLow,
    predictedRangeHigh,
    basis,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TraitPrediction &&
          other.id == this.id &&
          other.pairingId == this.pairingId &&
          other.traitDefinitionId == this.traitDefinitionId &&
          other.computedAt == this.computedAt &&
          other.predictedValue == this.predictedValue &&
          other.predictedRangeLow == this.predictedRangeLow &&
          other.predictedRangeHigh == this.predictedRangeHigh &&
          other.basis == this.basis);
}

class TraitPredictionsCompanion extends UpdateCompanion<TraitPrediction> {
  final Value<String> id;
  final Value<String> pairingId;
  final Value<String> traitDefinitionId;
  final Value<DateTime> computedAt;
  final Value<double> predictedValue;
  final Value<double?> predictedRangeLow;
  final Value<double?> predictedRangeHigh;
  final Value<String?> basis;
  final Value<int> rowid;
  const TraitPredictionsCompanion({
    this.id = const Value.absent(),
    this.pairingId = const Value.absent(),
    this.traitDefinitionId = const Value.absent(),
    this.computedAt = const Value.absent(),
    this.predictedValue = const Value.absent(),
    this.predictedRangeLow = const Value.absent(),
    this.predictedRangeHigh = const Value.absent(),
    this.basis = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TraitPredictionsCompanion.insert({
    this.id = const Value.absent(),
    required String pairingId,
    required String traitDefinitionId,
    this.computedAt = const Value.absent(),
    required double predictedValue,
    this.predictedRangeLow = const Value.absent(),
    this.predictedRangeHigh = const Value.absent(),
    this.basis = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : pairingId = Value(pairingId),
       traitDefinitionId = Value(traitDefinitionId),
       predictedValue = Value(predictedValue);
  static Insertable<TraitPrediction> custom({
    Expression<String>? id,
    Expression<String>? pairingId,
    Expression<String>? traitDefinitionId,
    Expression<DateTime>? computedAt,
    Expression<double>? predictedValue,
    Expression<double>? predictedRangeLow,
    Expression<double>? predictedRangeHigh,
    Expression<String>? basis,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pairingId != null) 'pairing_id': pairingId,
      if (traitDefinitionId != null) 'trait_definition_id': traitDefinitionId,
      if (computedAt != null) 'computed_at': computedAt,
      if (predictedValue != null) 'predicted_value': predictedValue,
      if (predictedRangeLow != null) 'predicted_range_low': predictedRangeLow,
      if (predictedRangeHigh != null)
        'predicted_range_high': predictedRangeHigh,
      if (basis != null) 'basis': basis,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TraitPredictionsCompanion copyWith({
    Value<String>? id,
    Value<String>? pairingId,
    Value<String>? traitDefinitionId,
    Value<DateTime>? computedAt,
    Value<double>? predictedValue,
    Value<double?>? predictedRangeLow,
    Value<double?>? predictedRangeHigh,
    Value<String?>? basis,
    Value<int>? rowid,
  }) {
    return TraitPredictionsCompanion(
      id: id ?? this.id,
      pairingId: pairingId ?? this.pairingId,
      traitDefinitionId: traitDefinitionId ?? this.traitDefinitionId,
      computedAt: computedAt ?? this.computedAt,
      predictedValue: predictedValue ?? this.predictedValue,
      predictedRangeLow: predictedRangeLow ?? this.predictedRangeLow,
      predictedRangeHigh: predictedRangeHigh ?? this.predictedRangeHigh,
      basis: basis ?? this.basis,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pairingId.present) {
      map['pairing_id'] = Variable<String>(pairingId.value);
    }
    if (traitDefinitionId.present) {
      map['trait_definition_id'] = Variable<String>(traitDefinitionId.value);
    }
    if (computedAt.present) {
      map['computed_at'] = Variable<DateTime>(computedAt.value);
    }
    if (predictedValue.present) {
      map['predicted_value'] = Variable<double>(predictedValue.value);
    }
    if (predictedRangeLow.present) {
      map['predicted_range_low'] = Variable<double>(predictedRangeLow.value);
    }
    if (predictedRangeHigh.present) {
      map['predicted_range_high'] = Variable<double>(predictedRangeHigh.value);
    }
    if (basis.present) {
      map['basis'] = Variable<String>(basis.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TraitPredictionsCompanion(')
          ..write('id: $id, ')
          ..write('pairingId: $pairingId, ')
          ..write('traitDefinitionId: $traitDefinitionId, ')
          ..write('computedAt: $computedAt, ')
          ..write('predictedValue: $predictedValue, ')
          ..write('predictedRangeLow: $predictedRangeLow, ')
          ..write('predictedRangeHigh: $predictedRangeHigh, ')
          ..write('basis: $basis, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SpeciesTable species = $SpeciesTable(this);
  late final $SpeciesReproductionProfilesTable speciesReproductionProfiles =
      $SpeciesReproductionProfilesTable(this);
  late final $BreedsTable breeds = $BreedsTable(this);
  late final $AnimalGroupsTable animalGroups = $AnimalGroupsTable(this);
  late final $AnimalsTable animals = $AnimalsTable(this);
  late final $LociTable loci = $LociTable(this);
  late final $AllelesTable alleles = $AllelesTable(this);
  late final $AnimalGenotypesTable animalGenotypes = $AnimalGenotypesTable(
    this,
  );
  late final $PhenotypeTraitsTable phenotypeTraits = $PhenotypeTraitsTable(
    this,
  );
  late final $PhenotypeTraitOptionsTable phenotypeTraitOptions =
      $PhenotypeTraitOptionsTable(this);
  late final $AnimalPhenotypeObservationsTable animalPhenotypeObservations =
      $AnimalPhenotypeObservationsTable(this);
  late final $BreedingPairingsTable breedingPairings = $BreedingPairingsTable(
    this,
  );
  late final $BreedingPredictionsTable breedingPredictions =
      $BreedingPredictionsTable(this);
  late final $BreedingEventsTable breedingEvents = $BreedingEventsTable(this);
  late final $OffspringTable offspring = $OffspringTable(this);
  late final $TraitDefinitionsTable traitDefinitions = $TraitDefinitionsTable(
    this,
  );
  late final $TraitRecordsTable traitRecords = $TraitRecordsTable(this);
  late final $TraitPredictionsTable traitPredictions = $TraitPredictionsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    species,
    speciesReproductionProfiles,
    breeds,
    animalGroups,
    animals,
    loci,
    alleles,
    animalGenotypes,
    phenotypeTraits,
    phenotypeTraitOptions,
    animalPhenotypeObservations,
    breedingPairings,
    breedingPredictions,
    breedingEvents,
    offspring,
    traitDefinitions,
    traitRecords,
    traitPredictions,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'species',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('species_reproduction_profiles', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'species',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('breeds', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'species',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('animal_groups', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'breeds',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('animals', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'animal_groups',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('animals', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'animals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('animals', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'animals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('animals', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'species',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('loci', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'loci',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('alleles', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'animals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('animal_genotypes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'loci',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('animal_genotypes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'species',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('phenotype_traits', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'loci',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('phenotype_traits', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'phenotype_traits',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('phenotype_trait_options', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'animals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('animal_phenotype_observations', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'phenotype_traits',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('animal_phenotype_observations', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'phenotype_trait_options',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('animal_phenotype_observations', kind: UpdateKind.update),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'breeding_pairings',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('breeding_predictions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'breeding_pairings',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('breeding_events', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'breeding_events',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('offspring', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'animals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('offspring', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'species',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('trait_definitions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'animals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('trait_records', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'trait_definitions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('trait_records', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'breeding_pairings',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('trait_predictions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'trait_definitions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('trait_predictions', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$SpeciesTableCreateCompanionBuilder =
    SpeciesCompanion Function({
      Value<String> id,
      required String name,
      required String sexDeterminationSystem,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$SpeciesTableUpdateCompanionBuilder =
    SpeciesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> sexDeterminationSystem,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$SpeciesTableReferences
    extends BaseReferences<_$AppDatabase, $SpeciesTable, SpeciesRow> {
  $$SpeciesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $SpeciesReproductionProfilesTable,
    List<SpeciesReproductionProfile>
  >
  _speciesReproductionProfilesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.speciesReproductionProfiles,
        aliasName: $_aliasNameGenerator(
          db.species.id,
          db.speciesReproductionProfiles.speciesId,
        ),
      );

  $$SpeciesReproductionProfilesTableProcessedTableManager
  get speciesReproductionProfilesRefs {
    final manager = $$SpeciesReproductionProfilesTableTableManager(
      $_db,
      $_db.speciesReproductionProfiles,
    ).filter((f) => f.speciesId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _speciesReproductionProfilesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BreedsTable, List<Breed>> _breedsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.breeds,
    aliasName: $_aliasNameGenerator(db.species.id, db.breeds.speciesId),
  );

  $$BreedsTableProcessedTableManager get breedsRefs {
    final manager = $$BreedsTableTableManager(
      $_db,
      $_db.breeds,
    ).filter((f) => f.speciesId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_breedsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AnimalGroupsTable, List<AnimalGroup>>
  _animalGroupsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.animalGroups,
    aliasName: $_aliasNameGenerator(db.species.id, db.animalGroups.speciesId),
  );

  $$AnimalGroupsTableProcessedTableManager get animalGroupsRefs {
    final manager = $$AnimalGroupsTableTableManager(
      $_db,
      $_db.animalGroups,
    ).filter((f) => f.speciesId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_animalGroupsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AnimalsTable, List<Animal>> _animalsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.animals,
    aliasName: $_aliasNameGenerator(db.species.id, db.animals.speciesId),
  );

  $$AnimalsTableProcessedTableManager get animalsRefs {
    final manager = $$AnimalsTableTableManager(
      $_db,
      $_db.animals,
    ).filter((f) => f.speciesId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_animalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LociTable, List<Locus>> _lociRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.loci,
    aliasName: $_aliasNameGenerator(db.species.id, db.loci.speciesId),
  );

  $$LociTableProcessedTableManager get lociRefs {
    final manager = $$LociTableTableManager(
      $_db,
      $_db.loci,
    ).filter((f) => f.speciesId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_lociRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PhenotypeTraitsTable, List<PhenotypeTrait>>
  _phenotypeTraitsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.phenotypeTraits,
    aliasName: $_aliasNameGenerator(
      db.species.id,
      db.phenotypeTraits.speciesId,
    ),
  );

  $$PhenotypeTraitsTableProcessedTableManager get phenotypeTraitsRefs {
    final manager = $$PhenotypeTraitsTableTableManager(
      $_db,
      $_db.phenotypeTraits,
    ).filter((f) => f.speciesId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _phenotypeTraitsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BreedingPairingsTable, List<BreedingPairing>>
  _breedingPairingsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.breedingPairings,
    aliasName: $_aliasNameGenerator(
      db.species.id,
      db.breedingPairings.speciesId,
    ),
  );

  $$BreedingPairingsTableProcessedTableManager get breedingPairingsRefs {
    final manager = $$BreedingPairingsTableTableManager(
      $_db,
      $_db.breedingPairings,
    ).filter((f) => f.speciesId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _breedingPairingsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TraitDefinitionsTable, List<TraitDefinition>>
  _traitDefinitionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.traitDefinitions,
    aliasName: $_aliasNameGenerator(
      db.species.id,
      db.traitDefinitions.speciesId,
    ),
  );

  $$TraitDefinitionsTableProcessedTableManager get traitDefinitionsRefs {
    final manager = $$TraitDefinitionsTableTableManager(
      $_db,
      $_db.traitDefinitions,
    ).filter((f) => f.speciesId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _traitDefinitionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SpeciesTableFilterComposer
    extends Composer<_$AppDatabase, $SpeciesTable> {
  $$SpeciesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sexDeterminationSystem => $composableBuilder(
    column: $table.sexDeterminationSystem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> speciesReproductionProfilesRefs(
    Expression<bool> Function(
      $$SpeciesReproductionProfilesTableFilterComposer f,
    )
    f,
  ) {
    final $$SpeciesReproductionProfilesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.speciesReproductionProfiles,
          getReferencedColumn: (t) => t.speciesId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SpeciesReproductionProfilesTableFilterComposer(
                $db: $db,
                $table: $db.speciesReproductionProfiles,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> breedsRefs(
    Expression<bool> Function($$BreedsTableFilterComposer f) f,
  ) {
    final $$BreedsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.breeds,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedsTableFilterComposer(
            $db: $db,
            $table: $db.breeds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> animalGroupsRefs(
    Expression<bool> Function($$AnimalGroupsTableFilterComposer f) f,
  ) {
    final $$AnimalGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.animalGroups,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalGroupsTableFilterComposer(
            $db: $db,
            $table: $db.animalGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> animalsRefs(
    Expression<bool> Function($$AnimalsTableFilterComposer f) f,
  ) {
    final $$AnimalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableFilterComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> lociRefs(
    Expression<bool> Function($$LociTableFilterComposer f) f,
  ) {
    final $$LociTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.loci,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LociTableFilterComposer(
            $db: $db,
            $table: $db.loci,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> phenotypeTraitsRefs(
    Expression<bool> Function($$PhenotypeTraitsTableFilterComposer f) f,
  ) {
    final $$PhenotypeTraitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.phenotypeTraits,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhenotypeTraitsTableFilterComposer(
            $db: $db,
            $table: $db.phenotypeTraits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> breedingPairingsRefs(
    Expression<bool> Function($$BreedingPairingsTableFilterComposer f) f,
  ) {
    final $$BreedingPairingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.breedingPairings,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingPairingsTableFilterComposer(
            $db: $db,
            $table: $db.breedingPairings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> traitDefinitionsRefs(
    Expression<bool> Function($$TraitDefinitionsTableFilterComposer f) f,
  ) {
    final $$TraitDefinitionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.traitDefinitions,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitDefinitionsTableFilterComposer(
            $db: $db,
            $table: $db.traitDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SpeciesTableOrderingComposer
    extends Composer<_$AppDatabase, $SpeciesTable> {
  $$SpeciesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sexDeterminationSystem => $composableBuilder(
    column: $table.sexDeterminationSystem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SpeciesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SpeciesTable> {
  $$SpeciesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get sexDeterminationSystem => $composableBuilder(
    column: $table.sexDeterminationSystem,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> speciesReproductionProfilesRefs<T extends Object>(
    Expression<T> Function(
      $$SpeciesReproductionProfilesTableAnnotationComposer a,
    )
    f,
  ) {
    final $$SpeciesReproductionProfilesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.speciesReproductionProfiles,
          getReferencedColumn: (t) => t.speciesId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SpeciesReproductionProfilesTableAnnotationComposer(
                $db: $db,
                $table: $db.speciesReproductionProfiles,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> breedsRefs<T extends Object>(
    Expression<T> Function($$BreedsTableAnnotationComposer a) f,
  ) {
    final $$BreedsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.breeds,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedsTableAnnotationComposer(
            $db: $db,
            $table: $db.breeds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> animalGroupsRefs<T extends Object>(
    Expression<T> Function($$AnimalGroupsTableAnnotationComposer a) f,
  ) {
    final $$AnimalGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.animalGroups,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.animalGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> animalsRefs<T extends Object>(
    Expression<T> Function($$AnimalsTableAnnotationComposer a) f,
  ) {
    final $$AnimalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableAnnotationComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> lociRefs<T extends Object>(
    Expression<T> Function($$LociTableAnnotationComposer a) f,
  ) {
    final $$LociTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.loci,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LociTableAnnotationComposer(
            $db: $db,
            $table: $db.loci,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> phenotypeTraitsRefs<T extends Object>(
    Expression<T> Function($$PhenotypeTraitsTableAnnotationComposer a) f,
  ) {
    final $$PhenotypeTraitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.phenotypeTraits,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhenotypeTraitsTableAnnotationComposer(
            $db: $db,
            $table: $db.phenotypeTraits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> breedingPairingsRefs<T extends Object>(
    Expression<T> Function($$BreedingPairingsTableAnnotationComposer a) f,
  ) {
    final $$BreedingPairingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.breedingPairings,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingPairingsTableAnnotationComposer(
            $db: $db,
            $table: $db.breedingPairings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> traitDefinitionsRefs<T extends Object>(
    Expression<T> Function($$TraitDefinitionsTableAnnotationComposer a) f,
  ) {
    final $$TraitDefinitionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.traitDefinitions,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitDefinitionsTableAnnotationComposer(
            $db: $db,
            $table: $db.traitDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SpeciesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SpeciesTable,
          SpeciesRow,
          $$SpeciesTableFilterComposer,
          $$SpeciesTableOrderingComposer,
          $$SpeciesTableAnnotationComposer,
          $$SpeciesTableCreateCompanionBuilder,
          $$SpeciesTableUpdateCompanionBuilder,
          (SpeciesRow, $$SpeciesTableReferences),
          SpeciesRow,
          PrefetchHooks Function({
            bool speciesReproductionProfilesRefs,
            bool breedsRefs,
            bool animalGroupsRefs,
            bool animalsRefs,
            bool lociRefs,
            bool phenotypeTraitsRefs,
            bool breedingPairingsRefs,
            bool traitDefinitionsRefs,
          })
        > {
  $$SpeciesTableTableManager(_$AppDatabase db, $SpeciesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SpeciesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SpeciesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SpeciesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> sexDeterminationSystem = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpeciesCompanion(
                id: id,
                name: name,
                sexDeterminationSystem: sexDeterminationSystem,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                required String sexDeterminationSystem,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpeciesCompanion.insert(
                id: id,
                name: name,
                sexDeterminationSystem: sexDeterminationSystem,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SpeciesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                speciesReproductionProfilesRefs = false,
                breedsRefs = false,
                animalGroupsRefs = false,
                animalsRefs = false,
                lociRefs = false,
                phenotypeTraitsRefs = false,
                breedingPairingsRefs = false,
                traitDefinitionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (speciesReproductionProfilesRefs)
                      db.speciesReproductionProfiles,
                    if (breedsRefs) db.breeds,
                    if (animalGroupsRefs) db.animalGroups,
                    if (animalsRefs) db.animals,
                    if (lociRefs) db.loci,
                    if (phenotypeTraitsRefs) db.phenotypeTraits,
                    if (breedingPairingsRefs) db.breedingPairings,
                    if (traitDefinitionsRefs) db.traitDefinitions,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (speciesReproductionProfilesRefs)
                        await $_getPrefetchedData<
                          SpeciesRow,
                          $SpeciesTable,
                          SpeciesReproductionProfile
                        >(
                          currentTable: table,
                          referencedTable: $$SpeciesTableReferences
                              ._speciesReproductionProfilesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SpeciesTableReferences(
                                db,
                                table,
                                p0,
                              ).speciesReproductionProfilesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.speciesId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (breedsRefs)
                        await $_getPrefetchedData<
                          SpeciesRow,
                          $SpeciesTable,
                          Breed
                        >(
                          currentTable: table,
                          referencedTable: $$SpeciesTableReferences
                              ._breedsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SpeciesTableReferences(
                                db,
                                table,
                                p0,
                              ).breedsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.speciesId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (animalGroupsRefs)
                        await $_getPrefetchedData<
                          SpeciesRow,
                          $SpeciesTable,
                          AnimalGroup
                        >(
                          currentTable: table,
                          referencedTable: $$SpeciesTableReferences
                              ._animalGroupsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SpeciesTableReferences(
                                db,
                                table,
                                p0,
                              ).animalGroupsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.speciesId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (animalsRefs)
                        await $_getPrefetchedData<
                          SpeciesRow,
                          $SpeciesTable,
                          Animal
                        >(
                          currentTable: table,
                          referencedTable: $$SpeciesTableReferences
                              ._animalsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SpeciesTableReferences(
                                db,
                                table,
                                p0,
                              ).animalsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.speciesId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (lociRefs)
                        await $_getPrefetchedData<
                          SpeciesRow,
                          $SpeciesTable,
                          Locus
                        >(
                          currentTable: table,
                          referencedTable: $$SpeciesTableReferences
                              ._lociRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SpeciesTableReferences(db, table, p0).lociRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.speciesId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (phenotypeTraitsRefs)
                        await $_getPrefetchedData<
                          SpeciesRow,
                          $SpeciesTable,
                          PhenotypeTrait
                        >(
                          currentTable: table,
                          referencedTable: $$SpeciesTableReferences
                              ._phenotypeTraitsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SpeciesTableReferences(
                                db,
                                table,
                                p0,
                              ).phenotypeTraitsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.speciesId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (breedingPairingsRefs)
                        await $_getPrefetchedData<
                          SpeciesRow,
                          $SpeciesTable,
                          BreedingPairing
                        >(
                          currentTable: table,
                          referencedTable: $$SpeciesTableReferences
                              ._breedingPairingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SpeciesTableReferences(
                                db,
                                table,
                                p0,
                              ).breedingPairingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.speciesId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (traitDefinitionsRefs)
                        await $_getPrefetchedData<
                          SpeciesRow,
                          $SpeciesTable,
                          TraitDefinition
                        >(
                          currentTable: table,
                          referencedTable: $$SpeciesTableReferences
                              ._traitDefinitionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SpeciesTableReferences(
                                db,
                                table,
                                p0,
                              ).traitDefinitionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.speciesId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SpeciesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SpeciesTable,
      SpeciesRow,
      $$SpeciesTableFilterComposer,
      $$SpeciesTableOrderingComposer,
      $$SpeciesTableAnnotationComposer,
      $$SpeciesTableCreateCompanionBuilder,
      $$SpeciesTableUpdateCompanionBuilder,
      (SpeciesRow, $$SpeciesTableReferences),
      SpeciesRow,
      PrefetchHooks Function({
        bool speciesReproductionProfilesRefs,
        bool breedsRefs,
        bool animalGroupsRefs,
        bool animalsRefs,
        bool lociRefs,
        bool phenotypeTraitsRefs,
        bool breedingPairingsRefs,
        bool traitDefinitionsRefs,
      })
    >;
typedef $$SpeciesReproductionProfilesTableCreateCompanionBuilder =
    SpeciesReproductionProfilesCompanion Function({
      Value<String> id,
      required String speciesId,
      required int gestationOrIncubationDays,
      required String offspringUnit,
      Value<int?> typicalOffspringMin,
      Value<int?> typicalOffspringMax,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$SpeciesReproductionProfilesTableUpdateCompanionBuilder =
    SpeciesReproductionProfilesCompanion Function({
      Value<String> id,
      Value<String> speciesId,
      Value<int> gestationOrIncubationDays,
      Value<String> offspringUnit,
      Value<int?> typicalOffspringMin,
      Value<int?> typicalOffspringMax,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$SpeciesReproductionProfilesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SpeciesReproductionProfilesTable,
          SpeciesReproductionProfile
        > {
  $$SpeciesReproductionProfilesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SpeciesTable _speciesIdTable(_$AppDatabase db) =>
      db.species.createAlias(
        $_aliasNameGenerator(
          db.speciesReproductionProfiles.speciesId,
          db.species.id,
        ),
      );

  $$SpeciesTableProcessedTableManager get speciesId {
    final $_column = $_itemColumn<String>('species_id')!;

    final manager = $$SpeciesTableTableManager(
      $_db,
      $_db.species,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_speciesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SpeciesReproductionProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $SpeciesReproductionProfilesTable> {
  $$SpeciesReproductionProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gestationOrIncubationDays => $composableBuilder(
    column: $table.gestationOrIncubationDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get offspringUnit => $composableBuilder(
    column: $table.offspringUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get typicalOffspringMin => $composableBuilder(
    column: $table.typicalOffspringMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get typicalOffspringMax => $composableBuilder(
    column: $table.typicalOffspringMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SpeciesTableFilterComposer get speciesId {
    final $$SpeciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableFilterComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SpeciesReproductionProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $SpeciesReproductionProfilesTable> {
  $$SpeciesReproductionProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gestationOrIncubationDays => $composableBuilder(
    column: $table.gestationOrIncubationDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get offspringUnit => $composableBuilder(
    column: $table.offspringUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get typicalOffspringMin => $composableBuilder(
    column: $table.typicalOffspringMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get typicalOffspringMax => $composableBuilder(
    column: $table.typicalOffspringMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SpeciesTableOrderingComposer get speciesId {
    final $$SpeciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableOrderingComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SpeciesReproductionProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SpeciesReproductionProfilesTable> {
  $$SpeciesReproductionProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get gestationOrIncubationDays => $composableBuilder(
    column: $table.gestationOrIncubationDays,
    builder: (column) => column,
  );

  GeneratedColumn<String> get offspringUnit => $composableBuilder(
    column: $table.offspringUnit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get typicalOffspringMin => $composableBuilder(
    column: $table.typicalOffspringMin,
    builder: (column) => column,
  );

  GeneratedColumn<int> get typicalOffspringMax => $composableBuilder(
    column: $table.typicalOffspringMax,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$SpeciesTableAnnotationComposer get speciesId {
    final $$SpeciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableAnnotationComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SpeciesReproductionProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SpeciesReproductionProfilesTable,
          SpeciesReproductionProfile,
          $$SpeciesReproductionProfilesTableFilterComposer,
          $$SpeciesReproductionProfilesTableOrderingComposer,
          $$SpeciesReproductionProfilesTableAnnotationComposer,
          $$SpeciesReproductionProfilesTableCreateCompanionBuilder,
          $$SpeciesReproductionProfilesTableUpdateCompanionBuilder,
          (
            SpeciesReproductionProfile,
            $$SpeciesReproductionProfilesTableReferences,
          ),
          SpeciesReproductionProfile,
          PrefetchHooks Function({bool speciesId})
        > {
  $$SpeciesReproductionProfilesTableTableManager(
    _$AppDatabase db,
    $SpeciesReproductionProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SpeciesReproductionProfilesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SpeciesReproductionProfilesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SpeciesReproductionProfilesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> speciesId = const Value.absent(),
                Value<int> gestationOrIncubationDays = const Value.absent(),
                Value<String> offspringUnit = const Value.absent(),
                Value<int?> typicalOffspringMin = const Value.absent(),
                Value<int?> typicalOffspringMax = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpeciesReproductionProfilesCompanion(
                id: id,
                speciesId: speciesId,
                gestationOrIncubationDays: gestationOrIncubationDays,
                offspringUnit: offspringUnit,
                typicalOffspringMin: typicalOffspringMin,
                typicalOffspringMax: typicalOffspringMax,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String speciesId,
                required int gestationOrIncubationDays,
                required String offspringUnit,
                Value<int?> typicalOffspringMin = const Value.absent(),
                Value<int?> typicalOffspringMax = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpeciesReproductionProfilesCompanion.insert(
                id: id,
                speciesId: speciesId,
                gestationOrIncubationDays: gestationOrIncubationDays,
                offspringUnit: offspringUnit,
                typicalOffspringMin: typicalOffspringMin,
                typicalOffspringMax: typicalOffspringMax,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SpeciesReproductionProfilesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({speciesId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (speciesId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.speciesId,
                                referencedTable:
                                    $$SpeciesReproductionProfilesTableReferences
                                        ._speciesIdTable(db),
                                referencedColumn:
                                    $$SpeciesReproductionProfilesTableReferences
                                        ._speciesIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SpeciesReproductionProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SpeciesReproductionProfilesTable,
      SpeciesReproductionProfile,
      $$SpeciesReproductionProfilesTableFilterComposer,
      $$SpeciesReproductionProfilesTableOrderingComposer,
      $$SpeciesReproductionProfilesTableAnnotationComposer,
      $$SpeciesReproductionProfilesTableCreateCompanionBuilder,
      $$SpeciesReproductionProfilesTableUpdateCompanionBuilder,
      (
        SpeciesReproductionProfile,
        $$SpeciesReproductionProfilesTableReferences,
      ),
      SpeciesReproductionProfile,
      PrefetchHooks Function({bool speciesId})
    >;
typedef $$BreedsTableCreateCompanionBuilder =
    BreedsCompanion Function({
      Value<String> id,
      required String speciesId,
      required String name,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$BreedsTableUpdateCompanionBuilder =
    BreedsCompanion Function({
      Value<String> id,
      Value<String> speciesId,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$BreedsTableReferences
    extends BaseReferences<_$AppDatabase, $BreedsTable, Breed> {
  $$BreedsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SpeciesTable _speciesIdTable(_$AppDatabase db) => db.species
      .createAlias($_aliasNameGenerator(db.breeds.speciesId, db.species.id));

  $$SpeciesTableProcessedTableManager get speciesId {
    final $_column = $_itemColumn<String>('species_id')!;

    final manager = $$SpeciesTableTableManager(
      $_db,
      $_db.species,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_speciesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AnimalsTable, List<Animal>> _animalsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.animals,
    aliasName: $_aliasNameGenerator(db.breeds.id, db.animals.breedId),
  );

  $$AnimalsTableProcessedTableManager get animalsRefs {
    final manager = $$AnimalsTableTableManager(
      $_db,
      $_db.animals,
    ).filter((f) => f.breedId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_animalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BreedsTableFilterComposer
    extends Composer<_$AppDatabase, $BreedsTable> {
  $$BreedsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SpeciesTableFilterComposer get speciesId {
    final $$SpeciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableFilterComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> animalsRefs(
    Expression<bool> Function($$AnimalsTableFilterComposer f) f,
  ) {
    final $$AnimalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.breedId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableFilterComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BreedsTableOrderingComposer
    extends Composer<_$AppDatabase, $BreedsTable> {
  $$BreedsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SpeciesTableOrderingComposer get speciesId {
    final $$SpeciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableOrderingComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BreedsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BreedsTable> {
  $$BreedsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$SpeciesTableAnnotationComposer get speciesId {
    final $$SpeciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableAnnotationComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> animalsRefs<T extends Object>(
    Expression<T> Function($$AnimalsTableAnnotationComposer a) f,
  ) {
    final $$AnimalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.breedId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableAnnotationComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BreedsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BreedsTable,
          Breed,
          $$BreedsTableFilterComposer,
          $$BreedsTableOrderingComposer,
          $$BreedsTableAnnotationComposer,
          $$BreedsTableCreateCompanionBuilder,
          $$BreedsTableUpdateCompanionBuilder,
          (Breed, $$BreedsTableReferences),
          Breed,
          PrefetchHooks Function({bool speciesId, bool animalsRefs})
        > {
  $$BreedsTableTableManager(_$AppDatabase db, $BreedsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BreedsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BreedsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BreedsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> speciesId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BreedsCompanion(
                id: id,
                speciesId: speciesId,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String speciesId,
                required String name,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BreedsCompanion.insert(
                id: id,
                speciesId: speciesId,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$BreedsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({speciesId = false, animalsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (animalsRefs) db.animals],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (speciesId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.speciesId,
                                referencedTable: $$BreedsTableReferences
                                    ._speciesIdTable(db),
                                referencedColumn: $$BreedsTableReferences
                                    ._speciesIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (animalsRefs)
                    await $_getPrefetchedData<Breed, $BreedsTable, Animal>(
                      currentTable: table,
                      referencedTable: $$BreedsTableReferences
                          ._animalsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$BreedsTableReferences(db, table, p0).animalsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.breedId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BreedsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BreedsTable,
      Breed,
      $$BreedsTableFilterComposer,
      $$BreedsTableOrderingComposer,
      $$BreedsTableAnnotationComposer,
      $$BreedsTableCreateCompanionBuilder,
      $$BreedsTableUpdateCompanionBuilder,
      (Breed, $$BreedsTableReferences),
      Breed,
      PrefetchHooks Function({bool speciesId, bool animalsRefs})
    >;
typedef $$AnimalGroupsTableCreateCompanionBuilder =
    AnimalGroupsCompanion Function({
      Value<String> id,
      required String speciesId,
      required String name,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$AnimalGroupsTableUpdateCompanionBuilder =
    AnimalGroupsCompanion Function({
      Value<String> id,
      Value<String> speciesId,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$AnimalGroupsTableReferences
    extends BaseReferences<_$AppDatabase, $AnimalGroupsTable, AnimalGroup> {
  $$AnimalGroupsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SpeciesTable _speciesIdTable(_$AppDatabase db) =>
      db.species.createAlias(
        $_aliasNameGenerator(db.animalGroups.speciesId, db.species.id),
      );

  $$SpeciesTableProcessedTableManager get speciesId {
    final $_column = $_itemColumn<String>('species_id')!;

    final manager = $$SpeciesTableTableManager(
      $_db,
      $_db.species,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_speciesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AnimalsTable, List<Animal>> _animalsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.animals,
    aliasName: $_aliasNameGenerator(db.animalGroups.id, db.animals.groupId),
  );

  $$AnimalsTableProcessedTableManager get animalsRefs {
    final manager = $$AnimalsTableTableManager(
      $_db,
      $_db.animals,
    ).filter((f) => f.groupId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_animalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AnimalGroupsTableFilterComposer
    extends Composer<_$AppDatabase, $AnimalGroupsTable> {
  $$AnimalGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SpeciesTableFilterComposer get speciesId {
    final $$SpeciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableFilterComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> animalsRefs(
    Expression<bool> Function($$AnimalsTableFilterComposer f) f,
  ) {
    final $$AnimalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.groupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableFilterComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AnimalGroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $AnimalGroupsTable> {
  $$AnimalGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SpeciesTableOrderingComposer get speciesId {
    final $$SpeciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableOrderingComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnimalGroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnimalGroupsTable> {
  $$AnimalGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$SpeciesTableAnnotationComposer get speciesId {
    final $$SpeciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableAnnotationComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> animalsRefs<T extends Object>(
    Expression<T> Function($$AnimalsTableAnnotationComposer a) f,
  ) {
    final $$AnimalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.groupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableAnnotationComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AnimalGroupsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnimalGroupsTable,
          AnimalGroup,
          $$AnimalGroupsTableFilterComposer,
          $$AnimalGroupsTableOrderingComposer,
          $$AnimalGroupsTableAnnotationComposer,
          $$AnimalGroupsTableCreateCompanionBuilder,
          $$AnimalGroupsTableUpdateCompanionBuilder,
          (AnimalGroup, $$AnimalGroupsTableReferences),
          AnimalGroup,
          PrefetchHooks Function({bool speciesId, bool animalsRefs})
        > {
  $$AnimalGroupsTableTableManager(_$AppDatabase db, $AnimalGroupsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnimalGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnimalGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnimalGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> speciesId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnimalGroupsCompanion(
                id: id,
                speciesId: speciesId,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String speciesId,
                required String name,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnimalGroupsCompanion.insert(
                id: id,
                speciesId: speciesId,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AnimalGroupsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({speciesId = false, animalsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (animalsRefs) db.animals],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (speciesId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.speciesId,
                                referencedTable: $$AnimalGroupsTableReferences
                                    ._speciesIdTable(db),
                                referencedColumn: $$AnimalGroupsTableReferences
                                    ._speciesIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (animalsRefs)
                    await $_getPrefetchedData<
                      AnimalGroup,
                      $AnimalGroupsTable,
                      Animal
                    >(
                      currentTable: table,
                      referencedTable: $$AnimalGroupsTableReferences
                          ._animalsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AnimalGroupsTableReferences(
                            db,
                            table,
                            p0,
                          ).animalsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.groupId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AnimalGroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnimalGroupsTable,
      AnimalGroup,
      $$AnimalGroupsTableFilterComposer,
      $$AnimalGroupsTableOrderingComposer,
      $$AnimalGroupsTableAnnotationComposer,
      $$AnimalGroupsTableCreateCompanionBuilder,
      $$AnimalGroupsTableUpdateCompanionBuilder,
      (AnimalGroup, $$AnimalGroupsTableReferences),
      AnimalGroup,
      PrefetchHooks Function({bool speciesId, bool animalsRefs})
    >;
typedef $$AnimalsTableCreateCompanionBuilder =
    AnimalsCompanion Function({
      Value<String> id,
      required String speciesId,
      Value<String?> breedId,
      Value<String?> groupId,
      required String name,
      required String sex,
      Value<DateTime?> birthDate,
      Value<String?> sireId,
      Value<String?> damId,
      Value<String> status,
      Value<String?> phenotypeDescription,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$AnimalsTableUpdateCompanionBuilder =
    AnimalsCompanion Function({
      Value<String> id,
      Value<String> speciesId,
      Value<String?> breedId,
      Value<String?> groupId,
      Value<String> name,
      Value<String> sex,
      Value<DateTime?> birthDate,
      Value<String?> sireId,
      Value<String?> damId,
      Value<String> status,
      Value<String?> phenotypeDescription,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

final class $$AnimalsTableReferences
    extends BaseReferences<_$AppDatabase, $AnimalsTable, Animal> {
  $$AnimalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SpeciesTable _speciesIdTable(_$AppDatabase db) => db.species
      .createAlias($_aliasNameGenerator(db.animals.speciesId, db.species.id));

  $$SpeciesTableProcessedTableManager get speciesId {
    final $_column = $_itemColumn<String>('species_id')!;

    final manager = $$SpeciesTableTableManager(
      $_db,
      $_db.species,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_speciesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BreedsTable _breedIdTable(_$AppDatabase db) => db.breeds.createAlias(
    $_aliasNameGenerator(db.animals.breedId, db.breeds.id),
  );

  $$BreedsTableProcessedTableManager? get breedId {
    final $_column = $_itemColumn<String>('breed_id');
    if ($_column == null) return null;
    final manager = $$BreedsTableTableManager(
      $_db,
      $_db.breeds,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_breedIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AnimalGroupsTable _groupIdTable(_$AppDatabase db) =>
      db.animalGroups.createAlias(
        $_aliasNameGenerator(db.animals.groupId, db.animalGroups.id),
      );

  $$AnimalGroupsTableProcessedTableManager? get groupId {
    final $_column = $_itemColumn<String>('group_id');
    if ($_column == null) return null;
    final manager = $$AnimalGroupsTableTableManager(
      $_db,
      $_db.animalGroups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AnimalsTable _sireIdTable(_$AppDatabase db) => db.animals.createAlias(
    $_aliasNameGenerator(db.animals.sireId, db.animals.id),
  );

  $$AnimalsTableProcessedTableManager? get sireId {
    final $_column = $_itemColumn<String>('sire_id');
    if ($_column == null) return null;
    final manager = $$AnimalsTableTableManager(
      $_db,
      $_db.animals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sireIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AnimalsTable _damIdTable(_$AppDatabase db) => db.animals.createAlias(
    $_aliasNameGenerator(db.animals.damId, db.animals.id),
  );

  $$AnimalsTableProcessedTableManager? get damId {
    final $_column = $_itemColumn<String>('dam_id');
    if ($_column == null) return null;
    final manager = $$AnimalsTableTableManager(
      $_db,
      $_db.animals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_damIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AnimalGenotypesTable, List<AnimalGenotype>>
  _animalGenotypesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.animalGenotypes,
    aliasName: $_aliasNameGenerator(db.animals.id, db.animalGenotypes.animalId),
  );

  $$AnimalGenotypesTableProcessedTableManager get animalGenotypesRefs {
    final manager = $$AnimalGenotypesTableTableManager(
      $_db,
      $_db.animalGenotypes,
    ).filter((f) => f.animalId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _animalGenotypesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $AnimalPhenotypeObservationsTable,
    List<AnimalPhenotypeObservation>
  >
  _animalPhenotypeObservationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.animalPhenotypeObservations,
        aliasName: $_aliasNameGenerator(
          db.animals.id,
          db.animalPhenotypeObservations.animalId,
        ),
      );

  $$AnimalPhenotypeObservationsTableProcessedTableManager
  get animalPhenotypeObservationsRefs {
    final manager = $$AnimalPhenotypeObservationsTableTableManager(
      $_db,
      $_db.animalPhenotypeObservations,
    ).filter((f) => f.animalId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _animalPhenotypeObservationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$OffspringTable, List<OffspringRecord>>
  _offspringRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.offspring,
    aliasName: $_aliasNameGenerator(db.animals.id, db.offspring.animalId),
  );

  $$OffspringTableProcessedTableManager get offspringRefs {
    final manager = $$OffspringTableTableManager(
      $_db,
      $_db.offspring,
    ).filter((f) => f.animalId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_offspringRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TraitRecordsTable, List<TraitRecord>>
  _traitRecordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.traitRecords,
    aliasName: $_aliasNameGenerator(db.animals.id, db.traitRecords.animalId),
  );

  $$TraitRecordsTableProcessedTableManager get traitRecordsRefs {
    final manager = $$TraitRecordsTableTableManager(
      $_db,
      $_db.traitRecords,
    ).filter((f) => f.animalId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_traitRecordsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AnimalsTableFilterComposer
    extends Composer<_$AppDatabase, $AnimalsTable> {
  $$AnimalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phenotypeDescription => $composableBuilder(
    column: $table.phenotypeDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SpeciesTableFilterComposer get speciesId {
    final $$SpeciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableFilterComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BreedsTableFilterComposer get breedId {
    final $$BreedsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.breedId,
      referencedTable: $db.breeds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedsTableFilterComposer(
            $db: $db,
            $table: $db.breeds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalGroupsTableFilterComposer get groupId {
    final $$AnimalGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.animalGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalGroupsTableFilterComposer(
            $db: $db,
            $table: $db.animalGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableFilterComposer get sireId {
    final $$AnimalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sireId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableFilterComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableFilterComposer get damId {
    final $$AnimalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.damId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableFilterComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> animalGenotypesRefs(
    Expression<bool> Function($$AnimalGenotypesTableFilterComposer f) f,
  ) {
    final $$AnimalGenotypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.animalGenotypes,
      getReferencedColumn: (t) => t.animalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalGenotypesTableFilterComposer(
            $db: $db,
            $table: $db.animalGenotypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> animalPhenotypeObservationsRefs(
    Expression<bool> Function(
      $$AnimalPhenotypeObservationsTableFilterComposer f,
    )
    f,
  ) {
    final $$AnimalPhenotypeObservationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.animalPhenotypeObservations,
          getReferencedColumn: (t) => t.animalId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnimalPhenotypeObservationsTableFilterComposer(
                $db: $db,
                $table: $db.animalPhenotypeObservations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> offspringRefs(
    Expression<bool> Function($$OffspringTableFilterComposer f) f,
  ) {
    final $$OffspringTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.offspring,
      getReferencedColumn: (t) => t.animalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OffspringTableFilterComposer(
            $db: $db,
            $table: $db.offspring,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> traitRecordsRefs(
    Expression<bool> Function($$TraitRecordsTableFilterComposer f) f,
  ) {
    final $$TraitRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.traitRecords,
      getReferencedColumn: (t) => t.animalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitRecordsTableFilterComposer(
            $db: $db,
            $table: $db.traitRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AnimalsTableOrderingComposer
    extends Composer<_$AppDatabase, $AnimalsTable> {
  $$AnimalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phenotypeDescription => $composableBuilder(
    column: $table.phenotypeDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SpeciesTableOrderingComposer get speciesId {
    final $$SpeciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableOrderingComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BreedsTableOrderingComposer get breedId {
    final $$BreedsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.breedId,
      referencedTable: $db.breeds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedsTableOrderingComposer(
            $db: $db,
            $table: $db.breeds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalGroupsTableOrderingComposer get groupId {
    final $$AnimalGroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.animalGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalGroupsTableOrderingComposer(
            $db: $db,
            $table: $db.animalGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableOrderingComposer get sireId {
    final $$AnimalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sireId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableOrderingComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableOrderingComposer get damId {
    final $$AnimalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.damId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableOrderingComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnimalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnimalsTable> {
  $$AnimalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get phenotypeDescription => $composableBuilder(
    column: $table.phenotypeDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$SpeciesTableAnnotationComposer get speciesId {
    final $$SpeciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableAnnotationComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BreedsTableAnnotationComposer get breedId {
    final $$BreedsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.breedId,
      referencedTable: $db.breeds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedsTableAnnotationComposer(
            $db: $db,
            $table: $db.breeds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalGroupsTableAnnotationComposer get groupId {
    final $$AnimalGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.animalGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.animalGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableAnnotationComposer get sireId {
    final $$AnimalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sireId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableAnnotationComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableAnnotationComposer get damId {
    final $$AnimalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.damId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableAnnotationComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> animalGenotypesRefs<T extends Object>(
    Expression<T> Function($$AnimalGenotypesTableAnnotationComposer a) f,
  ) {
    final $$AnimalGenotypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.animalGenotypes,
      getReferencedColumn: (t) => t.animalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalGenotypesTableAnnotationComposer(
            $db: $db,
            $table: $db.animalGenotypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> animalPhenotypeObservationsRefs<T extends Object>(
    Expression<T> Function(
      $$AnimalPhenotypeObservationsTableAnnotationComposer a,
    )
    f,
  ) {
    final $$AnimalPhenotypeObservationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.animalPhenotypeObservations,
          getReferencedColumn: (t) => t.animalId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnimalPhenotypeObservationsTableAnnotationComposer(
                $db: $db,
                $table: $db.animalPhenotypeObservations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> offspringRefs<T extends Object>(
    Expression<T> Function($$OffspringTableAnnotationComposer a) f,
  ) {
    final $$OffspringTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.offspring,
      getReferencedColumn: (t) => t.animalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OffspringTableAnnotationComposer(
            $db: $db,
            $table: $db.offspring,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> traitRecordsRefs<T extends Object>(
    Expression<T> Function($$TraitRecordsTableAnnotationComposer a) f,
  ) {
    final $$TraitRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.traitRecords,
      getReferencedColumn: (t) => t.animalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.traitRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AnimalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnimalsTable,
          Animal,
          $$AnimalsTableFilterComposer,
          $$AnimalsTableOrderingComposer,
          $$AnimalsTableAnnotationComposer,
          $$AnimalsTableCreateCompanionBuilder,
          $$AnimalsTableUpdateCompanionBuilder,
          (Animal, $$AnimalsTableReferences),
          Animal,
          PrefetchHooks Function({
            bool speciesId,
            bool breedId,
            bool groupId,
            bool sireId,
            bool damId,
            bool animalGenotypesRefs,
            bool animalPhenotypeObservationsRefs,
            bool offspringRefs,
            bool traitRecordsRefs,
          })
        > {
  $$AnimalsTableTableManager(_$AppDatabase db, $AnimalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnimalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnimalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnimalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> speciesId = const Value.absent(),
                Value<String?> breedId = const Value.absent(),
                Value<String?> groupId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> sex = const Value.absent(),
                Value<DateTime?> birthDate = const Value.absent(),
                Value<String?> sireId = const Value.absent(),
                Value<String?> damId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> phenotypeDescription = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnimalsCompanion(
                id: id,
                speciesId: speciesId,
                breedId: breedId,
                groupId: groupId,
                name: name,
                sex: sex,
                birthDate: birthDate,
                sireId: sireId,
                damId: damId,
                status: status,
                phenotypeDescription: phenotypeDescription,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String speciesId,
                Value<String?> breedId = const Value.absent(),
                Value<String?> groupId = const Value.absent(),
                required String name,
                required String sex,
                Value<DateTime?> birthDate = const Value.absent(),
                Value<String?> sireId = const Value.absent(),
                Value<String?> damId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> phenotypeDescription = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnimalsCompanion.insert(
                id: id,
                speciesId: speciesId,
                breedId: breedId,
                groupId: groupId,
                name: name,
                sex: sex,
                birthDate: birthDate,
                sireId: sireId,
                damId: damId,
                status: status,
                phenotypeDescription: phenotypeDescription,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AnimalsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                speciesId = false,
                breedId = false,
                groupId = false,
                sireId = false,
                damId = false,
                animalGenotypesRefs = false,
                animalPhenotypeObservationsRefs = false,
                offspringRefs = false,
                traitRecordsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (animalGenotypesRefs) db.animalGenotypes,
                    if (animalPhenotypeObservationsRefs)
                      db.animalPhenotypeObservations,
                    if (offspringRefs) db.offspring,
                    if (traitRecordsRefs) db.traitRecords,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (speciesId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.speciesId,
                                    referencedTable: $$AnimalsTableReferences
                                        ._speciesIdTable(db),
                                    referencedColumn: $$AnimalsTableReferences
                                        ._speciesIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (breedId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.breedId,
                                    referencedTable: $$AnimalsTableReferences
                                        ._breedIdTable(db),
                                    referencedColumn: $$AnimalsTableReferences
                                        ._breedIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (groupId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.groupId,
                                    referencedTable: $$AnimalsTableReferences
                                        ._groupIdTable(db),
                                    referencedColumn: $$AnimalsTableReferences
                                        ._groupIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (sireId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sireId,
                                    referencedTable: $$AnimalsTableReferences
                                        ._sireIdTable(db),
                                    referencedColumn: $$AnimalsTableReferences
                                        ._sireIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (damId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.damId,
                                    referencedTable: $$AnimalsTableReferences
                                        ._damIdTable(db),
                                    referencedColumn: $$AnimalsTableReferences
                                        ._damIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (animalGenotypesRefs)
                        await $_getPrefetchedData<
                          Animal,
                          $AnimalsTable,
                          AnimalGenotype
                        >(
                          currentTable: table,
                          referencedTable: $$AnimalsTableReferences
                              ._animalGenotypesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AnimalsTableReferences(
                                db,
                                table,
                                p0,
                              ).animalGenotypesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.animalId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (animalPhenotypeObservationsRefs)
                        await $_getPrefetchedData<
                          Animal,
                          $AnimalsTable,
                          AnimalPhenotypeObservation
                        >(
                          currentTable: table,
                          referencedTable: $$AnimalsTableReferences
                              ._animalPhenotypeObservationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AnimalsTableReferences(
                                db,
                                table,
                                p0,
                              ).animalPhenotypeObservationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.animalId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (offspringRefs)
                        await $_getPrefetchedData<
                          Animal,
                          $AnimalsTable,
                          OffspringRecord
                        >(
                          currentTable: table,
                          referencedTable: $$AnimalsTableReferences
                              ._offspringRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AnimalsTableReferences(
                                db,
                                table,
                                p0,
                              ).offspringRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.animalId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (traitRecordsRefs)
                        await $_getPrefetchedData<
                          Animal,
                          $AnimalsTable,
                          TraitRecord
                        >(
                          currentTable: table,
                          referencedTable: $$AnimalsTableReferences
                              ._traitRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AnimalsTableReferences(
                                db,
                                table,
                                p0,
                              ).traitRecordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.animalId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AnimalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnimalsTable,
      Animal,
      $$AnimalsTableFilterComposer,
      $$AnimalsTableOrderingComposer,
      $$AnimalsTableAnnotationComposer,
      $$AnimalsTableCreateCompanionBuilder,
      $$AnimalsTableUpdateCompanionBuilder,
      (Animal, $$AnimalsTableReferences),
      Animal,
      PrefetchHooks Function({
        bool speciesId,
        bool breedId,
        bool groupId,
        bool sireId,
        bool damId,
        bool animalGenotypesRefs,
        bool animalPhenotypeObservationsRefs,
        bool offspringRefs,
        bool traitRecordsRefs,
      })
    >;
typedef $$LociTableCreateCompanionBuilder =
    LociCompanion Function({
      Value<String> id,
      required String speciesId,
      required String key,
      required String name,
      required String inheritancePattern,
      Value<bool> isSexLinked,
      Value<String?> description,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$LociTableUpdateCompanionBuilder =
    LociCompanion Function({
      Value<String> id,
      Value<String> speciesId,
      Value<String> key,
      Value<String> name,
      Value<String> inheritancePattern,
      Value<bool> isSexLinked,
      Value<String?> description,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$LociTableReferences
    extends BaseReferences<_$AppDatabase, $LociTable, Locus> {
  $$LociTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SpeciesTable _speciesIdTable(_$AppDatabase db) => db.species
      .createAlias($_aliasNameGenerator(db.loci.speciesId, db.species.id));

  $$SpeciesTableProcessedTableManager get speciesId {
    final $_column = $_itemColumn<String>('species_id')!;

    final manager = $$SpeciesTableTableManager(
      $_db,
      $_db.species,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_speciesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AllelesTable, List<Allele>> _allelesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.alleles,
    aliasName: $_aliasNameGenerator(db.loci.id, db.alleles.locusId),
  );

  $$AllelesTableProcessedTableManager get allelesRefs {
    final manager = $$AllelesTableTableManager(
      $_db,
      $_db.alleles,
    ).filter((f) => f.locusId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_allelesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AnimalGenotypesTable, List<AnimalGenotype>>
  _animalGenotypesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.animalGenotypes,
    aliasName: $_aliasNameGenerator(db.loci.id, db.animalGenotypes.locusId),
  );

  $$AnimalGenotypesTableProcessedTableManager get animalGenotypesRefs {
    final manager = $$AnimalGenotypesTableTableManager(
      $_db,
      $_db.animalGenotypes,
    ).filter((f) => f.locusId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _animalGenotypesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PhenotypeTraitsTable, List<PhenotypeTrait>>
  _phenotypeTraitsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.phenotypeTraits,
    aliasName: $_aliasNameGenerator(
      db.loci.id,
      db.phenotypeTraits.relatedLocusId,
    ),
  );

  $$PhenotypeTraitsTableProcessedTableManager get phenotypeTraitsRefs {
    final manager = $$PhenotypeTraitsTableTableManager(
      $_db,
      $_db.phenotypeTraits,
    ).filter((f) => f.relatedLocusId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _phenotypeTraitsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LociTableFilterComposer extends Composer<_$AppDatabase, $LociTable> {
  $$LociTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get inheritancePattern => $composableBuilder(
    column: $table.inheritancePattern,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSexLinked => $composableBuilder(
    column: $table.isSexLinked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SpeciesTableFilterComposer get speciesId {
    final $$SpeciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableFilterComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> allelesRefs(
    Expression<bool> Function($$AllelesTableFilterComposer f) f,
  ) {
    final $$AllelesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alleles,
      getReferencedColumn: (t) => t.locusId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AllelesTableFilterComposer(
            $db: $db,
            $table: $db.alleles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> animalGenotypesRefs(
    Expression<bool> Function($$AnimalGenotypesTableFilterComposer f) f,
  ) {
    final $$AnimalGenotypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.animalGenotypes,
      getReferencedColumn: (t) => t.locusId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalGenotypesTableFilterComposer(
            $db: $db,
            $table: $db.animalGenotypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> phenotypeTraitsRefs(
    Expression<bool> Function($$PhenotypeTraitsTableFilterComposer f) f,
  ) {
    final $$PhenotypeTraitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.phenotypeTraits,
      getReferencedColumn: (t) => t.relatedLocusId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhenotypeTraitsTableFilterComposer(
            $db: $db,
            $table: $db.phenotypeTraits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LociTableOrderingComposer extends Composer<_$AppDatabase, $LociTable> {
  $$LociTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get inheritancePattern => $composableBuilder(
    column: $table.inheritancePattern,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSexLinked => $composableBuilder(
    column: $table.isSexLinked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SpeciesTableOrderingComposer get speciesId {
    final $$SpeciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableOrderingComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LociTableAnnotationComposer
    extends Composer<_$AppDatabase, $LociTable> {
  $$LociTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get inheritancePattern => $composableBuilder(
    column: $table.inheritancePattern,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSexLinked => $composableBuilder(
    column: $table.isSexLinked,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SpeciesTableAnnotationComposer get speciesId {
    final $$SpeciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableAnnotationComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> allelesRefs<T extends Object>(
    Expression<T> Function($$AllelesTableAnnotationComposer a) f,
  ) {
    final $$AllelesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alleles,
      getReferencedColumn: (t) => t.locusId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AllelesTableAnnotationComposer(
            $db: $db,
            $table: $db.alleles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> animalGenotypesRefs<T extends Object>(
    Expression<T> Function($$AnimalGenotypesTableAnnotationComposer a) f,
  ) {
    final $$AnimalGenotypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.animalGenotypes,
      getReferencedColumn: (t) => t.locusId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalGenotypesTableAnnotationComposer(
            $db: $db,
            $table: $db.animalGenotypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> phenotypeTraitsRefs<T extends Object>(
    Expression<T> Function($$PhenotypeTraitsTableAnnotationComposer a) f,
  ) {
    final $$PhenotypeTraitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.phenotypeTraits,
      getReferencedColumn: (t) => t.relatedLocusId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhenotypeTraitsTableAnnotationComposer(
            $db: $db,
            $table: $db.phenotypeTraits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LociTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LociTable,
          Locus,
          $$LociTableFilterComposer,
          $$LociTableOrderingComposer,
          $$LociTableAnnotationComposer,
          $$LociTableCreateCompanionBuilder,
          $$LociTableUpdateCompanionBuilder,
          (Locus, $$LociTableReferences),
          Locus,
          PrefetchHooks Function({
            bool speciesId,
            bool allelesRefs,
            bool animalGenotypesRefs,
            bool phenotypeTraitsRefs,
          })
        > {
  $$LociTableTableManager(_$AppDatabase db, $LociTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LociTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LociTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LociTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> speciesId = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> inheritancePattern = const Value.absent(),
                Value<bool> isSexLinked = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LociCompanion(
                id: id,
                speciesId: speciesId,
                key: key,
                name: name,
                inheritancePattern: inheritancePattern,
                isSexLinked: isSexLinked,
                description: description,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String speciesId,
                required String key,
                required String name,
                required String inheritancePattern,
                Value<bool> isSexLinked = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LociCompanion.insert(
                id: id,
                speciesId: speciesId,
                key: key,
                name: name,
                inheritancePattern: inheritancePattern,
                isSexLinked: isSexLinked,
                description: description,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$LociTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                speciesId = false,
                allelesRefs = false,
                animalGenotypesRefs = false,
                phenotypeTraitsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (allelesRefs) db.alleles,
                    if (animalGenotypesRefs) db.animalGenotypes,
                    if (phenotypeTraitsRefs) db.phenotypeTraits,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (speciesId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.speciesId,
                                    referencedTable: $$LociTableReferences
                                        ._speciesIdTable(db),
                                    referencedColumn: $$LociTableReferences
                                        ._speciesIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (allelesRefs)
                        await $_getPrefetchedData<Locus, $LociTable, Allele>(
                          currentTable: table,
                          referencedTable: $$LociTableReferences
                              ._allelesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LociTableReferences(db, table, p0).allelesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.locusId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (animalGenotypesRefs)
                        await $_getPrefetchedData<
                          Locus,
                          $LociTable,
                          AnimalGenotype
                        >(
                          currentTable: table,
                          referencedTable: $$LociTableReferences
                              ._animalGenotypesRefsTable(db),
                          managerFromTypedResult: (p0) => $$LociTableReferences(
                            db,
                            table,
                            p0,
                          ).animalGenotypesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.locusId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (phenotypeTraitsRefs)
                        await $_getPrefetchedData<
                          Locus,
                          $LociTable,
                          PhenotypeTrait
                        >(
                          currentTable: table,
                          referencedTable: $$LociTableReferences
                              ._phenotypeTraitsRefsTable(db),
                          managerFromTypedResult: (p0) => $$LociTableReferences(
                            db,
                            table,
                            p0,
                          ).phenotypeTraitsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.relatedLocusId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LociTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LociTable,
      Locus,
      $$LociTableFilterComposer,
      $$LociTableOrderingComposer,
      $$LociTableAnnotationComposer,
      $$LociTableCreateCompanionBuilder,
      $$LociTableUpdateCompanionBuilder,
      (Locus, $$LociTableReferences),
      Locus,
      PrefetchHooks Function({
        bool speciesId,
        bool allelesRefs,
        bool animalGenotypesRefs,
        bool phenotypeTraitsRefs,
      })
    >;
typedef $$AllelesTableCreateCompanionBuilder =
    AllelesCompanion Function({
      Value<String> id,
      required String locusId,
      required String symbol,
      required String name,
      Value<int?> dominanceRank,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$AllelesTableUpdateCompanionBuilder =
    AllelesCompanion Function({
      Value<String> id,
      Value<String> locusId,
      Value<String> symbol,
      Value<String> name,
      Value<int?> dominanceRank,
      Value<String?> description,
      Value<int> rowid,
    });

final class $$AllelesTableReferences
    extends BaseReferences<_$AppDatabase, $AllelesTable, Allele> {
  $$AllelesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LociTable _locusIdTable(_$AppDatabase db) =>
      db.loci.createAlias($_aliasNameGenerator(db.alleles.locusId, db.loci.id));

  $$LociTableProcessedTableManager get locusId {
    final $_column = $_itemColumn<String>('locus_id')!;

    final manager = $$LociTableTableManager(
      $_db,
      $_db.loci,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_locusIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AllelesTableFilterComposer
    extends Composer<_$AppDatabase, $AllelesTable> {
  $$AllelesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dominanceRank => $composableBuilder(
    column: $table.dominanceRank,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$LociTableFilterComposer get locusId {
    final $$LociTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locusId,
      referencedTable: $db.loci,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LociTableFilterComposer(
            $db: $db,
            $table: $db.loci,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AllelesTableOrderingComposer
    extends Composer<_$AppDatabase, $AllelesTable> {
  $$AllelesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dominanceRank => $composableBuilder(
    column: $table.dominanceRank,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$LociTableOrderingComposer get locusId {
    final $$LociTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locusId,
      referencedTable: $db.loci,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LociTableOrderingComposer(
            $db: $db,
            $table: $db.loci,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AllelesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AllelesTable> {
  $$AllelesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get dominanceRank => $composableBuilder(
    column: $table.dominanceRank,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$LociTableAnnotationComposer get locusId {
    final $$LociTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locusId,
      referencedTable: $db.loci,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LociTableAnnotationComposer(
            $db: $db,
            $table: $db.loci,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AllelesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AllelesTable,
          Allele,
          $$AllelesTableFilterComposer,
          $$AllelesTableOrderingComposer,
          $$AllelesTableAnnotationComposer,
          $$AllelesTableCreateCompanionBuilder,
          $$AllelesTableUpdateCompanionBuilder,
          (Allele, $$AllelesTableReferences),
          Allele,
          PrefetchHooks Function({bool locusId})
        > {
  $$AllelesTableTableManager(_$AppDatabase db, $AllelesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AllelesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AllelesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AllelesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> locusId = const Value.absent(),
                Value<String> symbol = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> dominanceRank = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AllelesCompanion(
                id: id,
                locusId: locusId,
                symbol: symbol,
                name: name,
                dominanceRank: dominanceRank,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String locusId,
                required String symbol,
                required String name,
                Value<int?> dominanceRank = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AllelesCompanion.insert(
                id: id,
                locusId: locusId,
                symbol: symbol,
                name: name,
                dominanceRank: dominanceRank,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AllelesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({locusId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (locusId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.locusId,
                                referencedTable: $$AllelesTableReferences
                                    ._locusIdTable(db),
                                referencedColumn: $$AllelesTableReferences
                                    ._locusIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AllelesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AllelesTable,
      Allele,
      $$AllelesTableFilterComposer,
      $$AllelesTableOrderingComposer,
      $$AllelesTableAnnotationComposer,
      $$AllelesTableCreateCompanionBuilder,
      $$AllelesTableUpdateCompanionBuilder,
      (Allele, $$AllelesTableReferences),
      Allele,
      PrefetchHooks Function({bool locusId})
    >;
typedef $$AnimalGenotypesTableCreateCompanionBuilder =
    AnimalGenotypesCompanion Function({
      Value<String> id,
      required String animalId,
      required String locusId,
      required String allele1Id,
      Value<String?> allele2Id,
      Value<String> source,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$AnimalGenotypesTableUpdateCompanionBuilder =
    AnimalGenotypesCompanion Function({
      Value<String> id,
      Value<String> animalId,
      Value<String> locusId,
      Value<String> allele1Id,
      Value<String?> allele2Id,
      Value<String> source,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$AnimalGenotypesTableReferences
    extends
        BaseReferences<_$AppDatabase, $AnimalGenotypesTable, AnimalGenotype> {
  $$AnimalGenotypesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AnimalsTable _animalIdTable(_$AppDatabase db) =>
      db.animals.createAlias(
        $_aliasNameGenerator(db.animalGenotypes.animalId, db.animals.id),
      );

  $$AnimalsTableProcessedTableManager get animalId {
    final $_column = $_itemColumn<String>('animal_id')!;

    final manager = $$AnimalsTableTableManager(
      $_db,
      $_db.animals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_animalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LociTable _locusIdTable(_$AppDatabase db) => db.loci.createAlias(
    $_aliasNameGenerator(db.animalGenotypes.locusId, db.loci.id),
  );

  $$LociTableProcessedTableManager get locusId {
    final $_column = $_itemColumn<String>('locus_id')!;

    final manager = $$LociTableTableManager(
      $_db,
      $_db.loci,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_locusIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AllelesTable _allele1IdTable(_$AppDatabase db) =>
      db.alleles.createAlias(
        $_aliasNameGenerator(db.animalGenotypes.allele1Id, db.alleles.id),
      );

  $$AllelesTableProcessedTableManager get allele1Id {
    final $_column = $_itemColumn<String>('allele1_id')!;

    final manager = $$AllelesTableTableManager(
      $_db,
      $_db.alleles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_allele1IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AllelesTable _allele2IdTable(_$AppDatabase db) =>
      db.alleles.createAlias(
        $_aliasNameGenerator(db.animalGenotypes.allele2Id, db.alleles.id),
      );

  $$AllelesTableProcessedTableManager? get allele2Id {
    final $_column = $_itemColumn<String>('allele2_id');
    if ($_column == null) return null;
    final manager = $$AllelesTableTableManager(
      $_db,
      $_db.alleles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_allele2IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AnimalGenotypesTableFilterComposer
    extends Composer<_$AppDatabase, $AnimalGenotypesTable> {
  $$AnimalGenotypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AnimalsTableFilterComposer get animalId {
    final $$AnimalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.animalId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableFilterComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LociTableFilterComposer get locusId {
    final $$LociTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locusId,
      referencedTable: $db.loci,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LociTableFilterComposer(
            $db: $db,
            $table: $db.loci,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AllelesTableFilterComposer get allele1Id {
    final $$AllelesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.allele1Id,
      referencedTable: $db.alleles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AllelesTableFilterComposer(
            $db: $db,
            $table: $db.alleles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AllelesTableFilterComposer get allele2Id {
    final $$AllelesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.allele2Id,
      referencedTable: $db.alleles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AllelesTableFilterComposer(
            $db: $db,
            $table: $db.alleles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnimalGenotypesTableOrderingComposer
    extends Composer<_$AppDatabase, $AnimalGenotypesTable> {
  $$AnimalGenotypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AnimalsTableOrderingComposer get animalId {
    final $$AnimalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.animalId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableOrderingComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LociTableOrderingComposer get locusId {
    final $$LociTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locusId,
      referencedTable: $db.loci,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LociTableOrderingComposer(
            $db: $db,
            $table: $db.loci,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AllelesTableOrderingComposer get allele1Id {
    final $$AllelesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.allele1Id,
      referencedTable: $db.alleles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AllelesTableOrderingComposer(
            $db: $db,
            $table: $db.alleles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AllelesTableOrderingComposer get allele2Id {
    final $$AllelesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.allele2Id,
      referencedTable: $db.alleles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AllelesTableOrderingComposer(
            $db: $db,
            $table: $db.alleles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnimalGenotypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnimalGenotypesTable> {
  $$AnimalGenotypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$AnimalsTableAnnotationComposer get animalId {
    final $$AnimalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.animalId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableAnnotationComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LociTableAnnotationComposer get locusId {
    final $$LociTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locusId,
      referencedTable: $db.loci,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LociTableAnnotationComposer(
            $db: $db,
            $table: $db.loci,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AllelesTableAnnotationComposer get allele1Id {
    final $$AllelesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.allele1Id,
      referencedTable: $db.alleles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AllelesTableAnnotationComposer(
            $db: $db,
            $table: $db.alleles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AllelesTableAnnotationComposer get allele2Id {
    final $$AllelesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.allele2Id,
      referencedTable: $db.alleles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AllelesTableAnnotationComposer(
            $db: $db,
            $table: $db.alleles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnimalGenotypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnimalGenotypesTable,
          AnimalGenotype,
          $$AnimalGenotypesTableFilterComposer,
          $$AnimalGenotypesTableOrderingComposer,
          $$AnimalGenotypesTableAnnotationComposer,
          $$AnimalGenotypesTableCreateCompanionBuilder,
          $$AnimalGenotypesTableUpdateCompanionBuilder,
          (AnimalGenotype, $$AnimalGenotypesTableReferences),
          AnimalGenotype,
          PrefetchHooks Function({
            bool animalId,
            bool locusId,
            bool allele1Id,
            bool allele2Id,
          })
        > {
  $$AnimalGenotypesTableTableManager(
    _$AppDatabase db,
    $AnimalGenotypesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnimalGenotypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnimalGenotypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnimalGenotypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> animalId = const Value.absent(),
                Value<String> locusId = const Value.absent(),
                Value<String> allele1Id = const Value.absent(),
                Value<String?> allele2Id = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnimalGenotypesCompanion(
                id: id,
                animalId: animalId,
                locusId: locusId,
                allele1Id: allele1Id,
                allele2Id: allele2Id,
                source: source,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String animalId,
                required String locusId,
                required String allele1Id,
                Value<String?> allele2Id = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnimalGenotypesCompanion.insert(
                id: id,
                animalId: animalId,
                locusId: locusId,
                allele1Id: allele1Id,
                allele2Id: allele2Id,
                source: source,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AnimalGenotypesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                animalId = false,
                locusId = false,
                allele1Id = false,
                allele2Id = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (animalId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.animalId,
                                    referencedTable:
                                        $$AnimalGenotypesTableReferences
                                            ._animalIdTable(db),
                                    referencedColumn:
                                        $$AnimalGenotypesTableReferences
                                            ._animalIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (locusId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.locusId,
                                    referencedTable:
                                        $$AnimalGenotypesTableReferences
                                            ._locusIdTable(db),
                                    referencedColumn:
                                        $$AnimalGenotypesTableReferences
                                            ._locusIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (allele1Id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.allele1Id,
                                    referencedTable:
                                        $$AnimalGenotypesTableReferences
                                            ._allele1IdTable(db),
                                    referencedColumn:
                                        $$AnimalGenotypesTableReferences
                                            ._allele1IdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (allele2Id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.allele2Id,
                                    referencedTable:
                                        $$AnimalGenotypesTableReferences
                                            ._allele2IdTable(db),
                                    referencedColumn:
                                        $$AnimalGenotypesTableReferences
                                            ._allele2IdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$AnimalGenotypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnimalGenotypesTable,
      AnimalGenotype,
      $$AnimalGenotypesTableFilterComposer,
      $$AnimalGenotypesTableOrderingComposer,
      $$AnimalGenotypesTableAnnotationComposer,
      $$AnimalGenotypesTableCreateCompanionBuilder,
      $$AnimalGenotypesTableUpdateCompanionBuilder,
      (AnimalGenotype, $$AnimalGenotypesTableReferences),
      AnimalGenotype,
      PrefetchHooks Function({
        bool animalId,
        bool locusId,
        bool allele1Id,
        bool allele2Id,
      })
    >;
typedef $$PhenotypeTraitsTableCreateCompanionBuilder =
    PhenotypeTraitsCompanion Function({
      Value<String> id,
      required String speciesId,
      required String key,
      required String name,
      Value<String?> relatedLocusId,
      Value<int> rowid,
    });
typedef $$PhenotypeTraitsTableUpdateCompanionBuilder =
    PhenotypeTraitsCompanion Function({
      Value<String> id,
      Value<String> speciesId,
      Value<String> key,
      Value<String> name,
      Value<String?> relatedLocusId,
      Value<int> rowid,
    });

final class $$PhenotypeTraitsTableReferences
    extends
        BaseReferences<_$AppDatabase, $PhenotypeTraitsTable, PhenotypeTrait> {
  $$PhenotypeTraitsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SpeciesTable _speciesIdTable(_$AppDatabase db) =>
      db.species.createAlias(
        $_aliasNameGenerator(db.phenotypeTraits.speciesId, db.species.id),
      );

  $$SpeciesTableProcessedTableManager get speciesId {
    final $_column = $_itemColumn<String>('species_id')!;

    final manager = $$SpeciesTableTableManager(
      $_db,
      $_db.species,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_speciesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LociTable _relatedLocusIdTable(_$AppDatabase db) =>
      db.loci.createAlias(
        $_aliasNameGenerator(db.phenotypeTraits.relatedLocusId, db.loci.id),
      );

  $$LociTableProcessedTableManager? get relatedLocusId {
    final $_column = $_itemColumn<String>('related_locus_id');
    if ($_column == null) return null;
    final manager = $$LociTableTableManager(
      $_db,
      $_db.loci,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_relatedLocusIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $PhenotypeTraitOptionsTable,
    List<PhenotypeTraitOption>
  >
  _phenotypeTraitOptionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.phenotypeTraitOptions,
        aliasName: $_aliasNameGenerator(
          db.phenotypeTraits.id,
          db.phenotypeTraitOptions.phenotypeTraitId,
        ),
      );

  $$PhenotypeTraitOptionsTableProcessedTableManager
  get phenotypeTraitOptionsRefs {
    final manager =
        $$PhenotypeTraitOptionsTableTableManager(
          $_db,
          $_db.phenotypeTraitOptions,
        ).filter(
          (f) => f.phenotypeTraitId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _phenotypeTraitOptionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $AnimalPhenotypeObservationsTable,
    List<AnimalPhenotypeObservation>
  >
  _animalPhenotypeObservationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.animalPhenotypeObservations,
        aliasName: $_aliasNameGenerator(
          db.phenotypeTraits.id,
          db.animalPhenotypeObservations.phenotypeTraitId,
        ),
      );

  $$AnimalPhenotypeObservationsTableProcessedTableManager
  get animalPhenotypeObservationsRefs {
    final manager =
        $$AnimalPhenotypeObservationsTableTableManager(
          $_db,
          $_db.animalPhenotypeObservations,
        ).filter(
          (f) => f.phenotypeTraitId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _animalPhenotypeObservationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PhenotypeTraitsTableFilterComposer
    extends Composer<_$AppDatabase, $PhenotypeTraitsTable> {
  $$PhenotypeTraitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  $$SpeciesTableFilterComposer get speciesId {
    final $$SpeciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableFilterComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LociTableFilterComposer get relatedLocusId {
    final $$LociTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedLocusId,
      referencedTable: $db.loci,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LociTableFilterComposer(
            $db: $db,
            $table: $db.loci,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> phenotypeTraitOptionsRefs(
    Expression<bool> Function($$PhenotypeTraitOptionsTableFilterComposer f) f,
  ) {
    final $$PhenotypeTraitOptionsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.phenotypeTraitOptions,
          getReferencedColumn: (t) => t.phenotypeTraitId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PhenotypeTraitOptionsTableFilterComposer(
                $db: $db,
                $table: $db.phenotypeTraitOptions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> animalPhenotypeObservationsRefs(
    Expression<bool> Function(
      $$AnimalPhenotypeObservationsTableFilterComposer f,
    )
    f,
  ) {
    final $$AnimalPhenotypeObservationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.animalPhenotypeObservations,
          getReferencedColumn: (t) => t.phenotypeTraitId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnimalPhenotypeObservationsTableFilterComposer(
                $db: $db,
                $table: $db.animalPhenotypeObservations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PhenotypeTraitsTableOrderingComposer
    extends Composer<_$AppDatabase, $PhenotypeTraitsTable> {
  $$PhenotypeTraitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  $$SpeciesTableOrderingComposer get speciesId {
    final $$SpeciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableOrderingComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LociTableOrderingComposer get relatedLocusId {
    final $$LociTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedLocusId,
      referencedTable: $db.loci,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LociTableOrderingComposer(
            $db: $db,
            $table: $db.loci,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PhenotypeTraitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhenotypeTraitsTable> {
  $$PhenotypeTraitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$SpeciesTableAnnotationComposer get speciesId {
    final $$SpeciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableAnnotationComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LociTableAnnotationComposer get relatedLocusId {
    final $$LociTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedLocusId,
      referencedTable: $db.loci,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LociTableAnnotationComposer(
            $db: $db,
            $table: $db.loci,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> phenotypeTraitOptionsRefs<T extends Object>(
    Expression<T> Function($$PhenotypeTraitOptionsTableAnnotationComposer a) f,
  ) {
    final $$PhenotypeTraitOptionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.phenotypeTraitOptions,
          getReferencedColumn: (t) => t.phenotypeTraitId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PhenotypeTraitOptionsTableAnnotationComposer(
                $db: $db,
                $table: $db.phenotypeTraitOptions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> animalPhenotypeObservationsRefs<T extends Object>(
    Expression<T> Function(
      $$AnimalPhenotypeObservationsTableAnnotationComposer a,
    )
    f,
  ) {
    final $$AnimalPhenotypeObservationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.animalPhenotypeObservations,
          getReferencedColumn: (t) => t.phenotypeTraitId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnimalPhenotypeObservationsTableAnnotationComposer(
                $db: $db,
                $table: $db.animalPhenotypeObservations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PhenotypeTraitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PhenotypeTraitsTable,
          PhenotypeTrait,
          $$PhenotypeTraitsTableFilterComposer,
          $$PhenotypeTraitsTableOrderingComposer,
          $$PhenotypeTraitsTableAnnotationComposer,
          $$PhenotypeTraitsTableCreateCompanionBuilder,
          $$PhenotypeTraitsTableUpdateCompanionBuilder,
          (PhenotypeTrait, $$PhenotypeTraitsTableReferences),
          PhenotypeTrait,
          PrefetchHooks Function({
            bool speciesId,
            bool relatedLocusId,
            bool phenotypeTraitOptionsRefs,
            bool animalPhenotypeObservationsRefs,
          })
        > {
  $$PhenotypeTraitsTableTableManager(
    _$AppDatabase db,
    $PhenotypeTraitsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhenotypeTraitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhenotypeTraitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhenotypeTraitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> speciesId = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> relatedLocusId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhenotypeTraitsCompanion(
                id: id,
                speciesId: speciesId,
                key: key,
                name: name,
                relatedLocusId: relatedLocusId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String speciesId,
                required String key,
                required String name,
                Value<String?> relatedLocusId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhenotypeTraitsCompanion.insert(
                id: id,
                speciesId: speciesId,
                key: key,
                name: name,
                relatedLocusId: relatedLocusId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PhenotypeTraitsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                speciesId = false,
                relatedLocusId = false,
                phenotypeTraitOptionsRefs = false,
                animalPhenotypeObservationsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (phenotypeTraitOptionsRefs) db.phenotypeTraitOptions,
                    if (animalPhenotypeObservationsRefs)
                      db.animalPhenotypeObservations,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (speciesId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.speciesId,
                                    referencedTable:
                                        $$PhenotypeTraitsTableReferences
                                            ._speciesIdTable(db),
                                    referencedColumn:
                                        $$PhenotypeTraitsTableReferences
                                            ._speciesIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (relatedLocusId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.relatedLocusId,
                                    referencedTable:
                                        $$PhenotypeTraitsTableReferences
                                            ._relatedLocusIdTable(db),
                                    referencedColumn:
                                        $$PhenotypeTraitsTableReferences
                                            ._relatedLocusIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (phenotypeTraitOptionsRefs)
                        await $_getPrefetchedData<
                          PhenotypeTrait,
                          $PhenotypeTraitsTable,
                          PhenotypeTraitOption
                        >(
                          currentTable: table,
                          referencedTable: $$PhenotypeTraitsTableReferences
                              ._phenotypeTraitOptionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PhenotypeTraitsTableReferences(
                                db,
                                table,
                                p0,
                              ).phenotypeTraitOptionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.phenotypeTraitId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (animalPhenotypeObservationsRefs)
                        await $_getPrefetchedData<
                          PhenotypeTrait,
                          $PhenotypeTraitsTable,
                          AnimalPhenotypeObservation
                        >(
                          currentTable: table,
                          referencedTable: $$PhenotypeTraitsTableReferences
                              ._animalPhenotypeObservationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PhenotypeTraitsTableReferences(
                                db,
                                table,
                                p0,
                              ).animalPhenotypeObservationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.phenotypeTraitId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PhenotypeTraitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PhenotypeTraitsTable,
      PhenotypeTrait,
      $$PhenotypeTraitsTableFilterComposer,
      $$PhenotypeTraitsTableOrderingComposer,
      $$PhenotypeTraitsTableAnnotationComposer,
      $$PhenotypeTraitsTableCreateCompanionBuilder,
      $$PhenotypeTraitsTableUpdateCompanionBuilder,
      (PhenotypeTrait, $$PhenotypeTraitsTableReferences),
      PhenotypeTrait,
      PrefetchHooks Function({
        bool speciesId,
        bool relatedLocusId,
        bool phenotypeTraitOptionsRefs,
        bool animalPhenotypeObservationsRefs,
      })
    >;
typedef $$PhenotypeTraitOptionsTableCreateCompanionBuilder =
    PhenotypeTraitOptionsCompanion Function({
      Value<String> id,
      required String phenotypeTraitId,
      required String label,
      Value<String?> plausibleGenotypesJson,
      Value<int> rowid,
    });
typedef $$PhenotypeTraitOptionsTableUpdateCompanionBuilder =
    PhenotypeTraitOptionsCompanion Function({
      Value<String> id,
      Value<String> phenotypeTraitId,
      Value<String> label,
      Value<String?> plausibleGenotypesJson,
      Value<int> rowid,
    });

final class $$PhenotypeTraitOptionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PhenotypeTraitOptionsTable,
          PhenotypeTraitOption
        > {
  $$PhenotypeTraitOptionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PhenotypeTraitsTable _phenotypeTraitIdTable(_$AppDatabase db) =>
      db.phenotypeTraits.createAlias(
        $_aliasNameGenerator(
          db.phenotypeTraitOptions.phenotypeTraitId,
          db.phenotypeTraits.id,
        ),
      );

  $$PhenotypeTraitsTableProcessedTableManager get phenotypeTraitId {
    final $_column = $_itemColumn<String>('phenotype_trait_id')!;

    final manager = $$PhenotypeTraitsTableTableManager(
      $_db,
      $_db.phenotypeTraits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_phenotypeTraitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $AnimalPhenotypeObservationsTable,
    List<AnimalPhenotypeObservation>
  >
  _animalPhenotypeObservationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.animalPhenotypeObservations,
        aliasName: $_aliasNameGenerator(
          db.phenotypeTraitOptions.id,
          db.animalPhenotypeObservations.selectedOptionId,
        ),
      );

  $$AnimalPhenotypeObservationsTableProcessedTableManager
  get animalPhenotypeObservationsRefs {
    final manager =
        $$AnimalPhenotypeObservationsTableTableManager(
          $_db,
          $_db.animalPhenotypeObservations,
        ).filter(
          (f) => f.selectedOptionId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _animalPhenotypeObservationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PhenotypeTraitOptionsTableFilterComposer
    extends Composer<_$AppDatabase, $PhenotypeTraitOptionsTable> {
  $$PhenotypeTraitOptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get plausibleGenotypesJson => $composableBuilder(
    column: $table.plausibleGenotypesJson,
    builder: (column) => ColumnFilters(column),
  );

  $$PhenotypeTraitsTableFilterComposer get phenotypeTraitId {
    final $$PhenotypeTraitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.phenotypeTraitId,
      referencedTable: $db.phenotypeTraits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhenotypeTraitsTableFilterComposer(
            $db: $db,
            $table: $db.phenotypeTraits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> animalPhenotypeObservationsRefs(
    Expression<bool> Function(
      $$AnimalPhenotypeObservationsTableFilterComposer f,
    )
    f,
  ) {
    final $$AnimalPhenotypeObservationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.animalPhenotypeObservations,
          getReferencedColumn: (t) => t.selectedOptionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnimalPhenotypeObservationsTableFilterComposer(
                $db: $db,
                $table: $db.animalPhenotypeObservations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PhenotypeTraitOptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $PhenotypeTraitOptionsTable> {
  $$PhenotypeTraitOptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get plausibleGenotypesJson => $composableBuilder(
    column: $table.plausibleGenotypesJson,
    builder: (column) => ColumnOrderings(column),
  );

  $$PhenotypeTraitsTableOrderingComposer get phenotypeTraitId {
    final $$PhenotypeTraitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.phenotypeTraitId,
      referencedTable: $db.phenotypeTraits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhenotypeTraitsTableOrderingComposer(
            $db: $db,
            $table: $db.phenotypeTraits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PhenotypeTraitOptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhenotypeTraitOptionsTable> {
  $$PhenotypeTraitOptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get plausibleGenotypesJson => $composableBuilder(
    column: $table.plausibleGenotypesJson,
    builder: (column) => column,
  );

  $$PhenotypeTraitsTableAnnotationComposer get phenotypeTraitId {
    final $$PhenotypeTraitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.phenotypeTraitId,
      referencedTable: $db.phenotypeTraits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhenotypeTraitsTableAnnotationComposer(
            $db: $db,
            $table: $db.phenotypeTraits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> animalPhenotypeObservationsRefs<T extends Object>(
    Expression<T> Function(
      $$AnimalPhenotypeObservationsTableAnnotationComposer a,
    )
    f,
  ) {
    final $$AnimalPhenotypeObservationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.animalPhenotypeObservations,
          getReferencedColumn: (t) => t.selectedOptionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnimalPhenotypeObservationsTableAnnotationComposer(
                $db: $db,
                $table: $db.animalPhenotypeObservations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PhenotypeTraitOptionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PhenotypeTraitOptionsTable,
          PhenotypeTraitOption,
          $$PhenotypeTraitOptionsTableFilterComposer,
          $$PhenotypeTraitOptionsTableOrderingComposer,
          $$PhenotypeTraitOptionsTableAnnotationComposer,
          $$PhenotypeTraitOptionsTableCreateCompanionBuilder,
          $$PhenotypeTraitOptionsTableUpdateCompanionBuilder,
          (PhenotypeTraitOption, $$PhenotypeTraitOptionsTableReferences),
          PhenotypeTraitOption,
          PrefetchHooks Function({
            bool phenotypeTraitId,
            bool animalPhenotypeObservationsRefs,
          })
        > {
  $$PhenotypeTraitOptionsTableTableManager(
    _$AppDatabase db,
    $PhenotypeTraitOptionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhenotypeTraitOptionsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$PhenotypeTraitOptionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PhenotypeTraitOptionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> phenotypeTraitId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String?> plausibleGenotypesJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhenotypeTraitOptionsCompanion(
                id: id,
                phenotypeTraitId: phenotypeTraitId,
                label: label,
                plausibleGenotypesJson: plausibleGenotypesJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String phenotypeTraitId,
                required String label,
                Value<String?> plausibleGenotypesJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhenotypeTraitOptionsCompanion.insert(
                id: id,
                phenotypeTraitId: phenotypeTraitId,
                label: label,
                plausibleGenotypesJson: plausibleGenotypesJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PhenotypeTraitOptionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                phenotypeTraitId = false,
                animalPhenotypeObservationsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (animalPhenotypeObservationsRefs)
                      db.animalPhenotypeObservations,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (phenotypeTraitId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.phenotypeTraitId,
                                    referencedTable:
                                        $$PhenotypeTraitOptionsTableReferences
                                            ._phenotypeTraitIdTable(db),
                                    referencedColumn:
                                        $$PhenotypeTraitOptionsTableReferences
                                            ._phenotypeTraitIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (animalPhenotypeObservationsRefs)
                        await $_getPrefetchedData<
                          PhenotypeTraitOption,
                          $PhenotypeTraitOptionsTable,
                          AnimalPhenotypeObservation
                        >(
                          currentTable: table,
                          referencedTable:
                              $$PhenotypeTraitOptionsTableReferences
                                  ._animalPhenotypeObservationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PhenotypeTraitOptionsTableReferences(
                                db,
                                table,
                                p0,
                              ).animalPhenotypeObservationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.selectedOptionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PhenotypeTraitOptionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PhenotypeTraitOptionsTable,
      PhenotypeTraitOption,
      $$PhenotypeTraitOptionsTableFilterComposer,
      $$PhenotypeTraitOptionsTableOrderingComposer,
      $$PhenotypeTraitOptionsTableAnnotationComposer,
      $$PhenotypeTraitOptionsTableCreateCompanionBuilder,
      $$PhenotypeTraitOptionsTableUpdateCompanionBuilder,
      (PhenotypeTraitOption, $$PhenotypeTraitOptionsTableReferences),
      PhenotypeTraitOption,
      PrefetchHooks Function({
        bool phenotypeTraitId,
        bool animalPhenotypeObservationsRefs,
      })
    >;
typedef $$AnimalPhenotypeObservationsTableCreateCompanionBuilder =
    AnimalPhenotypeObservationsCompanion Function({
      Value<String> id,
      required String animalId,
      required String phenotypeTraitId,
      Value<String?> selectedOptionId,
      Value<String?> freeTextValue,
      Value<DateTime?> observedDate,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$AnimalPhenotypeObservationsTableUpdateCompanionBuilder =
    AnimalPhenotypeObservationsCompanion Function({
      Value<String> id,
      Value<String> animalId,
      Value<String> phenotypeTraitId,
      Value<String?> selectedOptionId,
      Value<String?> freeTextValue,
      Value<DateTime?> observedDate,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$AnimalPhenotypeObservationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AnimalPhenotypeObservationsTable,
          AnimalPhenotypeObservation
        > {
  $$AnimalPhenotypeObservationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AnimalsTable _animalIdTable(_$AppDatabase db) =>
      db.animals.createAlias(
        $_aliasNameGenerator(
          db.animalPhenotypeObservations.animalId,
          db.animals.id,
        ),
      );

  $$AnimalsTableProcessedTableManager get animalId {
    final $_column = $_itemColumn<String>('animal_id')!;

    final manager = $$AnimalsTableTableManager(
      $_db,
      $_db.animals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_animalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PhenotypeTraitsTable _phenotypeTraitIdTable(_$AppDatabase db) =>
      db.phenotypeTraits.createAlias(
        $_aliasNameGenerator(
          db.animalPhenotypeObservations.phenotypeTraitId,
          db.phenotypeTraits.id,
        ),
      );

  $$PhenotypeTraitsTableProcessedTableManager get phenotypeTraitId {
    final $_column = $_itemColumn<String>('phenotype_trait_id')!;

    final manager = $$PhenotypeTraitsTableTableManager(
      $_db,
      $_db.phenotypeTraits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_phenotypeTraitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PhenotypeTraitOptionsTable _selectedOptionIdTable(_$AppDatabase db) =>
      db.phenotypeTraitOptions.createAlias(
        $_aliasNameGenerator(
          db.animalPhenotypeObservations.selectedOptionId,
          db.phenotypeTraitOptions.id,
        ),
      );

  $$PhenotypeTraitOptionsTableProcessedTableManager? get selectedOptionId {
    final $_column = $_itemColumn<String>('selected_option_id');
    if ($_column == null) return null;
    final manager = $$PhenotypeTraitOptionsTableTableManager(
      $_db,
      $_db.phenotypeTraitOptions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_selectedOptionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AnimalPhenotypeObservationsTableFilterComposer
    extends Composer<_$AppDatabase, $AnimalPhenotypeObservationsTable> {
  $$AnimalPhenotypeObservationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get freeTextValue => $composableBuilder(
    column: $table.freeTextValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get observedDate => $composableBuilder(
    column: $table.observedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AnimalsTableFilterComposer get animalId {
    final $$AnimalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.animalId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableFilterComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PhenotypeTraitsTableFilterComposer get phenotypeTraitId {
    final $$PhenotypeTraitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.phenotypeTraitId,
      referencedTable: $db.phenotypeTraits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhenotypeTraitsTableFilterComposer(
            $db: $db,
            $table: $db.phenotypeTraits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PhenotypeTraitOptionsTableFilterComposer get selectedOptionId {
    final $$PhenotypeTraitOptionsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.selectedOptionId,
          referencedTable: $db.phenotypeTraitOptions,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PhenotypeTraitOptionsTableFilterComposer(
                $db: $db,
                $table: $db.phenotypeTraitOptions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AnimalPhenotypeObservationsTableOrderingComposer
    extends Composer<_$AppDatabase, $AnimalPhenotypeObservationsTable> {
  $$AnimalPhenotypeObservationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get freeTextValue => $composableBuilder(
    column: $table.freeTextValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get observedDate => $composableBuilder(
    column: $table.observedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AnimalsTableOrderingComposer get animalId {
    final $$AnimalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.animalId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableOrderingComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PhenotypeTraitsTableOrderingComposer get phenotypeTraitId {
    final $$PhenotypeTraitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.phenotypeTraitId,
      referencedTable: $db.phenotypeTraits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhenotypeTraitsTableOrderingComposer(
            $db: $db,
            $table: $db.phenotypeTraits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PhenotypeTraitOptionsTableOrderingComposer get selectedOptionId {
    final $$PhenotypeTraitOptionsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.selectedOptionId,
          referencedTable: $db.phenotypeTraitOptions,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PhenotypeTraitOptionsTableOrderingComposer(
                $db: $db,
                $table: $db.phenotypeTraitOptions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AnimalPhenotypeObservationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnimalPhenotypeObservationsTable> {
  $$AnimalPhenotypeObservationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get freeTextValue => $composableBuilder(
    column: $table.freeTextValue,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get observedDate => $composableBuilder(
    column: $table.observedDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$AnimalsTableAnnotationComposer get animalId {
    final $$AnimalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.animalId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableAnnotationComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PhenotypeTraitsTableAnnotationComposer get phenotypeTraitId {
    final $$PhenotypeTraitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.phenotypeTraitId,
      referencedTable: $db.phenotypeTraits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhenotypeTraitsTableAnnotationComposer(
            $db: $db,
            $table: $db.phenotypeTraits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PhenotypeTraitOptionsTableAnnotationComposer get selectedOptionId {
    final $$PhenotypeTraitOptionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.selectedOptionId,
          referencedTable: $db.phenotypeTraitOptions,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PhenotypeTraitOptionsTableAnnotationComposer(
                $db: $db,
                $table: $db.phenotypeTraitOptions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AnimalPhenotypeObservationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnimalPhenotypeObservationsTable,
          AnimalPhenotypeObservation,
          $$AnimalPhenotypeObservationsTableFilterComposer,
          $$AnimalPhenotypeObservationsTableOrderingComposer,
          $$AnimalPhenotypeObservationsTableAnnotationComposer,
          $$AnimalPhenotypeObservationsTableCreateCompanionBuilder,
          $$AnimalPhenotypeObservationsTableUpdateCompanionBuilder,
          (
            AnimalPhenotypeObservation,
            $$AnimalPhenotypeObservationsTableReferences,
          ),
          AnimalPhenotypeObservation,
          PrefetchHooks Function({
            bool animalId,
            bool phenotypeTraitId,
            bool selectedOptionId,
          })
        > {
  $$AnimalPhenotypeObservationsTableTableManager(
    _$AppDatabase db,
    $AnimalPhenotypeObservationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnimalPhenotypeObservationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$AnimalPhenotypeObservationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AnimalPhenotypeObservationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> animalId = const Value.absent(),
                Value<String> phenotypeTraitId = const Value.absent(),
                Value<String?> selectedOptionId = const Value.absent(),
                Value<String?> freeTextValue = const Value.absent(),
                Value<DateTime?> observedDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnimalPhenotypeObservationsCompanion(
                id: id,
                animalId: animalId,
                phenotypeTraitId: phenotypeTraitId,
                selectedOptionId: selectedOptionId,
                freeTextValue: freeTextValue,
                observedDate: observedDate,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String animalId,
                required String phenotypeTraitId,
                Value<String?> selectedOptionId = const Value.absent(),
                Value<String?> freeTextValue = const Value.absent(),
                Value<DateTime?> observedDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnimalPhenotypeObservationsCompanion.insert(
                id: id,
                animalId: animalId,
                phenotypeTraitId: phenotypeTraitId,
                selectedOptionId: selectedOptionId,
                freeTextValue: freeTextValue,
                observedDate: observedDate,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AnimalPhenotypeObservationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                animalId = false,
                phenotypeTraitId = false,
                selectedOptionId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (animalId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.animalId,
                                    referencedTable:
                                        $$AnimalPhenotypeObservationsTableReferences
                                            ._animalIdTable(db),
                                    referencedColumn:
                                        $$AnimalPhenotypeObservationsTableReferences
                                            ._animalIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (phenotypeTraitId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.phenotypeTraitId,
                                    referencedTable:
                                        $$AnimalPhenotypeObservationsTableReferences
                                            ._phenotypeTraitIdTable(db),
                                    referencedColumn:
                                        $$AnimalPhenotypeObservationsTableReferences
                                            ._phenotypeTraitIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (selectedOptionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.selectedOptionId,
                                    referencedTable:
                                        $$AnimalPhenotypeObservationsTableReferences
                                            ._selectedOptionIdTable(db),
                                    referencedColumn:
                                        $$AnimalPhenotypeObservationsTableReferences
                                            ._selectedOptionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$AnimalPhenotypeObservationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnimalPhenotypeObservationsTable,
      AnimalPhenotypeObservation,
      $$AnimalPhenotypeObservationsTableFilterComposer,
      $$AnimalPhenotypeObservationsTableOrderingComposer,
      $$AnimalPhenotypeObservationsTableAnnotationComposer,
      $$AnimalPhenotypeObservationsTableCreateCompanionBuilder,
      $$AnimalPhenotypeObservationsTableUpdateCompanionBuilder,
      (
        AnimalPhenotypeObservation,
        $$AnimalPhenotypeObservationsTableReferences,
      ),
      AnimalPhenotypeObservation,
      PrefetchHooks Function({
        bool animalId,
        bool phenotypeTraitId,
        bool selectedOptionId,
      })
    >;
typedef $$BreedingPairingsTableCreateCompanionBuilder =
    BreedingPairingsCompanion Function({
      Value<String> id,
      required String speciesId,
      required String sireId,
      required String damId,
      Value<DateTime?> pairingDate,
      Value<String> status,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$BreedingPairingsTableUpdateCompanionBuilder =
    BreedingPairingsCompanion Function({
      Value<String> id,
      Value<String> speciesId,
      Value<String> sireId,
      Value<String> damId,
      Value<DateTime?> pairingDate,
      Value<String> status,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

final class $$BreedingPairingsTableReferences
    extends
        BaseReferences<_$AppDatabase, $BreedingPairingsTable, BreedingPairing> {
  $$BreedingPairingsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SpeciesTable _speciesIdTable(_$AppDatabase db) =>
      db.species.createAlias(
        $_aliasNameGenerator(db.breedingPairings.speciesId, db.species.id),
      );

  $$SpeciesTableProcessedTableManager get speciesId {
    final $_column = $_itemColumn<String>('species_id')!;

    final manager = $$SpeciesTableTableManager(
      $_db,
      $_db.species,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_speciesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AnimalsTable _sireIdTable(_$AppDatabase db) => db.animals.createAlias(
    $_aliasNameGenerator(db.breedingPairings.sireId, db.animals.id),
  );

  $$AnimalsTableProcessedTableManager get sireId {
    final $_column = $_itemColumn<String>('sire_id')!;

    final manager = $$AnimalsTableTableManager(
      $_db,
      $_db.animals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sireIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AnimalsTable _damIdTable(_$AppDatabase db) => db.animals.createAlias(
    $_aliasNameGenerator(db.breedingPairings.damId, db.animals.id),
  );

  $$AnimalsTableProcessedTableManager get damId {
    final $_column = $_itemColumn<String>('dam_id')!;

    final manager = $$AnimalsTableTableManager(
      $_db,
      $_db.animals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_damIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $BreedingPredictionsTable,
    List<BreedingPrediction>
  >
  _breedingPredictionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.breedingPredictions,
        aliasName: $_aliasNameGenerator(
          db.breedingPairings.id,
          db.breedingPredictions.pairingId,
        ),
      );

  $$BreedingPredictionsTableProcessedTableManager get breedingPredictionsRefs {
    final manager = $$BreedingPredictionsTableTableManager(
      $_db,
      $_db.breedingPredictions,
    ).filter((f) => f.pairingId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _breedingPredictionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BreedingEventsTable, List<BreedingEvent>>
  _breedingEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.breedingEvents,
    aliasName: $_aliasNameGenerator(
      db.breedingPairings.id,
      db.breedingEvents.pairingId,
    ),
  );

  $$BreedingEventsTableProcessedTableManager get breedingEventsRefs {
    final manager = $$BreedingEventsTableTableManager(
      $_db,
      $_db.breedingEvents,
    ).filter((f) => f.pairingId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_breedingEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TraitPredictionsTable, List<TraitPrediction>>
  _traitPredictionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.traitPredictions,
    aliasName: $_aliasNameGenerator(
      db.breedingPairings.id,
      db.traitPredictions.pairingId,
    ),
  );

  $$TraitPredictionsTableProcessedTableManager get traitPredictionsRefs {
    final manager = $$TraitPredictionsTableTableManager(
      $_db,
      $_db.traitPredictions,
    ).filter((f) => f.pairingId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _traitPredictionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BreedingPairingsTableFilterComposer
    extends Composer<_$AppDatabase, $BreedingPairingsTable> {
  $$BreedingPairingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get pairingDate => $composableBuilder(
    column: $table.pairingDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SpeciesTableFilterComposer get speciesId {
    final $$SpeciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableFilterComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableFilterComposer get sireId {
    final $$AnimalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sireId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableFilterComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableFilterComposer get damId {
    final $$AnimalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.damId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableFilterComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> breedingPredictionsRefs(
    Expression<bool> Function($$BreedingPredictionsTableFilterComposer f) f,
  ) {
    final $$BreedingPredictionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.breedingPredictions,
      getReferencedColumn: (t) => t.pairingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingPredictionsTableFilterComposer(
            $db: $db,
            $table: $db.breedingPredictions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> breedingEventsRefs(
    Expression<bool> Function($$BreedingEventsTableFilterComposer f) f,
  ) {
    final $$BreedingEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.breedingEvents,
      getReferencedColumn: (t) => t.pairingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingEventsTableFilterComposer(
            $db: $db,
            $table: $db.breedingEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> traitPredictionsRefs(
    Expression<bool> Function($$TraitPredictionsTableFilterComposer f) f,
  ) {
    final $$TraitPredictionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.traitPredictions,
      getReferencedColumn: (t) => t.pairingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitPredictionsTableFilterComposer(
            $db: $db,
            $table: $db.traitPredictions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BreedingPairingsTableOrderingComposer
    extends Composer<_$AppDatabase, $BreedingPairingsTable> {
  $$BreedingPairingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get pairingDate => $composableBuilder(
    column: $table.pairingDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SpeciesTableOrderingComposer get speciesId {
    final $$SpeciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableOrderingComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableOrderingComposer get sireId {
    final $$AnimalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sireId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableOrderingComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableOrderingComposer get damId {
    final $$AnimalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.damId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableOrderingComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BreedingPairingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BreedingPairingsTable> {
  $$BreedingPairingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get pairingDate => $composableBuilder(
    column: $table.pairingDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$SpeciesTableAnnotationComposer get speciesId {
    final $$SpeciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableAnnotationComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableAnnotationComposer get sireId {
    final $$AnimalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sireId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableAnnotationComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableAnnotationComposer get damId {
    final $$AnimalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.damId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableAnnotationComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> breedingPredictionsRefs<T extends Object>(
    Expression<T> Function($$BreedingPredictionsTableAnnotationComposer a) f,
  ) {
    final $$BreedingPredictionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.breedingPredictions,
          getReferencedColumn: (t) => t.pairingId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BreedingPredictionsTableAnnotationComposer(
                $db: $db,
                $table: $db.breedingPredictions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> breedingEventsRefs<T extends Object>(
    Expression<T> Function($$BreedingEventsTableAnnotationComposer a) f,
  ) {
    final $$BreedingEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.breedingEvents,
      getReferencedColumn: (t) => t.pairingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.breedingEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> traitPredictionsRefs<T extends Object>(
    Expression<T> Function($$TraitPredictionsTableAnnotationComposer a) f,
  ) {
    final $$TraitPredictionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.traitPredictions,
      getReferencedColumn: (t) => t.pairingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitPredictionsTableAnnotationComposer(
            $db: $db,
            $table: $db.traitPredictions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BreedingPairingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BreedingPairingsTable,
          BreedingPairing,
          $$BreedingPairingsTableFilterComposer,
          $$BreedingPairingsTableOrderingComposer,
          $$BreedingPairingsTableAnnotationComposer,
          $$BreedingPairingsTableCreateCompanionBuilder,
          $$BreedingPairingsTableUpdateCompanionBuilder,
          (BreedingPairing, $$BreedingPairingsTableReferences),
          BreedingPairing,
          PrefetchHooks Function({
            bool speciesId,
            bool sireId,
            bool damId,
            bool breedingPredictionsRefs,
            bool breedingEventsRefs,
            bool traitPredictionsRefs,
          })
        > {
  $$BreedingPairingsTableTableManager(
    _$AppDatabase db,
    $BreedingPairingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BreedingPairingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BreedingPairingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BreedingPairingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> speciesId = const Value.absent(),
                Value<String> sireId = const Value.absent(),
                Value<String> damId = const Value.absent(),
                Value<DateTime?> pairingDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BreedingPairingsCompanion(
                id: id,
                speciesId: speciesId,
                sireId: sireId,
                damId: damId,
                pairingDate: pairingDate,
                status: status,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String speciesId,
                required String sireId,
                required String damId,
                Value<DateTime?> pairingDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BreedingPairingsCompanion.insert(
                id: id,
                speciesId: speciesId,
                sireId: sireId,
                damId: damId,
                pairingDate: pairingDate,
                status: status,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BreedingPairingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                speciesId = false,
                sireId = false,
                damId = false,
                breedingPredictionsRefs = false,
                breedingEventsRefs = false,
                traitPredictionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (breedingPredictionsRefs) db.breedingPredictions,
                    if (breedingEventsRefs) db.breedingEvents,
                    if (traitPredictionsRefs) db.traitPredictions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (speciesId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.speciesId,
                                    referencedTable:
                                        $$BreedingPairingsTableReferences
                                            ._speciesIdTable(db),
                                    referencedColumn:
                                        $$BreedingPairingsTableReferences
                                            ._speciesIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (sireId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sireId,
                                    referencedTable:
                                        $$BreedingPairingsTableReferences
                                            ._sireIdTable(db),
                                    referencedColumn:
                                        $$BreedingPairingsTableReferences
                                            ._sireIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (damId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.damId,
                                    referencedTable:
                                        $$BreedingPairingsTableReferences
                                            ._damIdTable(db),
                                    referencedColumn:
                                        $$BreedingPairingsTableReferences
                                            ._damIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (breedingPredictionsRefs)
                        await $_getPrefetchedData<
                          BreedingPairing,
                          $BreedingPairingsTable,
                          BreedingPrediction
                        >(
                          currentTable: table,
                          referencedTable: $$BreedingPairingsTableReferences
                              ._breedingPredictionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BreedingPairingsTableReferences(
                                db,
                                table,
                                p0,
                              ).breedingPredictionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pairingId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (breedingEventsRefs)
                        await $_getPrefetchedData<
                          BreedingPairing,
                          $BreedingPairingsTable,
                          BreedingEvent
                        >(
                          currentTable: table,
                          referencedTable: $$BreedingPairingsTableReferences
                              ._breedingEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BreedingPairingsTableReferences(
                                db,
                                table,
                                p0,
                              ).breedingEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pairingId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (traitPredictionsRefs)
                        await $_getPrefetchedData<
                          BreedingPairing,
                          $BreedingPairingsTable,
                          TraitPrediction
                        >(
                          currentTable: table,
                          referencedTable: $$BreedingPairingsTableReferences
                              ._traitPredictionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BreedingPairingsTableReferences(
                                db,
                                table,
                                p0,
                              ).traitPredictionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pairingId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$BreedingPairingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BreedingPairingsTable,
      BreedingPairing,
      $$BreedingPairingsTableFilterComposer,
      $$BreedingPairingsTableOrderingComposer,
      $$BreedingPairingsTableAnnotationComposer,
      $$BreedingPairingsTableCreateCompanionBuilder,
      $$BreedingPairingsTableUpdateCompanionBuilder,
      (BreedingPairing, $$BreedingPairingsTableReferences),
      BreedingPairing,
      PrefetchHooks Function({
        bool speciesId,
        bool sireId,
        bool damId,
        bool breedingPredictionsRefs,
        bool breedingEventsRefs,
        bool traitPredictionsRefs,
      })
    >;
typedef $$BreedingPredictionsTableCreateCompanionBuilder =
    BreedingPredictionsCompanion Function({
      Value<String> id,
      required String pairingId,
      Value<DateTime> computedAt,
      required String resultJson,
      Value<int> rowid,
    });
typedef $$BreedingPredictionsTableUpdateCompanionBuilder =
    BreedingPredictionsCompanion Function({
      Value<String> id,
      Value<String> pairingId,
      Value<DateTime> computedAt,
      Value<String> resultJson,
      Value<int> rowid,
    });

final class $$BreedingPredictionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $BreedingPredictionsTable,
          BreedingPrediction
        > {
  $$BreedingPredictionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BreedingPairingsTable _pairingIdTable(_$AppDatabase db) =>
      db.breedingPairings.createAlias(
        $_aliasNameGenerator(
          db.breedingPredictions.pairingId,
          db.breedingPairings.id,
        ),
      );

  $$BreedingPairingsTableProcessedTableManager get pairingId {
    final $_column = $_itemColumn<String>('pairing_id')!;

    final manager = $$BreedingPairingsTableTableManager(
      $_db,
      $_db.breedingPairings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pairingIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BreedingPredictionsTableFilterComposer
    extends Composer<_$AppDatabase, $BreedingPredictionsTable> {
  $$BreedingPredictionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get computedAt => $composableBuilder(
    column: $table.computedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resultJson => $composableBuilder(
    column: $table.resultJson,
    builder: (column) => ColumnFilters(column),
  );

  $$BreedingPairingsTableFilterComposer get pairingId {
    final $$BreedingPairingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pairingId,
      referencedTable: $db.breedingPairings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingPairingsTableFilterComposer(
            $db: $db,
            $table: $db.breedingPairings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BreedingPredictionsTableOrderingComposer
    extends Composer<_$AppDatabase, $BreedingPredictionsTable> {
  $$BreedingPredictionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get computedAt => $composableBuilder(
    column: $table.computedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resultJson => $composableBuilder(
    column: $table.resultJson,
    builder: (column) => ColumnOrderings(column),
  );

  $$BreedingPairingsTableOrderingComposer get pairingId {
    final $$BreedingPairingsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pairingId,
      referencedTable: $db.breedingPairings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingPairingsTableOrderingComposer(
            $db: $db,
            $table: $db.breedingPairings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BreedingPredictionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BreedingPredictionsTable> {
  $$BreedingPredictionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get computedAt => $composableBuilder(
    column: $table.computedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get resultJson => $composableBuilder(
    column: $table.resultJson,
    builder: (column) => column,
  );

  $$BreedingPairingsTableAnnotationComposer get pairingId {
    final $$BreedingPairingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pairingId,
      referencedTable: $db.breedingPairings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingPairingsTableAnnotationComposer(
            $db: $db,
            $table: $db.breedingPairings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BreedingPredictionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BreedingPredictionsTable,
          BreedingPrediction,
          $$BreedingPredictionsTableFilterComposer,
          $$BreedingPredictionsTableOrderingComposer,
          $$BreedingPredictionsTableAnnotationComposer,
          $$BreedingPredictionsTableCreateCompanionBuilder,
          $$BreedingPredictionsTableUpdateCompanionBuilder,
          (BreedingPrediction, $$BreedingPredictionsTableReferences),
          BreedingPrediction,
          PrefetchHooks Function({bool pairingId})
        > {
  $$BreedingPredictionsTableTableManager(
    _$AppDatabase db,
    $BreedingPredictionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BreedingPredictionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BreedingPredictionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$BreedingPredictionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> pairingId = const Value.absent(),
                Value<DateTime> computedAt = const Value.absent(),
                Value<String> resultJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BreedingPredictionsCompanion(
                id: id,
                pairingId: pairingId,
                computedAt: computedAt,
                resultJson: resultJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String pairingId,
                Value<DateTime> computedAt = const Value.absent(),
                required String resultJson,
                Value<int> rowid = const Value.absent(),
              }) => BreedingPredictionsCompanion.insert(
                id: id,
                pairingId: pairingId,
                computedAt: computedAt,
                resultJson: resultJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BreedingPredictionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pairingId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (pairingId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.pairingId,
                                referencedTable:
                                    $$BreedingPredictionsTableReferences
                                        ._pairingIdTable(db),
                                referencedColumn:
                                    $$BreedingPredictionsTableReferences
                                        ._pairingIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BreedingPredictionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BreedingPredictionsTable,
      BreedingPrediction,
      $$BreedingPredictionsTableFilterComposer,
      $$BreedingPredictionsTableOrderingComposer,
      $$BreedingPredictionsTableAnnotationComposer,
      $$BreedingPredictionsTableCreateCompanionBuilder,
      $$BreedingPredictionsTableUpdateCompanionBuilder,
      (BreedingPrediction, $$BreedingPredictionsTableReferences),
      BreedingPrediction,
      PrefetchHooks Function({bool pairingId})
    >;
typedef $$BreedingEventsTableCreateCompanionBuilder =
    BreedingEventsCompanion Function({
      Value<String> id,
      required String pairingId,
      required DateTime eventDate,
      Value<DateTime?> expectedOffspringDate,
      Value<DateTime?> actualOffspringDate,
      Value<String> status,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$BreedingEventsTableUpdateCompanionBuilder =
    BreedingEventsCompanion Function({
      Value<String> id,
      Value<String> pairingId,
      Value<DateTime> eventDate,
      Value<DateTime?> expectedOffspringDate,
      Value<DateTime?> actualOffspringDate,
      Value<String> status,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$BreedingEventsTableReferences
    extends BaseReferences<_$AppDatabase, $BreedingEventsTable, BreedingEvent> {
  $$BreedingEventsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BreedingPairingsTable _pairingIdTable(_$AppDatabase db) =>
      db.breedingPairings.createAlias(
        $_aliasNameGenerator(
          db.breedingEvents.pairingId,
          db.breedingPairings.id,
        ),
      );

  $$BreedingPairingsTableProcessedTableManager get pairingId {
    final $_column = $_itemColumn<String>('pairing_id')!;

    final manager = $$BreedingPairingsTableTableManager(
      $_db,
      $_db.breedingPairings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pairingIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$OffspringTable, List<OffspringRecord>>
  _offspringRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.offspring,
    aliasName: $_aliasNameGenerator(
      db.breedingEvents.id,
      db.offspring.breedingEventId,
    ),
  );

  $$OffspringTableProcessedTableManager get offspringRefs {
    final manager = $$OffspringTableTableManager($_db, $_db.offspring).filter(
      (f) => f.breedingEventId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_offspringRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BreedingEventsTableFilterComposer
    extends Composer<_$AppDatabase, $BreedingEventsTable> {
  $$BreedingEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get eventDate => $composableBuilder(
    column: $table.eventDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expectedOffspringDate => $composableBuilder(
    column: $table.expectedOffspringDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get actualOffspringDate => $composableBuilder(
    column: $table.actualOffspringDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$BreedingPairingsTableFilterComposer get pairingId {
    final $$BreedingPairingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pairingId,
      referencedTable: $db.breedingPairings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingPairingsTableFilterComposer(
            $db: $db,
            $table: $db.breedingPairings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> offspringRefs(
    Expression<bool> Function($$OffspringTableFilterComposer f) f,
  ) {
    final $$OffspringTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.offspring,
      getReferencedColumn: (t) => t.breedingEventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OffspringTableFilterComposer(
            $db: $db,
            $table: $db.offspring,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BreedingEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $BreedingEventsTable> {
  $$BreedingEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get eventDate => $composableBuilder(
    column: $table.eventDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expectedOffspringDate => $composableBuilder(
    column: $table.expectedOffspringDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actualOffspringDate => $composableBuilder(
    column: $table.actualOffspringDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$BreedingPairingsTableOrderingComposer get pairingId {
    final $$BreedingPairingsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pairingId,
      referencedTable: $db.breedingPairings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingPairingsTableOrderingComposer(
            $db: $db,
            $table: $db.breedingPairings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BreedingEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BreedingEventsTable> {
  $$BreedingEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get eventDate =>
      $composableBuilder(column: $table.eventDate, builder: (column) => column);

  GeneratedColumn<DateTime> get expectedOffspringDate => $composableBuilder(
    column: $table.expectedOffspringDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get actualOffspringDate => $composableBuilder(
    column: $table.actualOffspringDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$BreedingPairingsTableAnnotationComposer get pairingId {
    final $$BreedingPairingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pairingId,
      referencedTable: $db.breedingPairings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingPairingsTableAnnotationComposer(
            $db: $db,
            $table: $db.breedingPairings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> offspringRefs<T extends Object>(
    Expression<T> Function($$OffspringTableAnnotationComposer a) f,
  ) {
    final $$OffspringTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.offspring,
      getReferencedColumn: (t) => t.breedingEventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OffspringTableAnnotationComposer(
            $db: $db,
            $table: $db.offspring,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BreedingEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BreedingEventsTable,
          BreedingEvent,
          $$BreedingEventsTableFilterComposer,
          $$BreedingEventsTableOrderingComposer,
          $$BreedingEventsTableAnnotationComposer,
          $$BreedingEventsTableCreateCompanionBuilder,
          $$BreedingEventsTableUpdateCompanionBuilder,
          (BreedingEvent, $$BreedingEventsTableReferences),
          BreedingEvent,
          PrefetchHooks Function({bool pairingId, bool offspringRefs})
        > {
  $$BreedingEventsTableTableManager(
    _$AppDatabase db,
    $BreedingEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BreedingEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BreedingEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BreedingEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> pairingId = const Value.absent(),
                Value<DateTime> eventDate = const Value.absent(),
                Value<DateTime?> expectedOffspringDate = const Value.absent(),
                Value<DateTime?> actualOffspringDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BreedingEventsCompanion(
                id: id,
                pairingId: pairingId,
                eventDate: eventDate,
                expectedOffspringDate: expectedOffspringDate,
                actualOffspringDate: actualOffspringDate,
                status: status,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String pairingId,
                required DateTime eventDate,
                Value<DateTime?> expectedOffspringDate = const Value.absent(),
                Value<DateTime?> actualOffspringDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BreedingEventsCompanion.insert(
                id: id,
                pairingId: pairingId,
                eventDate: eventDate,
                expectedOffspringDate: expectedOffspringDate,
                actualOffspringDate: actualOffspringDate,
                status: status,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BreedingEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pairingId = false, offspringRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (offspringRefs) db.offspring],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (pairingId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.pairingId,
                                referencedTable: $$BreedingEventsTableReferences
                                    ._pairingIdTable(db),
                                referencedColumn:
                                    $$BreedingEventsTableReferences
                                        ._pairingIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (offspringRefs)
                    await $_getPrefetchedData<
                      BreedingEvent,
                      $BreedingEventsTable,
                      OffspringRecord
                    >(
                      currentTable: table,
                      referencedTable: $$BreedingEventsTableReferences
                          ._offspringRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$BreedingEventsTableReferences(
                            db,
                            table,
                            p0,
                          ).offspringRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.breedingEventId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BreedingEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BreedingEventsTable,
      BreedingEvent,
      $$BreedingEventsTableFilterComposer,
      $$BreedingEventsTableOrderingComposer,
      $$BreedingEventsTableAnnotationComposer,
      $$BreedingEventsTableCreateCompanionBuilder,
      $$BreedingEventsTableUpdateCompanionBuilder,
      (BreedingEvent, $$BreedingEventsTableReferences),
      BreedingEvent,
      PrefetchHooks Function({bool pairingId, bool offspringRefs})
    >;
typedef $$OffspringTableCreateCompanionBuilder =
    OffspringCompanion Function({
      Value<String> id,
      required String breedingEventId,
      Value<String?> animalId,
      Value<int?> sequenceNumber,
      Value<String?> predictedSex,
      Value<String?> predictedPhenotype,
      Value<String?> actualOutcome,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$OffspringTableUpdateCompanionBuilder =
    OffspringCompanion Function({
      Value<String> id,
      Value<String> breedingEventId,
      Value<String?> animalId,
      Value<int?> sequenceNumber,
      Value<String?> predictedSex,
      Value<String?> predictedPhenotype,
      Value<String?> actualOutcome,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$OffspringTableReferences
    extends BaseReferences<_$AppDatabase, $OffspringTable, OffspringRecord> {
  $$OffspringTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BreedingEventsTable _breedingEventIdTable(_$AppDatabase db) =>
      db.breedingEvents.createAlias(
        $_aliasNameGenerator(
          db.offspring.breedingEventId,
          db.breedingEvents.id,
        ),
      );

  $$BreedingEventsTableProcessedTableManager get breedingEventId {
    final $_column = $_itemColumn<String>('breeding_event_id')!;

    final manager = $$BreedingEventsTableTableManager(
      $_db,
      $_db.breedingEvents,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_breedingEventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AnimalsTable _animalIdTable(_$AppDatabase db) => db.animals
      .createAlias($_aliasNameGenerator(db.offspring.animalId, db.animals.id));

  $$AnimalsTableProcessedTableManager? get animalId {
    final $_column = $_itemColumn<String>('animal_id');
    if ($_column == null) return null;
    final manager = $$AnimalsTableTableManager(
      $_db,
      $_db.animals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_animalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$OffspringTableFilterComposer
    extends Composer<_$AppDatabase, $OffspringTable> {
  $$OffspringTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sequenceNumber => $composableBuilder(
    column: $table.sequenceNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get predictedSex => $composableBuilder(
    column: $table.predictedSex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get predictedPhenotype => $composableBuilder(
    column: $table.predictedPhenotype,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actualOutcome => $composableBuilder(
    column: $table.actualOutcome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$BreedingEventsTableFilterComposer get breedingEventId {
    final $$BreedingEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.breedingEventId,
      referencedTable: $db.breedingEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingEventsTableFilterComposer(
            $db: $db,
            $table: $db.breedingEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableFilterComposer get animalId {
    final $$AnimalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.animalId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableFilterComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OffspringTableOrderingComposer
    extends Composer<_$AppDatabase, $OffspringTable> {
  $$OffspringTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sequenceNumber => $composableBuilder(
    column: $table.sequenceNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get predictedSex => $composableBuilder(
    column: $table.predictedSex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get predictedPhenotype => $composableBuilder(
    column: $table.predictedPhenotype,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actualOutcome => $composableBuilder(
    column: $table.actualOutcome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$BreedingEventsTableOrderingComposer get breedingEventId {
    final $$BreedingEventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.breedingEventId,
      referencedTable: $db.breedingEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingEventsTableOrderingComposer(
            $db: $db,
            $table: $db.breedingEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableOrderingComposer get animalId {
    final $$AnimalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.animalId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableOrderingComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OffspringTableAnnotationComposer
    extends Composer<_$AppDatabase, $OffspringTable> {
  $$OffspringTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sequenceNumber => $composableBuilder(
    column: $table.sequenceNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get predictedSex => $composableBuilder(
    column: $table.predictedSex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get predictedPhenotype => $composableBuilder(
    column: $table.predictedPhenotype,
    builder: (column) => column,
  );

  GeneratedColumn<String> get actualOutcome => $composableBuilder(
    column: $table.actualOutcome,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$BreedingEventsTableAnnotationComposer get breedingEventId {
    final $$BreedingEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.breedingEventId,
      referencedTable: $db.breedingEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.breedingEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnimalsTableAnnotationComposer get animalId {
    final $$AnimalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.animalId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableAnnotationComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OffspringTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OffspringTable,
          OffspringRecord,
          $$OffspringTableFilterComposer,
          $$OffspringTableOrderingComposer,
          $$OffspringTableAnnotationComposer,
          $$OffspringTableCreateCompanionBuilder,
          $$OffspringTableUpdateCompanionBuilder,
          (OffspringRecord, $$OffspringTableReferences),
          OffspringRecord,
          PrefetchHooks Function({bool breedingEventId, bool animalId})
        > {
  $$OffspringTableTableManager(_$AppDatabase db, $OffspringTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OffspringTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OffspringTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OffspringTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> breedingEventId = const Value.absent(),
                Value<String?> animalId = const Value.absent(),
                Value<int?> sequenceNumber = const Value.absent(),
                Value<String?> predictedSex = const Value.absent(),
                Value<String?> predictedPhenotype = const Value.absent(),
                Value<String?> actualOutcome = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OffspringCompanion(
                id: id,
                breedingEventId: breedingEventId,
                animalId: animalId,
                sequenceNumber: sequenceNumber,
                predictedSex: predictedSex,
                predictedPhenotype: predictedPhenotype,
                actualOutcome: actualOutcome,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String breedingEventId,
                Value<String?> animalId = const Value.absent(),
                Value<int?> sequenceNumber = const Value.absent(),
                Value<String?> predictedSex = const Value.absent(),
                Value<String?> predictedPhenotype = const Value.absent(),
                Value<String?> actualOutcome = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OffspringCompanion.insert(
                id: id,
                breedingEventId: breedingEventId,
                animalId: animalId,
                sequenceNumber: sequenceNumber,
                predictedSex: predictedSex,
                predictedPhenotype: predictedPhenotype,
                actualOutcome: actualOutcome,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OffspringTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({breedingEventId = false, animalId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (breedingEventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.breedingEventId,
                                referencedTable: $$OffspringTableReferences
                                    ._breedingEventIdTable(db),
                                referencedColumn: $$OffspringTableReferences
                                    ._breedingEventIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (animalId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.animalId,
                                referencedTable: $$OffspringTableReferences
                                    ._animalIdTable(db),
                                referencedColumn: $$OffspringTableReferences
                                    ._animalIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$OffspringTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OffspringTable,
      OffspringRecord,
      $$OffspringTableFilterComposer,
      $$OffspringTableOrderingComposer,
      $$OffspringTableAnnotationComposer,
      $$OffspringTableCreateCompanionBuilder,
      $$OffspringTableUpdateCompanionBuilder,
      (OffspringRecord, $$OffspringTableReferences),
      OffspringRecord,
      PrefetchHooks Function({bool breedingEventId, bool animalId})
    >;
typedef $$TraitDefinitionsTableCreateCompanionBuilder =
    TraitDefinitionsCompanion Function({
      Value<String> id,
      required String speciesId,
      required String key,
      required String name,
      required String unit,
      required String measurementPeriod,
      Value<double?> heritabilityEstimate,
      Value<int> rowid,
    });
typedef $$TraitDefinitionsTableUpdateCompanionBuilder =
    TraitDefinitionsCompanion Function({
      Value<String> id,
      Value<String> speciesId,
      Value<String> key,
      Value<String> name,
      Value<String> unit,
      Value<String> measurementPeriod,
      Value<double?> heritabilityEstimate,
      Value<int> rowid,
    });

final class $$TraitDefinitionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $TraitDefinitionsTable, TraitDefinition> {
  $$TraitDefinitionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SpeciesTable _speciesIdTable(_$AppDatabase db) =>
      db.species.createAlias(
        $_aliasNameGenerator(db.traitDefinitions.speciesId, db.species.id),
      );

  $$SpeciesTableProcessedTableManager get speciesId {
    final $_column = $_itemColumn<String>('species_id')!;

    final manager = $$SpeciesTableTableManager(
      $_db,
      $_db.species,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_speciesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TraitRecordsTable, List<TraitRecord>>
  _traitRecordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.traitRecords,
    aliasName: $_aliasNameGenerator(
      db.traitDefinitions.id,
      db.traitRecords.traitDefinitionId,
    ),
  );

  $$TraitRecordsTableProcessedTableManager get traitRecordsRefs {
    final manager = $$TraitRecordsTableTableManager($_db, $_db.traitRecords)
        .filter(
          (f) => f.traitDefinitionId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_traitRecordsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TraitPredictionsTable, List<TraitPrediction>>
  _traitPredictionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.traitPredictions,
    aliasName: $_aliasNameGenerator(
      db.traitDefinitions.id,
      db.traitPredictions.traitDefinitionId,
    ),
  );

  $$TraitPredictionsTableProcessedTableManager get traitPredictionsRefs {
    final manager =
        $$TraitPredictionsTableTableManager($_db, $_db.traitPredictions).filter(
          (f) => f.traitDefinitionId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _traitPredictionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TraitDefinitionsTableFilterComposer
    extends Composer<_$AppDatabase, $TraitDefinitionsTable> {
  $$TraitDefinitionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get measurementPeriod => $composableBuilder(
    column: $table.measurementPeriod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get heritabilityEstimate => $composableBuilder(
    column: $table.heritabilityEstimate,
    builder: (column) => ColumnFilters(column),
  );

  $$SpeciesTableFilterComposer get speciesId {
    final $$SpeciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableFilterComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> traitRecordsRefs(
    Expression<bool> Function($$TraitRecordsTableFilterComposer f) f,
  ) {
    final $$TraitRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.traitRecords,
      getReferencedColumn: (t) => t.traitDefinitionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitRecordsTableFilterComposer(
            $db: $db,
            $table: $db.traitRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> traitPredictionsRefs(
    Expression<bool> Function($$TraitPredictionsTableFilterComposer f) f,
  ) {
    final $$TraitPredictionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.traitPredictions,
      getReferencedColumn: (t) => t.traitDefinitionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitPredictionsTableFilterComposer(
            $db: $db,
            $table: $db.traitPredictions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TraitDefinitionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TraitDefinitionsTable> {
  $$TraitDefinitionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get measurementPeriod => $composableBuilder(
    column: $table.measurementPeriod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get heritabilityEstimate => $composableBuilder(
    column: $table.heritabilityEstimate,
    builder: (column) => ColumnOrderings(column),
  );

  $$SpeciesTableOrderingComposer get speciesId {
    final $$SpeciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableOrderingComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TraitDefinitionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TraitDefinitionsTable> {
  $$TraitDefinitionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get measurementPeriod => $composableBuilder(
    column: $table.measurementPeriod,
    builder: (column) => column,
  );

  GeneratedColumn<double> get heritabilityEstimate => $composableBuilder(
    column: $table.heritabilityEstimate,
    builder: (column) => column,
  );

  $$SpeciesTableAnnotationComposer get speciesId {
    final $$SpeciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableAnnotationComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> traitRecordsRefs<T extends Object>(
    Expression<T> Function($$TraitRecordsTableAnnotationComposer a) f,
  ) {
    final $$TraitRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.traitRecords,
      getReferencedColumn: (t) => t.traitDefinitionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.traitRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> traitPredictionsRefs<T extends Object>(
    Expression<T> Function($$TraitPredictionsTableAnnotationComposer a) f,
  ) {
    final $$TraitPredictionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.traitPredictions,
      getReferencedColumn: (t) => t.traitDefinitionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitPredictionsTableAnnotationComposer(
            $db: $db,
            $table: $db.traitPredictions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TraitDefinitionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TraitDefinitionsTable,
          TraitDefinition,
          $$TraitDefinitionsTableFilterComposer,
          $$TraitDefinitionsTableOrderingComposer,
          $$TraitDefinitionsTableAnnotationComposer,
          $$TraitDefinitionsTableCreateCompanionBuilder,
          $$TraitDefinitionsTableUpdateCompanionBuilder,
          (TraitDefinition, $$TraitDefinitionsTableReferences),
          TraitDefinition,
          PrefetchHooks Function({
            bool speciesId,
            bool traitRecordsRefs,
            bool traitPredictionsRefs,
          })
        > {
  $$TraitDefinitionsTableTableManager(
    _$AppDatabase db,
    $TraitDefinitionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TraitDefinitionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TraitDefinitionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TraitDefinitionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> speciesId = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<String> measurementPeriod = const Value.absent(),
                Value<double?> heritabilityEstimate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TraitDefinitionsCompanion(
                id: id,
                speciesId: speciesId,
                key: key,
                name: name,
                unit: unit,
                measurementPeriod: measurementPeriod,
                heritabilityEstimate: heritabilityEstimate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String speciesId,
                required String key,
                required String name,
                required String unit,
                required String measurementPeriod,
                Value<double?> heritabilityEstimate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TraitDefinitionsCompanion.insert(
                id: id,
                speciesId: speciesId,
                key: key,
                name: name,
                unit: unit,
                measurementPeriod: measurementPeriod,
                heritabilityEstimate: heritabilityEstimate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TraitDefinitionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                speciesId = false,
                traitRecordsRefs = false,
                traitPredictionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (traitRecordsRefs) db.traitRecords,
                    if (traitPredictionsRefs) db.traitPredictions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (speciesId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.speciesId,
                                    referencedTable:
                                        $$TraitDefinitionsTableReferences
                                            ._speciesIdTable(db),
                                    referencedColumn:
                                        $$TraitDefinitionsTableReferences
                                            ._speciesIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (traitRecordsRefs)
                        await $_getPrefetchedData<
                          TraitDefinition,
                          $TraitDefinitionsTable,
                          TraitRecord
                        >(
                          currentTable: table,
                          referencedTable: $$TraitDefinitionsTableReferences
                              ._traitRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TraitDefinitionsTableReferences(
                                db,
                                table,
                                p0,
                              ).traitRecordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.traitDefinitionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (traitPredictionsRefs)
                        await $_getPrefetchedData<
                          TraitDefinition,
                          $TraitDefinitionsTable,
                          TraitPrediction
                        >(
                          currentTable: table,
                          referencedTable: $$TraitDefinitionsTableReferences
                              ._traitPredictionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TraitDefinitionsTableReferences(
                                db,
                                table,
                                p0,
                              ).traitPredictionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.traitDefinitionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TraitDefinitionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TraitDefinitionsTable,
      TraitDefinition,
      $$TraitDefinitionsTableFilterComposer,
      $$TraitDefinitionsTableOrderingComposer,
      $$TraitDefinitionsTableAnnotationComposer,
      $$TraitDefinitionsTableCreateCompanionBuilder,
      $$TraitDefinitionsTableUpdateCompanionBuilder,
      (TraitDefinition, $$TraitDefinitionsTableReferences),
      TraitDefinition,
      PrefetchHooks Function({
        bool speciesId,
        bool traitRecordsRefs,
        bool traitPredictionsRefs,
      })
    >;
typedef $$TraitRecordsTableCreateCompanionBuilder =
    TraitRecordsCompanion Function({
      Value<String> id,
      required String animalId,
      required String traitDefinitionId,
      required DateTime recordedDate,
      required double value,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$TraitRecordsTableUpdateCompanionBuilder =
    TraitRecordsCompanion Function({
      Value<String> id,
      Value<String> animalId,
      Value<String> traitDefinitionId,
      Value<DateTime> recordedDate,
      Value<double> value,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$TraitRecordsTableReferences
    extends BaseReferences<_$AppDatabase, $TraitRecordsTable, TraitRecord> {
  $$TraitRecordsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AnimalsTable _animalIdTable(_$AppDatabase db) =>
      db.animals.createAlias(
        $_aliasNameGenerator(db.traitRecords.animalId, db.animals.id),
      );

  $$AnimalsTableProcessedTableManager get animalId {
    final $_column = $_itemColumn<String>('animal_id')!;

    final manager = $$AnimalsTableTableManager(
      $_db,
      $_db.animals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_animalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TraitDefinitionsTable _traitDefinitionIdTable(_$AppDatabase db) =>
      db.traitDefinitions.createAlias(
        $_aliasNameGenerator(
          db.traitRecords.traitDefinitionId,
          db.traitDefinitions.id,
        ),
      );

  $$TraitDefinitionsTableProcessedTableManager get traitDefinitionId {
    final $_column = $_itemColumn<String>('trait_definition_id')!;

    final manager = $$TraitDefinitionsTableTableManager(
      $_db,
      $_db.traitDefinitions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_traitDefinitionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TraitRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $TraitRecordsTable> {
  $$TraitRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedDate => $composableBuilder(
    column: $table.recordedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AnimalsTableFilterComposer get animalId {
    final $$AnimalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.animalId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableFilterComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TraitDefinitionsTableFilterComposer get traitDefinitionId {
    final $$TraitDefinitionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitDefinitionId,
      referencedTable: $db.traitDefinitions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitDefinitionsTableFilterComposer(
            $db: $db,
            $table: $db.traitDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TraitRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $TraitRecordsTable> {
  $$TraitRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedDate => $composableBuilder(
    column: $table.recordedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AnimalsTableOrderingComposer get animalId {
    final $$AnimalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.animalId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableOrderingComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TraitDefinitionsTableOrderingComposer get traitDefinitionId {
    final $$TraitDefinitionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitDefinitionId,
      referencedTable: $db.traitDefinitions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitDefinitionsTableOrderingComposer(
            $db: $db,
            $table: $db.traitDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TraitRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TraitRecordsTable> {
  $$TraitRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedDate => $composableBuilder(
    column: $table.recordedDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$AnimalsTableAnnotationComposer get animalId {
    final $$AnimalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.animalId,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableAnnotationComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TraitDefinitionsTableAnnotationComposer get traitDefinitionId {
    final $$TraitDefinitionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitDefinitionId,
      referencedTable: $db.traitDefinitions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitDefinitionsTableAnnotationComposer(
            $db: $db,
            $table: $db.traitDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TraitRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TraitRecordsTable,
          TraitRecord,
          $$TraitRecordsTableFilterComposer,
          $$TraitRecordsTableOrderingComposer,
          $$TraitRecordsTableAnnotationComposer,
          $$TraitRecordsTableCreateCompanionBuilder,
          $$TraitRecordsTableUpdateCompanionBuilder,
          (TraitRecord, $$TraitRecordsTableReferences),
          TraitRecord,
          PrefetchHooks Function({bool animalId, bool traitDefinitionId})
        > {
  $$TraitRecordsTableTableManager(_$AppDatabase db, $TraitRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TraitRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TraitRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TraitRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> animalId = const Value.absent(),
                Value<String> traitDefinitionId = const Value.absent(),
                Value<DateTime> recordedDate = const Value.absent(),
                Value<double> value = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TraitRecordsCompanion(
                id: id,
                animalId: animalId,
                traitDefinitionId: traitDefinitionId,
                recordedDate: recordedDate,
                value: value,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String animalId,
                required String traitDefinitionId,
                required DateTime recordedDate,
                required double value,
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TraitRecordsCompanion.insert(
                id: id,
                animalId: animalId,
                traitDefinitionId: traitDefinitionId,
                recordedDate: recordedDate,
                value: value,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TraitRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({animalId = false, traitDefinitionId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (animalId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.animalId,
                                    referencedTable:
                                        $$TraitRecordsTableReferences
                                            ._animalIdTable(db),
                                    referencedColumn:
                                        $$TraitRecordsTableReferences
                                            ._animalIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (traitDefinitionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.traitDefinitionId,
                                    referencedTable:
                                        $$TraitRecordsTableReferences
                                            ._traitDefinitionIdTable(db),
                                    referencedColumn:
                                        $$TraitRecordsTableReferences
                                            ._traitDefinitionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$TraitRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TraitRecordsTable,
      TraitRecord,
      $$TraitRecordsTableFilterComposer,
      $$TraitRecordsTableOrderingComposer,
      $$TraitRecordsTableAnnotationComposer,
      $$TraitRecordsTableCreateCompanionBuilder,
      $$TraitRecordsTableUpdateCompanionBuilder,
      (TraitRecord, $$TraitRecordsTableReferences),
      TraitRecord,
      PrefetchHooks Function({bool animalId, bool traitDefinitionId})
    >;
typedef $$TraitPredictionsTableCreateCompanionBuilder =
    TraitPredictionsCompanion Function({
      Value<String> id,
      required String pairingId,
      required String traitDefinitionId,
      Value<DateTime> computedAt,
      required double predictedValue,
      Value<double?> predictedRangeLow,
      Value<double?> predictedRangeHigh,
      Value<String?> basis,
      Value<int> rowid,
    });
typedef $$TraitPredictionsTableUpdateCompanionBuilder =
    TraitPredictionsCompanion Function({
      Value<String> id,
      Value<String> pairingId,
      Value<String> traitDefinitionId,
      Value<DateTime> computedAt,
      Value<double> predictedValue,
      Value<double?> predictedRangeLow,
      Value<double?> predictedRangeHigh,
      Value<String?> basis,
      Value<int> rowid,
    });

final class $$TraitPredictionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $TraitPredictionsTable, TraitPrediction> {
  $$TraitPredictionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BreedingPairingsTable _pairingIdTable(_$AppDatabase db) =>
      db.breedingPairings.createAlias(
        $_aliasNameGenerator(
          db.traitPredictions.pairingId,
          db.breedingPairings.id,
        ),
      );

  $$BreedingPairingsTableProcessedTableManager get pairingId {
    final $_column = $_itemColumn<String>('pairing_id')!;

    final manager = $$BreedingPairingsTableTableManager(
      $_db,
      $_db.breedingPairings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pairingIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TraitDefinitionsTable _traitDefinitionIdTable(_$AppDatabase db) =>
      db.traitDefinitions.createAlias(
        $_aliasNameGenerator(
          db.traitPredictions.traitDefinitionId,
          db.traitDefinitions.id,
        ),
      );

  $$TraitDefinitionsTableProcessedTableManager get traitDefinitionId {
    final $_column = $_itemColumn<String>('trait_definition_id')!;

    final manager = $$TraitDefinitionsTableTableManager(
      $_db,
      $_db.traitDefinitions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_traitDefinitionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TraitPredictionsTableFilterComposer
    extends Composer<_$AppDatabase, $TraitPredictionsTable> {
  $$TraitPredictionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get computedAt => $composableBuilder(
    column: $table.computedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get predictedValue => $composableBuilder(
    column: $table.predictedValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get predictedRangeLow => $composableBuilder(
    column: $table.predictedRangeLow,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get predictedRangeHigh => $composableBuilder(
    column: $table.predictedRangeHigh,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get basis => $composableBuilder(
    column: $table.basis,
    builder: (column) => ColumnFilters(column),
  );

  $$BreedingPairingsTableFilterComposer get pairingId {
    final $$BreedingPairingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pairingId,
      referencedTable: $db.breedingPairings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingPairingsTableFilterComposer(
            $db: $db,
            $table: $db.breedingPairings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TraitDefinitionsTableFilterComposer get traitDefinitionId {
    final $$TraitDefinitionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitDefinitionId,
      referencedTable: $db.traitDefinitions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitDefinitionsTableFilterComposer(
            $db: $db,
            $table: $db.traitDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TraitPredictionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TraitPredictionsTable> {
  $$TraitPredictionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get computedAt => $composableBuilder(
    column: $table.computedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get predictedValue => $composableBuilder(
    column: $table.predictedValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get predictedRangeLow => $composableBuilder(
    column: $table.predictedRangeLow,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get predictedRangeHigh => $composableBuilder(
    column: $table.predictedRangeHigh,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get basis => $composableBuilder(
    column: $table.basis,
    builder: (column) => ColumnOrderings(column),
  );

  $$BreedingPairingsTableOrderingComposer get pairingId {
    final $$BreedingPairingsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pairingId,
      referencedTable: $db.breedingPairings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingPairingsTableOrderingComposer(
            $db: $db,
            $table: $db.breedingPairings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TraitDefinitionsTableOrderingComposer get traitDefinitionId {
    final $$TraitDefinitionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitDefinitionId,
      referencedTable: $db.traitDefinitions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitDefinitionsTableOrderingComposer(
            $db: $db,
            $table: $db.traitDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TraitPredictionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TraitPredictionsTable> {
  $$TraitPredictionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get computedAt => $composableBuilder(
    column: $table.computedAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get predictedValue => $composableBuilder(
    column: $table.predictedValue,
    builder: (column) => column,
  );

  GeneratedColumn<double> get predictedRangeLow => $composableBuilder(
    column: $table.predictedRangeLow,
    builder: (column) => column,
  );

  GeneratedColumn<double> get predictedRangeHigh => $composableBuilder(
    column: $table.predictedRangeHigh,
    builder: (column) => column,
  );

  GeneratedColumn<String> get basis =>
      $composableBuilder(column: $table.basis, builder: (column) => column);

  $$BreedingPairingsTableAnnotationComposer get pairingId {
    final $$BreedingPairingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pairingId,
      referencedTable: $db.breedingPairings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedingPairingsTableAnnotationComposer(
            $db: $db,
            $table: $db.breedingPairings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TraitDefinitionsTableAnnotationComposer get traitDefinitionId {
    final $$TraitDefinitionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.traitDefinitionId,
      referencedTable: $db.traitDefinitions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TraitDefinitionsTableAnnotationComposer(
            $db: $db,
            $table: $db.traitDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TraitPredictionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TraitPredictionsTable,
          TraitPrediction,
          $$TraitPredictionsTableFilterComposer,
          $$TraitPredictionsTableOrderingComposer,
          $$TraitPredictionsTableAnnotationComposer,
          $$TraitPredictionsTableCreateCompanionBuilder,
          $$TraitPredictionsTableUpdateCompanionBuilder,
          (TraitPrediction, $$TraitPredictionsTableReferences),
          TraitPrediction,
          PrefetchHooks Function({bool pairingId, bool traitDefinitionId})
        > {
  $$TraitPredictionsTableTableManager(
    _$AppDatabase db,
    $TraitPredictionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TraitPredictionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TraitPredictionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TraitPredictionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> pairingId = const Value.absent(),
                Value<String> traitDefinitionId = const Value.absent(),
                Value<DateTime> computedAt = const Value.absent(),
                Value<double> predictedValue = const Value.absent(),
                Value<double?> predictedRangeLow = const Value.absent(),
                Value<double?> predictedRangeHigh = const Value.absent(),
                Value<String?> basis = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TraitPredictionsCompanion(
                id: id,
                pairingId: pairingId,
                traitDefinitionId: traitDefinitionId,
                computedAt: computedAt,
                predictedValue: predictedValue,
                predictedRangeLow: predictedRangeLow,
                predictedRangeHigh: predictedRangeHigh,
                basis: basis,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String pairingId,
                required String traitDefinitionId,
                Value<DateTime> computedAt = const Value.absent(),
                required double predictedValue,
                Value<double?> predictedRangeLow = const Value.absent(),
                Value<double?> predictedRangeHigh = const Value.absent(),
                Value<String?> basis = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TraitPredictionsCompanion.insert(
                id: id,
                pairingId: pairingId,
                traitDefinitionId: traitDefinitionId,
                computedAt: computedAt,
                predictedValue: predictedValue,
                predictedRangeLow: predictedRangeLow,
                predictedRangeHigh: predictedRangeHigh,
                basis: basis,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TraitPredictionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({pairingId = false, traitDefinitionId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (pairingId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.pairingId,
                                    referencedTable:
                                        $$TraitPredictionsTableReferences
                                            ._pairingIdTable(db),
                                    referencedColumn:
                                        $$TraitPredictionsTableReferences
                                            ._pairingIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (traitDefinitionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.traitDefinitionId,
                                    referencedTable:
                                        $$TraitPredictionsTableReferences
                                            ._traitDefinitionIdTable(db),
                                    referencedColumn:
                                        $$TraitPredictionsTableReferences
                                            ._traitDefinitionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$TraitPredictionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TraitPredictionsTable,
      TraitPrediction,
      $$TraitPredictionsTableFilterComposer,
      $$TraitPredictionsTableOrderingComposer,
      $$TraitPredictionsTableAnnotationComposer,
      $$TraitPredictionsTableCreateCompanionBuilder,
      $$TraitPredictionsTableUpdateCompanionBuilder,
      (TraitPrediction, $$TraitPredictionsTableReferences),
      TraitPrediction,
      PrefetchHooks Function({bool pairingId, bool traitDefinitionId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SpeciesTableTableManager get species =>
      $$SpeciesTableTableManager(_db, _db.species);
  $$SpeciesReproductionProfilesTableTableManager
  get speciesReproductionProfiles =>
      $$SpeciesReproductionProfilesTableTableManager(
        _db,
        _db.speciesReproductionProfiles,
      );
  $$BreedsTableTableManager get breeds =>
      $$BreedsTableTableManager(_db, _db.breeds);
  $$AnimalGroupsTableTableManager get animalGroups =>
      $$AnimalGroupsTableTableManager(_db, _db.animalGroups);
  $$AnimalsTableTableManager get animals =>
      $$AnimalsTableTableManager(_db, _db.animals);
  $$LociTableTableManager get loci => $$LociTableTableManager(_db, _db.loci);
  $$AllelesTableTableManager get alleles =>
      $$AllelesTableTableManager(_db, _db.alleles);
  $$AnimalGenotypesTableTableManager get animalGenotypes =>
      $$AnimalGenotypesTableTableManager(_db, _db.animalGenotypes);
  $$PhenotypeTraitsTableTableManager get phenotypeTraits =>
      $$PhenotypeTraitsTableTableManager(_db, _db.phenotypeTraits);
  $$PhenotypeTraitOptionsTableTableManager get phenotypeTraitOptions =>
      $$PhenotypeTraitOptionsTableTableManager(_db, _db.phenotypeTraitOptions);
  $$AnimalPhenotypeObservationsTableTableManager
  get animalPhenotypeObservations =>
      $$AnimalPhenotypeObservationsTableTableManager(
        _db,
        _db.animalPhenotypeObservations,
      );
  $$BreedingPairingsTableTableManager get breedingPairings =>
      $$BreedingPairingsTableTableManager(_db, _db.breedingPairings);
  $$BreedingPredictionsTableTableManager get breedingPredictions =>
      $$BreedingPredictionsTableTableManager(_db, _db.breedingPredictions);
  $$BreedingEventsTableTableManager get breedingEvents =>
      $$BreedingEventsTableTableManager(_db, _db.breedingEvents);
  $$OffspringTableTableManager get offspring =>
      $$OffspringTableTableManager(_db, _db.offspring);
  $$TraitDefinitionsTableTableManager get traitDefinitions =>
      $$TraitDefinitionsTableTableManager(_db, _db.traitDefinitions);
  $$TraitRecordsTableTableManager get traitRecords =>
      $$TraitRecordsTableTableManager(_db, _db.traitRecords);
  $$TraitPredictionsTableTableManager get traitPredictions =>
      $$TraitPredictionsTableTableManager(_db, _db.traitPredictions);
}
