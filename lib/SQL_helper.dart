
import 'package:sqflite/sqflite.dart' as sql;



class SQLHelper{



  static Future<void> createTable(sql.Database database)async {

    await database.execute(
        """ CREATE TABLE items (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
     title TEXT,
     description TEXT,
     createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)"""
    );
  }



  static Future<sql.Database> db()async {
    return sql.openDatabase(
      "dbtech",
      version: 1,
      onCreate: (sql.Database database,int version) async
      {
        await createTable(database);
      }
    );

  }

  static Future<int> createItem(String title, String? description)async{

    final db=await SQLHelper.db();
    final data={
      "title":title,
      "description":description
    };

    final id=await db.insert("items", data,conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;


  }


  static Future<List<Map<String,dynamic>>> getItems() async {
    final db=await SQLHelper.db();

    return db.query("items",orderBy: "id");
  }


  static Future<List<Map<String,dynamic>>> getItem(int id)async{
    final db=await SQLHelper.db();

    return db.query("items",where: "id=?",whereArgs: [id],limit: 1);

  }



}