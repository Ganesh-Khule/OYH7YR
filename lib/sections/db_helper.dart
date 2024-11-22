
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();

  static const String TABLE_NOTE = "note";
  static const String COLUMN_NOTE_SNO = "s_no";
  static const String COLUMN_NOTE_TITLE = "title";
  static const String COLUMN_NOTE_IMAGE = "image";

  late Database myDB;

  Future<Database> getDb() async {
    if (myDB != null) {
      return myDB;
    }
    myDB = await _initDb();
    return myDB;
  }

  Future<Database> _initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentsDirectory.path}/notes.db";
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $TABLE_NOTE (
        $COLUMN_NOTE_SNO INTEGER PRIMARY KEY AUTOINCREMENT,
        $COLUMN_NOTE_TITLE TEXT,
        $COLUMN_NOTE_IMAGE TEXT
      )
    ''');
  }

  Future<bool> addNote({
    required String mTitle,
    required String imagePath, 
  }) async {
    try {
      var db = await getDb();
      int rowEffected = await db.insert(
        TABLE_NOTE,
        {
          COLUMN_NOTE_TITLE: mTitle,
          COLUMN_NOTE_IMAGE: imagePath, 
        },
      );
      return rowEffected > 0;
    } catch (e) {
      print("Error adding note: $e");
      return false;
    }
  }
}
