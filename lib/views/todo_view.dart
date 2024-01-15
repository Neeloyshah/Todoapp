import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/todo_controller.dart';

class TodoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TO DO APP ASSIGNMENT',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 29.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      body: Stack(
        children: [
          Consumer<TodoController>(
            builder: (context, todoController, child) {
              return ListView.builder(
                itemCount: todoController.tasks.length,
                itemBuilder: (context, index) {
                  final task = todoController.tasks[index];
                  return ListTile(
                    title: Text(task.description),
                    leading: Checkbox(
                      value: task.isDone,
                      onChanged: (_) => todoController.toggleTaskDone(index),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => todoController.deleteTask(index),
                    ),
                  );
                },
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'BY NEELOY',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context, Provider.of<TodoController>(context, listen: false));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context, TodoController todoController) {
    TextEditingController taskController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: taskController,
                decoration: InputDecoration(labelText: 'Task description'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  String description = taskController.text.trim();
                  if (description.isNotEmpty) {
                    todoController.addTask(description);
                    Navigator.pop(context);
                  } else {
                     //Show an error message or handle the empty description case
                     //For simplicity, we'll just print a message for now.
                    print('Task description cannot be empty.');
                  }
                },
                child: Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }
}
