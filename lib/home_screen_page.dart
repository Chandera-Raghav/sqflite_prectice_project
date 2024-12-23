import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_prectice_project/add_note_page.dart';
import 'package:sqflite_prectice_project/db_provider.dart';
import 'package:sqflite_prectice_project/note_model.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // DbHelper dbHelper = DbHelper.getInstance();
  List<NoteModel> mData = [];
  @override
  void initState() {
    super.initState();
    context.read<DBProvider>().getInitialNotes();
    // getNote();
  }

  // void getNote() async {
  //   mData = await dbHelper.fetchAllNote();
  //   setState(() {});
  // }

  // TextEditingController titleController = TextEditingController();
  // TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    mData = context.watch<DBProvider>().getAllNotes();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insert & Select data Query"),
      ),
      body: mData.isNotEmpty
          ? ListView.builder(
              itemCount: mData.length,
              itemBuilder: (_, index) {
                return ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: const TextStyle(fontSize: 10),
                  ),
                  title: Text(
                    mData[index].title,
                    style: const TextStyle(fontSize: 10),
                  ),
                  subtitle: Text(
                    mData[index].desc,
                    style: const TextStyle(fontSize: 10),
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              // titleController.text = mData[index].title;
                              // descController.text = mData[index].desc;
                              // showModalBottomSheet(
                              //     shape: const RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.vertical(
                              //             top: Radius.circular(40))),
                              //     isDismissible: false,
                              //     enableDrag: false,
                              //     context: context,
                              //     builder: (_) {
                              //       return //bottomSheetPage(
                                        //isUpdate: true,
                                        //nId: mData[index].id!);
                                  //});
                            },
                            child: const Icon(
                              Icons.note_alt_outlined,
                              weight: 10,
                            )),
                        InkWell(
                          onTap: () async{
                            // bool check = await dbHelper.deleteDataNote(id: mData[index].id!);
                            // if(check){
                            //   getNote();
                            // }
                          },
                        child: const Icon(
                          Icons.delete_outline,
                          weight: 10,
                          color: Colors.red,
                        ))
                      ],
                    ),
                  ),

                );
              })
          : Container(child: const Center(child: Text("No Notes yet!!!")),),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotePage()));
          // titleController.clear();
          // descController.clear();
          // showModalBottomSheet(
          //     shape: const RoundedRectangleBorder(
          //         borderRadius:
          //             BorderRadius.vertical(top: Radius.circular(40))),
          //     enableDrag: false,
          //     context: context,
          //     builder: (_) {
          //       return bottomSheetPage();
          //     });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  // bottomSheetPage({bool isUpdate = false, int nId = 0}) {
  //   return Container(
  //     padding: const EdgeInsets.all(15),
  //     color: Colors.white,
  //     height: 399,
  //     width: double.infinity,
  //     child: Column(
  //       children: [
  //         Text(
  //           isUpdate ? "Edit Note" : "Add Note",
  //           style: const TextStyle(fontSize: 19),
  //         ),
  //         const SizedBox(height: 19),
  //         TextField(
  //           controller: titleController,
  //           decoration: InputDecoration(
  //               label: const Text('Title*'),
  //               hintText: "Enter your title hire..",
  //               focusedBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(10))),
  //         ),
  //         const SizedBox(height: 19),
  //         TextField(
  //           controller: descController,
  //           minLines: 3,
  //           maxLines: 3,
  //           decoration: InputDecoration(
  //               label: const Text('Description*'),
  //               hintText: "Enter your desc. hire..",
  //               focusedBorder:
  //                   OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  //               enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(10))),
  //         ),
  //         const SizedBox(
  //           height: 19,
  //         ),
  //         Center(
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               ElevatedButton(
  //                   onPressed: () async {
  //                     if (titleController.text.isNotEmpty &&
  //                         descController.text.isNotEmpty) {
  //                       if (isUpdate) {
  //                         bool check = await dbHelper.editeDataNote(
  //                             title: titleController.text,
  //                             desce: descController.text,
  //                             id: nId);
  //                         if(check){
  //                           getNote();
  //                           Navigator.pop(context);
  //                         }
  //                         else {
  //                           ScaffoldMessenger.of(context)
  //                           .showSnackBar(const SnackBar(content: Text("Error: Is note not update!!!"),));
  //                         }
  //                       } else {
  //                         bool check = await dbHelper.addNote(NoteModel(title: titleController.text, desc: descController.text, creatat: DateTime.now().millisecondsSinceEpoch.toString()));
  //                         if (check) {
  //                           getNote();
  //                           Navigator.pop(context);
  //                         } else {
  //                           ScaffoldMessenger.of(context)
  //                               .showSnackBar(const SnackBar(
  //                             content: Text("Error: Is note not added!!!"),
  //                           ));
  //                         }
  //                       }
  //                     }
  //                   },
  //                   child: Text(isUpdate ? "Update" : "Save")),
  //               const SizedBox(
  //                 width: 19,
  //               ),
  //               ElevatedButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text("Cancel"))
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
