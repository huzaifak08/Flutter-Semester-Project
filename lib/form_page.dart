import 'package:flutter/material.dart';
import 'package:semester_project/SQLite/database_handler.dart';
import 'package:semester_project/SQLite/users_model.dart';
import 'package:semester_project/Widgets/navigator_widget.dart';
import 'package:semester_project/Widgets/text_field_widget.dart';
import 'package:semester_project/generated_license_page.dart';

class FormPage extends StatefulWidget {
  String imagePath;
  String title;
  FormPage({super.key, required this.title, required this.imagePath});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final nameController = TextEditingController();

  final cnicController = TextEditingController();

  final ageController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  DBHelper? dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(85, 85),
        child: SafeArea(
            child: Container(
          height: 100,
          // color: Colors.red,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.transparent),
            borderRadius: BorderRadius.circular(23),
          ),
          child: Card(
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 37,
                  child: ClipOval(
                    child: Image.asset(widget.imagePath),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${widget.title} Traffic Police',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 55),
              MyTextField(
                  title: 'Name',
                  controller: nameController,
                  keyboardType: TextInputType.name),
              const SizedBox(height: 40),
              MyTextField(
                  title: 'CNIC',
                  controller: cnicController,
                  keyboardType: TextInputType.number),
              const SizedBox(height: 40),
              MyTextField(
                  title: 'Age',
                  controller: ageController,
                  keyboardType: TextInputType.number),
              const SizedBox(height: 40),
              MyTextField(
                  title: 'Phone',
                  controller: phoneController,
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 40),
              MyTextField(
                  title: 'Email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 35),
              OutlinedButton(
                onPressed: () {
                  dbHelper!
                      .insert(NotesModel(
                    name: nameController.text,
                    cnic: cnicController.text,
                    age: ageController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                    title: widget.title,
                  ))
                      .then((value) {
                    debugPrint('Data Added');
                  }).onError((error, stackTrace) {
                    debugPrint(error.toString());
                  });

                  nextScreen(
                    context,
                    GeneratedLicensePage(
                      title: widget.title,
                      imagePath: widget.imagePath,
                      name: nameController.text,
                      cnic: cnicController.text,
                      age: ageController.text,
                      phone: phoneController.text,
                      email: emailController.text,
                    ),
                  );
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
