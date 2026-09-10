import 'package:flutter/material.dart';

import '../../../domain/genetics/genetics_models.dart';

/// A locus name plus one or two allele dropdowns (one when the animal is
/// hemizygous at a sex-linked locus, two otherwise). Shared by
/// AddAnimalScreen (new animal) and AnimalDetailScreen (edit existing).
class LocusGenotypeField extends StatelessWidget {
  final LocusInfo locus;
  final bool hemizygous;
  final String? allele1Id;
  final String? allele2Id;
  final void Function(String? allele1Id, String? allele2Id) onChanged;

  const LocusGenotypeField({
    super.key,
    required this.locus,
    required this.hemizygous,
    required this.allele1Id,
    required this.allele2Id,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(locus.name, style: const TextStyle(fontSize: 13)),
          ),
          Expanded(
            flex: 3,
            child: DropdownButtonFormField<String?>(
              initialValue: allele1Id,
              isExpanded: true,
              decoration: InputDecoration(
                labelText: hemizygous ? 'Allele' : 'Allele 1',
                isDense: true,
              ),
              items: [
                const DropdownMenuItem(value: null, child: Text('Unknown')),
                ...locus.alleles.map(
                    (a) => DropdownMenuItem(value: a.id, child: Text(a.symbol))),
              ],
              onChanged: (v) => onChanged(v, allele2Id),
            ),
          ),
          if (!hemizygous) ...[
            const SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: DropdownButtonFormField<String?>(
                initialValue: allele2Id,
                isExpanded: true,
                decoration: const InputDecoration(
                  labelText: 'Allele 2',
                  isDense: true,
                ),
                items: [
                  const DropdownMenuItem(value: null, child: Text('Unknown')),
                  ...locus.alleles.map((a) => DropdownMenuItem(
                      value: a.id, child: Text(a.symbol))),
                ],
                onChanged: (v) => onChanged(allele1Id, v),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Whether this animal is hemizygous (single allele) at [locus]. Depends
/// on the species' sex-determination system, not just sex: birds are ZW
/// (hens are the heterogametic sex), mammals are XY (males are). Getting
/// this backwards for an XY species would silently ask a bull for two
/// alleles at a sex-linked locus he can only carry one of.
bool isHemizygousForAnimal(
  LocusInfo locus,
  String animalSex,
  SexDeterminationSystem sexSystem,
) {
  if (!locus.isSexLinked) return false;
  switch (sexSystem) {
    case SexDeterminationSystem.zw:
      return animalSex == 'female';
    case SexDeterminationSystem.xy:
      return animalSex == 'male';
    case SexDeterminationSystem.none:
      return false;
  }
}
