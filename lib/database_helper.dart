import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  static loginUser(String email, String password) {
    User user = await getUser(_email, _password);
    if (user != null) {
      Navigator.pushNamed(context, '/home');
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  Future<User> getUser(String email, String password) async {
    var dbClient = await database;
    List<Map> result = await dbClient.query('users',
        columns: ['id', 'email', 'password'],
        where: 'email = ? AND password = ?',
        whereArgs: [email, password]);
    if (result.length > 0) {
      return User.fromMap(result.first);
    }
    return null;
  }
}
