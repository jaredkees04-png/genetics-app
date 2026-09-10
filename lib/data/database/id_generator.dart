import 'package:uuid/uuid.dart';

/// Every table uses a TEXT/UUID primary key (not the implicit SQLite
/// rowid) so IDs stay valid across devices once sync is added. Because
/// `insert()` returns the rowid rather than our column value, callers
/// generate the id themselves, pass it explicitly, and return it.
String newId() => const Uuid().v4();
