# Livestock Genetics & Breeding Predictor

Offline-first mobile app (Flutter, iOS-first) for small-scale livestock
breeders: predicts offspring plumage color/pattern (Punnett-square style)
and estimates production traits (egg rate, milk yield, meat yield) from
recorded parent data. Starts with chickens; the schema is designed so
adding rabbits, goats, and cattle later is seed data, not a rework.

## Getting started

```
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

Generated drift code (`*.g.dart`) is committed so the project builds
immediately after `pub get`. Re-run `build_runner` after editing any file
under `lib/data/database/tables/`.

## Architecture

- `lib/data/database` - drift (SQLite) schema. UUID primary keys and
  `created_at`/`updated_at`/`deleted_at` on every table so adding sync
  later is additive, not a rework.
- `lib/data/repositories` - the only code that talks to the database.
- `lib/data/seed` - first-pass chicken plumage genetics dataset (loci,
  alleles, phenotype pick-lists) seeded on first launch.
- `lib/domain/genetics` - the genetics engine itself: species-agnostic
  Mendelian segregation (autosomal, sex-linked, incomplete dominance),
  plus a chicken-specific phenotype resolver.
- `lib/features` - UI screens (Riverpod + drift streams).

See the schema design notes in the project history for the full data
model rationale (species/reproduction profiles, genotype vs. observed
phenotype, breeding pairings vs. predictions vs. real events, production
trait records).

## Platform

iOS + Android only for now. This container has no Xcode/Android SDK, so
`flutter analyze` and `flutter test` are the verification path here -
build on a Mac (`flutter build ios`) or with the Android SDK installed
(`flutter build apk`) to produce a real binary.
