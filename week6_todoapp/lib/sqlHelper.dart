import 'dart:ffi';

import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._init();

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbpath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbpath, 'tasks.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, dueDate TEXT NOT NULL, isCompleted INTEGER NOT NULL)');
      },
    );
  }

  Future<int> insertTask(String title, String duedate) async {
    final db = await instance.database;
    return db.insert(
        'tasks', {'title': title, 'dueDate': duedate, 'isCompleted': 0});
  }

// filter = null ===> select * from tasks orderBy dueDate ASC
// filter = 0 ===> select * from tasks where isCompleted = 0 orderBy dueDate ASC
// filter = 1 ===> select * from tasks where isCompleted = 1 orderBy dueDate ASC

  Future<List<Map<String, dynamic>>> getTasks(int? filter) async {
    final db = await instance.database;
    if (filter == null) {
      return db.query('tasks', orderBy: 'dueDate ASC');
    } else {
      return db.query('tasks',
          where: ' isCompleted = ?',
          whereArgs: [filter],
          orderBy: 'dueDate ASC');
    }
  }

// update tasks where id = 44 set isCompleted values 1

  Future<int> updateTask(int id, int isCompletedValue) async {
    final db = await instance.database;
    return db.update('tasks', {'isCompleted': isCompletedValue},
        where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteTask(int id) async {
    final db = await instance.database;
    return db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
