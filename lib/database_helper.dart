import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static late Database _database;
  static const _tableName = 'Users';
  static Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    return await _initDatabase();
  }

  static Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'my_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    await db.insert(
      _tableName,
      user,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return db.query(_tableName);
  }
}
