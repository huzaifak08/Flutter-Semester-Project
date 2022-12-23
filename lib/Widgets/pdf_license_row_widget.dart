import 'package:flutter/material.dart';

class RowKeyValue extends StatelessWidget {
  String mykey;
  String value;
  RowKeyValue({super.key, required this.mykey, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(mykey),
          Text(value),
        ],
      ),
    );
  }
}
