import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void editTask(String id, Task newTask) {
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks[index] = newTask;
      notifyListeners();
    }
  }

  void deleteTask(String id) {
    _tasks.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  void toggleDone(String id) {
    final task = _tasks.firstWhere((t) => t.id == id);
    task.isDone = !task.isDone;
    notifyListeners();
  }
}
