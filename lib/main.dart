import 'package:flutter/material.dart';
import 'package:tasks/data/task_inherited.dart';
import 'package:tasks/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskInherited(
        child: const HomeScreen(),
      ),
    );
  }
}
