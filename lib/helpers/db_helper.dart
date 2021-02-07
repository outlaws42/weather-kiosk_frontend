import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    // Get the Database path
    final dbPath = await sql.getDatabasesPath();
    // Path of the db and the db name, onCreate is done only when creating the
    // db.execute(tableName(fields))
    return sql.openDatabase(path.join(dbPath, 'settings.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE app_settings(id INTEGER PRIMARY KEY, setting TEXT, active INTEGER)');
    }, version: 1);
  }

  static Future<void> insert(
    String table,
    Map<String, Object> data,
  ) async {
    // gets access to the database
    final db = await DBHelper.database();
    // Insert into the database
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, Object>>> getData(String table) async {
    // gets access to the database
    final db = await DBHelper.database();
    // get the data from the db it will return a List of Maps
    return db.query(table);
  }
}
