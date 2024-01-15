import 'controller/task_model.dart';

import 'package:flutter/material.dart';

class Task {
  final String description;
  bool isDone;

  Task({required this.description, this.isDone = false});
}
