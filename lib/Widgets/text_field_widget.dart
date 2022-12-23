import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String title;
  TextEditingController controller;
  MyTextField({super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12)),
          label: Text(title),
          labelStyle: TextStyle(color: Colors.black),
          fillColor: Color(0xFFA5D1FD),
          // focusColor: Colors.red
          filled: true,
        ),
      ),
    );
  }
}
