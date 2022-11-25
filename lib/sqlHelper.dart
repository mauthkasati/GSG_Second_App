import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper {
  static SqlHelper dbh = SqlHelper();

  Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
      return _db;
    } else {
      return _db;
    }
  }

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'muath.db');
    Database myDb = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute("""
          CREATE TABLE notes (
            id INTEGER PRIMARY KEY autoincrement,
            surahID TEXT,
            category TEXT,
            verseID INTEGER,
            noteText TEXT
          )
        """);
        await db.execute("""
          CREATE TABLE achievements (
            id INTEGER PRIMARY KEY autoincrement,
            firstChar TEXT,
            verse TEXT,
            surah TEXT
          )
        """);
        await db.execute("""
          CREATE TABLE single (
            id INTEGER PRIMARY KEY
          )
        """);
        await db.execute("""
          CREATE TABLE perSurah (
            id INTEGER PRIMARY KEY,
            numOfAchPerSurah INTEGER
          )
        """);
        log("CREATED_+_+_+_+_+_+_+_+_+_+_");
      },
      onUpgrade: (db, oldVersion, newVersion) {
        log('upgradeed_+_+_+_+_+_+_+_+_+');
      },
      onDowngrade: (db, oldVersion, newVersion) {
        log('downgraded-=-=-=-=-=-=-=-=-=');
      },
    );
    return myDb;
  }

  readData(String sql) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql);
    return response;
  }
}
