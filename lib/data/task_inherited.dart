import 'package:flutter/material.dart';
import 'package:tasks/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Study Flutter', 'assets/images/computer.png', 1),
    Task('Study Android', 'assets/images/computer.png', 2),
    Task('Study Dart', 'assets/images/computer.png', 3),
    Task('Study Kotlin', 'assets/images/computer.png', 4),
    Task('Study Java', 'assets/images/computer.png', 5),
    Task('Study Python', 'assets/images/computer.png', 4),
    Task('Study JavaScript', 'assets/images/computer.png', 5),
  ];

  void newTask(String name, String image, int difficulty) {
    taskList.add(Task(name, image, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
