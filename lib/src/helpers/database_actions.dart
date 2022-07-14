import 'package:richtungsanzeiger/src/helpers/database_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../models/location.dart';
import 'database_constants.dart';

class DatabaseActions {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  Future<int> insert(Location location) async {
    final Database db = await _databaseHelper.database;
    return await db.insert(
      table,
      location.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Location>> queryAllRows() async {
    final Database db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(
      maps.length,
      (index) => Location.fromJson(maps[index]),
    );
  }

  Future<int> queryRowCount() async {
    final Database db = await _databaseHelper.database;
    return Sqflite.firstIntValue(
          await db.rawQuery('select count(*) from $table'),
        ) ??
        0;
  }

  Future<int> update(Location location) async {
    final Database db = await _databaseHelper.database;
    return await db.update(
      table,
      location.toJson(),
      where: '$columnId = ?',
      whereArgs: [location.id],
    );
  }

  Future<int> delete(Location location) async {
    final Database db = await _databaseHelper.database;
    return await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [location.id],
    );
  }
}
