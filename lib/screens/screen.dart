import 'package:flutter/material.dart';
import 'package:tasks/components/task.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tasks'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task(
                'Study Flutter',
                'assets/images/computer.png',
                1),
            Task(
                'Study Android',
                'assets/images/computer.png',
                2),
            Task(
                'Study Dart',
                'assets/images/computer.png',
                3),
            Task(
                'Study Kotlin',
                'assets/images/computer.png',
                4),
            Task(
                'Study Java',
                'assets/images/computer.png',
                5),
            Task(
                'Study Python',
                'assets/images/computer.png',
                4),
            Task(
                'Study JavaScript',
                'assets/images/computer.png',
                5),
            SizedBox(
              height: 65,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
