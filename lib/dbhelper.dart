import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'entry.dart';

class DbHelper {
  static DbHelper dbHelper;
  static Database db;

  DbHelper._createInstance();

  factory DbHelper() {
    if (dbHelper == null) {
      return DbHelper._createInstance();
    }

    return dbHelper;
  }

  Future<void> open() async {
    if (db != null) return;

    var dbPath = join(await getDatabasesPath(), 'cars_database.db');

    db = await openDatabase(dbPath, onCreate: initialize, version: 1);
  }

  void initialize(Database db, int newVersion) async {
    await db.execute("""
      CREATE TABLE entries (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        make TEXT,
        model TEXT
      )
    """);
  }

  Future<int> insertEntry(Entry entry) async {
    var result = await db.insert('entries', entry.toMapWithoutId(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<List<Entry>> getEntries() async {
    var result = await db.query("entries", orderBy: "id ASC");

    return List.generate(result.length, (i) => Entry.fromMap(result[i]));
  }

  Future<int> deleteEntry(Entry entry) async {
    var result =
        await db.delete("entries", where: 'id = ?', whereArgs: [entry.id]);
    return result;
  }
}
