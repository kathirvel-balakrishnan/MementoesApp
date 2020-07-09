import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'entries.db'),
        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE user_entries(id TEXT PRIMARY KEY,title TEXT,image TEXT,description TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String,dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
  static Future<void> delete(String table,String memoryId)async{
    final db=await DBHelper.database();
    db.delete(table,where:'id=?',whereArgs: [memoryId]);
  }
}
