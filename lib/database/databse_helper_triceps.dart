import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static Database? _database;
  static const String _dbName = 'tricepFinal.db';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase(partBody: 'Default');
    return _database!;
  }

  Future<Database> initDatabase({required String partBody}) async {
    try {
      var documentsDirectory = await getApplicationDocumentsDirectory();
      var path = join(documentsDirectory.path, _dbName);

      Database db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await tricepTable(db, partBody);
        },
      );

      ///delete code

      // await db.delete(
      //   _tableName,
      //   where: '1', // This will delete all rows.
      // );
      // await db.delete(
      //   'Tricep',
      //   where: '1', // This will delete all rows.
      // );
      // await db.delete(
      //   tricepTable,
      //   where: '1', // This will delete all rows.
      // );
      return db;
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing database: $e');
      }
      throw Exception('Database initialization failed: $e');
    }
  }

  Future<void> insertDefaultValues(int instanceId, String excerName,
      String termWeights, String attemptedreps, String partBody) async {
    try {
      // Get a reference to the database
      Database db = await initDatabase(partBody: partBody);

      // Insert default values into the database
      await db.insert(
        partBody, // Table name
        {
          'id': instanceId,
          'excerName': excerName,
          'termWeights': termWeights,
          'attemptedreps': attemptedreps,
        },
        conflictAlgorithm: ConflictAlgorithm
            .ignore, // Ignore conflicts if the entry already exists
      );

      if (kDebugMode) {
        print('Default values inserted successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error inserting default values: $e');
      }
      rethrow;
    }
  }

  static Future<void> tricepTable(Database db, String partBody) async {
    // Create table 1 if condition is met
    if (partBody == 'Tricep') {
      await db.execute('''
            CREATE TABLE Tricep (
              id INTEGER PRIMARY KEY,
              excerName TEXT,
              termWeights TEXT,
              attemptedreps TEXT
            )
          ''');
    }
  }

  Future<List<Map<String, dynamic>>> getDatabaseContents(
      String partBody) async {
    final db = await database;
    return await db.query(partBody);
  }

  Future<int> updateValue(int id, String excerName, String termWeights,
      String attemptedreps) async {
    try {
      Database db = await database;
      int rowsAffected = await db.update(
        'Tricep',
        {
          'id': id,
          'excerNAme': excerName,
          'termWeights': termWeights,
          'attemptedreps': attemptedreps,
        },
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

  Future<bool> databaseContainsEntry(int id, String partBody) async {
    try {
      // Get a reference to the database
      Database db = await initDatabase(partBody: partBody);

      // Query the database to check if an entry with the given instance ID exists
      List<Map<String, dynamic>> result = await db.query(
        partBody, // Table name
        where: 'id = ?', // Query condition
        whereArgs: [id], // Query arguments
      );

      // If the result list is not empty, an entry with the given instance ID exists
      return result.isNotEmpty;
    } catch (e) {
      if (kDebugMode) {
        print('Error checking database entry: $e');
      }
      throw Exception('Error checking database entry: $e');
    }
  }

  Future<Map<String, dynamic>?> getTricepData(int id, String partBody) async {
    Database db = await initDatabase(partBody: partBody);
    List<Map<String, dynamic>> data = await db.query(
      'Tricep',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (data.isNotEmpty) {
      return data.first;
    } else {
      return null;
    }
  }
}
