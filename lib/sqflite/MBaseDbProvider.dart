import 'dart:async';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'MSqlManager.dart';



///数据库数据提供的抽象基类
abstract class MBaseDbProvider {

  bool isTableExits = false; // 表是否存在

  tableSqlString(); // 建表sql

  tableName(); // 表名

  tableBaseString(String name, String columnId) {
    return '''
        create table $name (
        $columnId integer primary key autoincrement,
      ''';
  }

  Future<Database> getDataBase() async {
    return await open();
  }

  // mustCallSuper
  @mustCallSuper
  prepare(name, String createSql) async {
    // 通过数据库检测表是否存在
    isTableExits = await MSqlManager.isTableExits(name);
    print("""
    该表是否存在 $isTableExits
    表名 $name
    sql语句 $createSql
    """);
    // 如果还是不存在，就获取数据库对象，执行建表sql
    if (!isTableExits) {
      Database db = await MSqlManager.getCurrentDatabase();
      return await db.execute(createSql);
    }
  }

  @mustCallSuper
  open() async {
    // 检测表是否存在，如果不存在 执行  prepare 函数 ，传入表名和建表的sql
    if (!isTableExits) {
      await prepare(tableName(), tableSqlString());
    }

    // 如果改表有了 获取当前数据库对象 getCurrentDatabase
    return await MSqlManager.getCurrentDatabase();
  }
}
