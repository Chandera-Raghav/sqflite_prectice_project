import 'package:flutter/widgets.dart';
import 'package:sqflite_prectice_project/db_helper.dart';
import 'package:sqflite_prectice_project/note_model.dart';

class DBProvider extends ChangeNotifier{
  DbHelper dbHelper = DbHelper.getInstance();
  List<NoteModel> _mNotes = [];

  void addNote({required NoteModel note}) async {
    bool check = await dbHelper.addNote(note);
    if(check){
      _mNotes = await dbHelper.fetchAllNote();
      notifyListeners();
    }
  }
  List<NoteModel> getAllNotes() => _mNotes;
  void getInitialNotes() async {
    _mNotes = await dbHelper.fetchAllNote();
    notifyListeners();
  }
}