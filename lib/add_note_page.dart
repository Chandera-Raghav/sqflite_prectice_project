import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_prectice_project/db_provider.dart';
// import 'package:sqflite_prectice_project/main.dart';

import 'db_helper.dart';
import 'note_model.dart';

class AddNotePage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  DbHelper dbHelper = DbHelper.getInstance();
  AddNotePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Page Note"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 19),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  label: const Text('Title*'),
                  hintText: "Enter your title hire..",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 19),
            TextField(
              controller: descController,
              minLines: 3,
              maxLines: 3,
              decoration: InputDecoration(
                  label: const Text('Description*'),
                  hintText: "Enter your desc. hire..",
                  focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 19,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (titleController.text.isNotEmpty &&
                            descController.text.isNotEmpty) {
                          // if (isUpdate) {
                          //   bool check = await dbHelper.editeDataNote(
                          //       title: titleController.text,
                          //       desce: descController.text,
                          //       id: nId);
                          //   if(check){
                          //     getNote();
                          //     Navigator.pop(context);
                          //   }
                          //   else {
                          //     ScaffoldMessenger.of(context)
                          //         .showSnackBar(const SnackBar(content: Text("Error: Is note not update!!!"),));
                          //   }
                          // } else {
                          context.read<DBProvider>().addNote(note: NoteModel(title: titleController.text, desc: descController.text, creatat: DateTime.now().millisecondsSinceEpoch.toString()));
                          //   bool check = await dbHelper.addNote(NoteModel(title: titleController.text, desc: descController.text, creatat: DateTime.now().millisecondsSinceEpoch.toString()));
                          //   if (check) {
                              // getNote();
                              Navigator.pop(context);
                            // } else {
                            //   ScaffoldMessenger.of(context)
                            //       .showSnackBar(const SnackBar(
                            //     content: Text("Error: Is note not added!!!"),
                            //   ));
                            // }
                          }
                        // }
                      },
                      child: const Text("Save", /*isUpdate ? "Update" : "Save"*/)),
                  const SizedBox(
                    width: 19,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"))
                ],
              ),
            )
          ],
        ),
      ) ,
    );
  }

}