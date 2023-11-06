import 'package:sqflite/sqflite.dart' as sql;
// import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DB_Helper {
  static Future<Database> getdatabase() async {
    final dbpath = await sql.getDatabasesPath();
    final db= sql.openDatabase(
      path.join(dbpath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARYKEY, title TEXT, image TEXT)');
      },version: 1, 
    );
    return db;
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final sqldb = await DB_Helper.getdatabase();
    sqldb.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<Future<List<Map<String, Object?>>>> getdata(
      String table) async {
    final db = await DB_Helper.getdatabase();
    return db.query(table);
  }
}
