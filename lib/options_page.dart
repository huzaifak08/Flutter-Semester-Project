import 'package:flutter/material.dart';
import 'package:semester_project/Widgets/container_widget.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildContainer(
                  title: 'Islamabad',
                  imagePath: 'assets/islamabad.png',
                  color: const Color(0xFF8FC6FD),
                ),
                BuildContainer(
                  title: 'KPK',
                  imagePath: 'assets/kpk.png',
                  color: Colors.yellow,
                ),
              ],
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildContainer(
                  imagePath: 'assets/punjab.png',
                  color: const Color(0xFFA18CD1),
                  title: 'Punjab',
                ),
                BuildContainer(
                  imagePath: 'assets/sindh.png',
                  color: const Color(0xFFEE4D5F),
                  title: 'Sindh',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
