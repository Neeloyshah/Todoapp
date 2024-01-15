import 'package:flutter/material.dart';

class Task {
  final String description;
  bool isDone;

  Task({required this.description, this.isDone = false});
}

class TodoController extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(String description) {
    tasks.add(Task(description: description));
    notifyListeners();
  }

  void toggleTaskDone(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
