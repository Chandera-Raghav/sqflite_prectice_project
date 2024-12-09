import 'package:sqflite_prectice_project/db_helper.dart';

class NoteModel {
  int? id;
  String title;
  String desc;
  String creatat;
  NoteModel({this.id, required this.title, required this.desc, required this.creatat});

  factory NoteModel.formMap(Map<String, dynamic> map){
    return NoteModel(id: map[DbHelper.NOTE_COLUMN_ID], title:  map[DbHelper.NOTE_COLUMN_TITLE], desc: map[DbHelper.NOTE_COLUMN_DESC], creatat: map[DbHelper.NOTE_COLUMN_CREATE_AT]);
  }
  Map<String, dynamic> toMap() => {
    DbHelper.NOTE_COLUMN_TITLE : title,
    DbHelper.NOTE_COLUMN_DESC : desc,
    DbHelper.NOTE_COLUMN_CREATE_AT : creatat
  };
}