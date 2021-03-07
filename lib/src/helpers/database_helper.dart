import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_constants.dart';

class DatabaseHelper {
  static final _databaseName = 'directionFinder.db';
  static final _databaseVersion = 1;

  DatabaseHelper._internal();
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database _database;
  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database;
  }

  Future<Database> _initDatabase() async {
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
    // await db.execute('''
    //   insert into $table ($columnName, $columnLatitude, $columnLongitude) values
    //     ("Matterhorn", 45.9765738, 7.6584519),
    //     ("Bundeshaus" 46.9465609, 7.4442559)
    // ''');
    // print("result: $result");
    // insert(Location(
    //   name: 'Matterhorn',
    //   latitude: 45.9765738,
    //   longitude: 7.6584519,
    // ));
    // insert(Location(
    //   name: 'Bundeshaus',
    //   latitude: 46.9465609,
    //   longitude: 7.4442559,
    // ));
  }
}
