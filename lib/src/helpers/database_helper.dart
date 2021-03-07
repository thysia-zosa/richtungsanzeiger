import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/location.dart';

class DatabaseHelper {
  static final _databaseName = 'directionFinder.db';
  static final _databaseVersion = 1;
  static final table = 'locations';
  static final columnId = '_id';
  static final columnName = 'name';
  static final columnLatitude = 'latitude';
  static final columnLongitude = 'longitude';

  // DatabaseHelper._internal();
  // static final DatabaseHelper instance = DatabaseHelper._internal();

  // static Database _database;
  // Future<Database> get database async {
  //   if (_database == null) {
  //     _database = await _initDatabase();
  //   }
  //   return _database;
  // }

  Future<Database> _database() async {
    WidgetsFlutterBinding.ensureInitialized();
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      create table $table (
        $columnId integer primary key autoincrement,
        $columnName text not null,
        $columnLatitude num not null,
        $columnLongitude num not null
      )
    ''');
    insert(Location(
      name: 'Matterhorn',
      latitude: 45.9765738,
      longitude: 7.6584519,
    ));
    insert(Location(
      name: 'Bundeshaus',
      latitude: 46.9465609,
      longitude: 7.4442559,
    ));
  }

  Future<int> insert(Location location) async {
    final Database db = await _database();
    return await db.insert(
      table,
      location.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Location>> queryAllRows() async {
    final Database db = await _database();
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(
      maps.length,
      (index) => Location(
        id: maps[index]['$columnId'],
        name: maps[index]['$columnName'],
        latitude: maps[index]['$columnLatitude'],
        longitude: maps[index]['$columnLongitude'],
      ),
    );
  }

  Future<int> queryRowCount() async {
    final Database db = await _database();
    return Sqflite.firstIntValue(
      await db.rawQuery('select count(*) from $table'),
    );
  }

  Future<int> update(Location location) async {
    final Database db = await _database();
    return await db.update(
      table,
      location.toJson(),
      where: '$columnId = ?',
      whereArgs: [location.id],
    );
  }

  Future<int> delete(Location location) async {
    final Database db = await _database();
    return await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [location.id],
    );
  }
}
