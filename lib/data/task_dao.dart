import 'package:sqflite/sqflite.dart';
import 'package:tasks/data/database.dart';

import '../components/task.dart';

class TaskDao {
  static const String _tableName = "TaskTable";
  static const String _name = "name";
  static const String _difficulty = "difficulty";
  static const String _image = "image";

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  save(Task task) async {
    final Database database = await getDataBase();
    var taskExists = await find(task.name);
    Map<String, dynamic> taskMap = toMap(task);
    if (taskExists.isEmpty) {
      return await database.insert(_tableName, taskMap);
    } else {
      return await database.update(
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [task.name],
      );
    }
  }

  Future<List<Task>> findAll() async {
    final Database database = await getDataBase();
    final List<Map<String, dynamic>> result = await database.query(_tableName);
    return toList(result);
  }

  Future<List<Task>> find(String name) async {
    final Database database = await getDataBase();
    final List<Map<String, dynamic>> result = await database.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [name],
    );
    return toList(result);
  }

  delete(String name) async {
    final Database database = await getDataBase();
    return database.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [name],
    );
  }

  List<Task> toList(List<Map<String, dynamic>> taskList) {
    final List<Task> tasks = [];
    for (Map<String, dynamic> row in taskList) {
      final Task task = Task(row[_name], row[_image], row[_difficulty]);
      tasks.add(task);
    }
    return tasks;
  }

  Map<String, dynamic> toMap(Task task) {
    final Map<String, dynamic> map = {};
    map[_name] = task.name;
    map[_image] = task.image;
    map[_difficulty] = task.difficulty;
    return map;
  }
}
