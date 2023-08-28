import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/model/todo_model.dart';

import '../provider/todo_provider.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({Key? key}) : super(key: key);

  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TodoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("Add Todo")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Title",
                  hintText: "Enter task title",
                ),
                controller: titleController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      task.addTask(
                          Todo(title: titleController.text, isDone: false));

                      Navigator.pop(context, titleController.text);
                    },
                    child: const Text("Add"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
