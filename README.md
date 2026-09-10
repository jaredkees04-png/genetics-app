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

iOS + Android are the real target, but native builds need platform SDKs
this container doesn't have (Xcode/macOS for iOS, the Android SDK for
Android) - `flutter analyze` and `flutter test` are the verification
path here.

A **web build** is also included purely as a low-friction way to try the
app from a browser (phone or desktop) without any app store or Mac
involved - see below. It is not a replacement for the native apps.

### Web build

The web target needs a WebAssembly SQLite backend for drift, which two
files in `web/` provide:

- `web/sqlite3.wasm` - the compiled sqlite3 WASM binary (from the
  `sqlite3` package's GitHub releases, matching the version in
  `pubspec.lock`).
- `web/drift_worker.js` - compiled from `web/drift_worker.dart` via
  `dart compile js -O4 -o web/drift_worker.js web/drift_worker.dart`.
  Committed for convenience, but recompiled fresh on every deploy (see
  the GitHub Actions workflow) so it never goes stale.

Build and serve locally with:

```
flutter build web --release
cd build/web && python3 -m http.server 8000
```

Every push to `main` auto-deploys to GitHub Pages via
`.github/workflows/deploy-web.yml`. **One-time manual step**: in the
repo's Settings → Pages, set Source to "GitHub Actions" - the workflow
can't flip that toggle itself. Once set, the app is live at
`https://<owner>.github.io/genetics-app/`.

Known limitation: iOS Safari is more aggressive about evicting local
site storage than a native app's storage, so this is best treated as a
way to try the app, not a permanent home for real flock data.
