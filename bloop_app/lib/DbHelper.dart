import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:bloop_app/diaryEntry.dart';

class DbHelper{
  static final _databaseName ="diaries.db";  //database name
  static final _version = 1;

  static final table = 'diaries';  //diary table

  static final columnId = 'id';  //diary columns
  static final columnDate = 'date'; //diary column
  static final columnEmoji = 'emoji'; // diary column
  static final columnInfo = 'info'; // diary column

  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();

  static Database _db;

  //check if database is initialized
  Future<Database> get database async{
    if(_db != null) return _db;
    _db = await _initDatabase();
    return _db;
  }

  //initialize database
  Future<Database> _initDatabase() async{
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _version, onCreate: _onCreate);
  }

  //create table
  Future _onCreate(Database datab, int version) async {
    await datab.execute('''
          CREATE TABLE $table(
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnDate TEXT,
            $columnEmoji TEXT,
            $columnInfo TEXT
          )
          ''');
  }

  //insert entry into data table
  Future<int> insert(diaryEntry de) async{
    Database db = await instance.database;
    var res = await db.insert(table, de.toMap());
    return res;
  }

  //list all entries in table
  Future<List<Map<String,dynamic>>> queryAllRows() async{
    Database datab = await instance.database;
    var res = await datab.query(table, orderBy: "$columnDate DESC");
    return res;
  }

  //delete an entry
  Future<void> delete(int id) async{
    Database datab = await instance.database;
    return await datab.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

}
