import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:semester_project/Widgets/navigator_widget.dart';
import 'package:semester_project/Widgets/pdf_license_row_widget.dart';
import 'package:semester_project/view_data_page.dart';

class GeneratedLicensePage extends StatelessWidget {
  String imagePath;
  String title;
  String name;
  String cnic;
  String age;
  String phone;
  String email;
  GeneratedLicensePage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.name,
    required this.cnic,
    required this.age,
    required this.phone,
    required this.email,
  });

  DateTime dateTime = DateTime.now();

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
                      child: Image.asset(imagePath),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '$title Traffic Police',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 44),
          child: Column(
            children: [
              const Text(
                'YOUR LEARNER CERTIFICATE',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              const Divider(height: 10, thickness: 2),
              const SizedBox(height: 32),
              RowKeyValue(mykey: 'Name', value: name),
              const SizedBox(height: 32),
              RowKeyValue(mykey: 'CNIC', value: cnic),
              const SizedBox(height: 32),
              RowKeyValue(mykey: 'Age', value: age),
              const SizedBox(height: 32),
              RowKeyValue(mykey: 'Phone', value: phone),
              const SizedBox(height: 32),
              RowKeyValue(mykey: 'Email', value: email),
              const SizedBox(height: 32),
              Text(
                  'Date/Time: ${DateFormat(' yyyy-MM-dd     kk:mm').format(dateTime)}'),
              const SizedBox(height: 32),
              const Divider(height: 10, thickness: 2),
              const SizedBox(height: 52),
              const Text(
                'Go for driving test after 40 Days',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 52),
              TextButton(
                onPressed: () {
                  nextScreen(context, const ViewDataPage());
                },
                child: const Text('View Your Data in Database'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
