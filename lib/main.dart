import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_doapp/views/todo_view.dart';
import 'controllers/todo_controller.dart';
import 'Models/task_model.dart';

import 'controllers/todo_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoController>(
      create: (context) => TodoController(),
      child: MaterialApp(
        title: 'To-Do App',
        home: TodoView(),
      ),
    );
  }
}
