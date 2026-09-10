import 'genetics_models.dart';

/// Turns a genotype into a display phenotype label. Implemented per
/// species because epistasis/dominance interpretation is genuinely
/// species-specific; [DefaultPhenotypeResolver] is the fallback for any
/// species without a dedicated resolver yet.
abstract class PhenotypeResolver {
  String resolveLocus(String locusKey, Genotype genotype);

  String describeOffspring(Map<String, Genotype> genotypesByLocusKey) {
    return genotypesByLocusKey.entries
        .map((e) => resolveLocus(e.key, e.value))
        .join(', ');
  }
}

class DefaultPhenotypeResolver implements PhenotypeResolver {
  const DefaultPhenotypeResolver();

  @override
  String resolveLocus(String locusKey, Genotype genotype) => genotype.label;

  @override
  String describeOffspring(Map<String, Genotype> genotypesByLocusKey) {
    return genotypesByLocusKey.entries
        .map((e) => resolveLocus(e.key, e.value))
        .join(', ');
  }
}
