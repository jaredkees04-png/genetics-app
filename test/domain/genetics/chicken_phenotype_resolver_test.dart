import 'package:flutter_test/flutter_test.dart';
import 'package:genetics_app/domain/genetics/chicken_phenotype_resolver.dart';
import 'package:genetics_app/domain/genetics/genetics_models.dart';

void main() {
  const resolver = ChickenPhenotypeResolver();

  const bl = AlleleInfo(id: 'bl1', symbol: 'Bl', name: 'Blue dilution');
  const blPlus = AlleleInfo(id: 'bl2', symbol: 'bl+', name: 'Not diluted');

  group('Blue/Lavender dilution (incomplete dominance)', () {
    test('Bl/Bl homozygous is Splash, not "Blue dilution"', () {
      final genotype =
          Genotype(locusId: 'bl-locus', allele1: bl, allele2: bl);
      expect(resolver.resolveLocus('Bl', genotype), 'Splash');
    });

    test('bl+/bl+ homozygous is Not diluted', () {
      final genotype =
          Genotype(locusId: 'bl-locus', allele1: blPlus, allele2: blPlus);
      expect(resolver.resolveLocus('Bl', genotype), 'Not diluted');
    });

    test('Bl/bl+ heterozygous is Blue', () {
      final genotype =
          Genotype(locusId: 'bl-locus', allele1: bl, allele2: blPlus);
      expect(resolver.resolveLocus('Bl', genotype), 'Blue');
    });
  });
}
