import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String title;
  TextEditingController controller;
  TextInputType keyboardType;
  MyTextField(
      {super.key,
      required this.title,
      required this.controller,
      required this.keyboardType});

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
          labelStyle: const TextStyle(color: Colors.black),
          fillColor: const Color(0xFFA5D1FD),
          // focusColor: Colors.red
          filled: true,
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}

InputDecoration textInputDecoration = InputDecoration(
  border: OutlineInputBorder(
      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(12)),
  labelStyle: const TextStyle(color: Colors.black),
  fillColor: const Color(0xFFA5D1FD),
  filled: true,
);
