import 'package:flutter/material.dart';
import 'package:semester_project/Widgets/navigator_widget.dart';
import 'package:semester_project/form_page.dart';

class BuildContainer extends StatelessWidget {
  String title;
  String imagePath;
  Color color;

  BuildContainer(
      {super.key,
      required this.imagePath,
      required this.color,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 200,
        width: 140,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(23))),
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: color,
                    border: Border.all(
                      width: 2,
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(23))),
                child: Image.asset(imagePath),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              )
              // ElevatedButton(onPressed: () {}, child: Text('check')),
            ],
          ),
        ),
      ),
      onTap: () {
        nextScreen(
            context,
            FormPage(
              title: title,
              imagePath: imagePath,
            ));
      },
    );
  }
}
