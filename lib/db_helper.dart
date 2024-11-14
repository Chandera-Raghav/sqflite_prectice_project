import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  /// step one privet constructor
  DbHelper._();

  /// step two create a static global instance to this class
/// static final DbHelper instance = DbHelper._();

  static DbHelper getInstance() => DbHelper._();

  Database? mDB;
/// initialise DB 
  
  Future<Database> initDB() async{
    mDB = mDB ?? await openDB();
    return mDB!;
    // if(mDB != null){
    //   return mDB!;
    // } else {
    //   return await openDB();
    // }
  }
  Future<Database> openDB() async{
    var directoryPath = await getApplicationDocumentsDirectory();
    var dbPath = join(directoryPath.path, "noteDB.db");
    return openDatabase(dbPath, version: 1, onCreate: (db, version){
        /// create Table in Database
        db.execute("create table note ( s_no integer primary key autoincrement, n_title text, n_desc text) ");
    });
  }
  void addNote({required String title, required String desc}) async{
    Database db = await initDB();
    db.insert("note", {

    });
  }
}
/// 