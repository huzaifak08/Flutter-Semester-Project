import 'package:flutter/material.dart';
import 'package:semester_project/SQLite/database_handler.dart';
import 'package:semester_project/SQLite/users_model.dart';
import 'package:semester_project/Widgets/pdf_license_row_widget.dart';

class ViewDataPage extends StatefulWidget {
  const ViewDataPage({super.key});

  @override
  State<ViewDataPage> createState() => _ViewDataPageState();
}

class _ViewDataPageState extends State<ViewDataPage> {
  DBHelper? dbHelper;
  late Future<List<NotesModel>> notesList;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();

    loadData();
  }

  loadData() async {
    notesList = dbHelper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: notesList,
              builder: (context, AsyncSnapshot<List<NotesModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color.fromARGB(255, 255, 219, 111),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 220,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(23)),
                            child: Column(
                              children: [
                                Text(
                                  '${snapshot.data![index].title} Traffic Police',
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                ),
                                RowKeyValue(
                                    mykey: 'ID',
                                    value: snapshot.data![index].id.toString()),
                                const SizedBox(height: 10),
                                RowKeyValue(
                                    mykey: 'Name',
                                    value: snapshot.data![index].name),
                                const SizedBox(height: 10),
                                RowKeyValue(
                                    mykey: 'CNIC',
                                    value: snapshot.data![index].cnic),
                                const SizedBox(height: 10),
                                RowKeyValue(
                                    mykey: 'Age',
                                    value: snapshot.data![index].age),
                                const SizedBox(height: 10),
                                RowKeyValue(
                                    mykey: 'Phone',
                                    value: snapshot.data![index].phone),
                                const SizedBox(height: 10),
                                RowKeyValue(
                                    mykey: 'Email Address',
                                    value: snapshot.data![index].email),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        dbHelper!
                                            .delete(snapshot.data![index].id!);
                                        notesList = dbHelper!.getNotesList();
                                        snapshot.data!
                                            .remove(snapshot.data![index]);
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    child: const Text('Delete'))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
