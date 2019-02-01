import 'dart:async';
import 'dart:convert';
import 'package:kaka_flutter_mp/model/UsersCar.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kaka_flutter_mp/sqflite/MBaseDbProvider.dart';


class UserDB extends MBaseDbProvider {
  // 表名
  final String name = 'UserInfo';

  // 表数据
  final String columnId = "_id";// id
  final String columnUserId = "userId"; // 后台用户唯一id
  final String columnData = "data";

  int id;
  String userId; //  这个是后台数据库存放的用户id作为登录用户全局唯一表标识
  String data;

  UserDB();

  // fromMap 构造函数
  UserDB.fromMap(Map map) {
    this.id = map[columnId];
    this.userId = map[columnUserId];
  }
  //
  Map<String, dynamic> toMap(String userId, String data) {
    Map<String, dynamic> map = {columnUserId: userId, columnData: data};
    if (this.id != null) {
      map[columnId] = this.id;
    }
    return map;
  }



  @override
  tableSqlString() {
    return tableBaseString(columnUserId, columnId) +
        '''
        $columnUserId text not null,
        $columnId text not null)
        ''';
  }


  // 获取表名
  @override
  tableName() {
    return name;
  }

  /// 作用是查询 数据库，这个表中是否已经有 这个userId 了
  /// 如果没有返回null 如果有了 返回查询出来的第一条user数据
  Future _getUserProvider(Database db, String userId) async {
    /// 接收数据库对象，和userId
    /// 声明list<map>
    List<Map<String, dynamic>> maps =
    await db.query(name, columns: [columnId, columnUserId, columnData], where: "$columnUserId = ?", whereArgs: [userId]);

    if (maps.length > 0) {
      UserDB provider = UserDB.fromMap(maps.first);
      return provider;
    }
    return null;
  }

  ///插入到数据库
  Future insert(String userId, String eventMapString) async {
    /// 传入userId eventMapString

    /// 获取数据库对象
    Database db = await getDataBase();
    // 报数据库对象和userId传入  _getUserProvider 方法
    var userProvider = await _getUserProvider(db, userId);
    /// 判断返回的数据是否未null 如果有 先删除 这条数据，再插入
    if (userProvider != null) {
      var result = await db.delete(name, where: "$columnUserId = ?", whereArgs: [userId]);
      print(result);
    }
    return await db.insert(name, toMap(userId,eventMapString));
  }

  ///获取事件数据
  Future<UsersCar> getUserInfo(String userId) async {
    Database db = await getDataBase();
    var userProvider = await _getUserProvider(db, userId);
    if (userProvider != null) {
      return UsersCar.fromJson(json.decode(userProvider.data));
    }
    return null;
  }
}