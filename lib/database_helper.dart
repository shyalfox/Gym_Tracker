import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static Database? _database;
  static const String _dbName = 'example.db';
  static const String _tableName = 'my_values';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      var documentsDirectory = await getApplicationDocumentsDirectory();
      var path = join(documentsDirectory.path, _dbName);

      Database db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
            CREATE TABLE $_tableName (
              id INTEGER PRIMARY KEY,
              my_value INTEGER
            )
          ''');
        },
      );
      return db;
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing database: $e');
      }
      throw Exception('Database initialization failed: $e');
    }
  }

  Future<int> createValue(int value) async {
    try {
      Database db = await database;
      int id = await db.insert(
        _tableName,
        {'my_value': value},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return id;
    } catch (e) {
      if (kDebugMode) {
        print('Error creating value: $e');
      }
      return -1;
    }
  }

  // Other methods for database operations go here...

  Future<int> updateValue(int id, int value) async {
    try {
      Database db = await database;
      int rowsAffected = await db.update(
        _tableName,
        {'my_value': value},
        where: 'id = ?',
        whereArgs: [id],
      );
      return rowsAffected;
    } catch (e) {
      if (kDebugMode) {
        print('Error updating value: $e');
      }
      return 0; // Return 0 to indicate no rows were affected
    }
  }

  Future<int> deleteValue(int id) async {
    try {
      Database db = await database;
      int rowsAffected = await db.delete(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      return rowsAffected;
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting value: $e');
      }
      return 0; // Return 0 to indicate no rows were affected
    }
  }

  // Retrieve all values from the database
  Future<List<Map<String, dynamic>>> getValues() async {
    Database db = await database;
    return db.query(_tableName);
  }
}
