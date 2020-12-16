import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'class/Car.dart';

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

    var dbPath = join(await getDatabasesPath(), 'cars1_database.db');

    db = await openDatabase(dbPath, onCreate: initialize, version: 1);
  }

  void initialize(Database db, int newVersion) async {
    await db.execute("""
      CREATE TABLE cars(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        make TEXT,
        model TEXT,
        logoName TEXT
      )
    """);
  }

  Future<int> insertEntry(Car entry) async {
    var result = await db.insert('cars', entry.toMapWithoutId(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    return result;
  }

  Future<List<Car>> getEntries() async {
    var result = await db.query("cars", orderBy: "id ASC");

    return List.generate(result.length, (i) => Car.fromMap(result[i]));
  }

  Future<int> deleteEntry(Car entry) async {
    var result =
        await db.delete("cars", where: 'id = ?', whereArgs: [entry.id]);
    return result;
  }
}
