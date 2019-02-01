import 'dart:async';
import 'package:sqflite/sqflite.dart';


///数据库管理
class MSqlManager {
  static final _VERSION = 1;

  static final _NAME = "kak_flutter_mp.db";

  static Database _database;

  ///初始化
  static init() async {
    // open the database
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + _NAME;
    _database = await openDatabase(path, version: _VERSION, onCreate: (Database db, int version) async {
      // When creating the db, create the table
      // 创建数据库时，创建表
      // await db.execute("CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)");
    });
  }

  /// 表是否存在
  static isTableExits(String tableName) async {
    await getCurrentDatabase();
    var res = await _database.rawQuery("select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res != null && res.length > 0;
  }

  ///获取当前数据库对象
  static Future<Database> getCurrentDatabase() async {
    // 是否有数据库，如果没有初始化一个，如果有就返回 数据库对象
    if (_database == null) {
      await init();
    }
    return _database;
  }

  ///关闭
  static close() {
    if (_database != null) {
      _database.close();
      _database = null;
    }
  }
}

