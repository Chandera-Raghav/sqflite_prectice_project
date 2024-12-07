import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  /// step one privet constructor
  DbHelper._();

  /// table column of var
  static final String TABLE_NOTE = "note";
  static final String NOTE_COLUMN_ID = "s_no";
  static final String NOTE_COLUMN_TITLE = "n_title";
  static final String NOTE_COLUMN_DESC = "n_desc";
  static final String NOTE_COLUMN_CREATE_AT = "n_crate_at";

  /// step two create a static global instance to this class
/// static final DbHelper instance = DbHelper._();

  static DbHelper getInstance() => DbHelper._();

  Database? mDB;
/// initialise DB 
  
  Future<Database> initDB() async{
    mDB = mDB ?? await openDB();
    print("db is Open!!");
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
      print("db is created!!");
        /// create Table in Database
        db.execute("create table $TABLE_NOTE ($NOTE_COLUMN_ID integer primary key autoincrement, $NOTE_COLUMN_TITLE text, $NOTE_COLUMN_DESC text, $NOTE_COLUMN_CREATE_AT text) ");
    });
  }
  Future<bool> addNote({required String title, required String desc}) async{
    Database db = await initDB();
    int rowsEffect = await db.insert(TABLE_NOTE, {
      NOTE_COLUMN_TITLE : title,
      NOTE_COLUMN_DESC : desc,
      NOTE_COLUMN_CREATE_AT : DateTime.now().millisecondsSinceEpoch.toString()
    });
    return rowsEffect>0;
    // if(rowsEffect>0){
    //   return true;
    // } else {
    //   return false;
    // }
  }
  Future<List<Map<String, dynamic>>> fetchAllNote() async{
    Database db = await initDB();
    List<Map<String, dynamic>> allNote = await db.query(TABLE_NOTE);
    return allNote;
  }
  Future<bool> editeDataNote({required String title, required String desce, required int id}) async{
    Database db = await initDB();
    int update = await db.update(TABLE_NOTE,{
      NOTE_COLUMN_TITLE : title,
      NOTE_COLUMN_DESC : desce
    }, where: '$NOTE_COLUMN_ID = $id');
    return update>0;
  }
  Future<bool>deleteDataNote({required int id})async{
    Database db = await initDB();
    int rowsEffect = await db.delete(TABLE_NOTE, where: NOTE_COLUMN_ID, whereArgs: ["$id"]);
    return rowsEffect > 0;
  }
}
