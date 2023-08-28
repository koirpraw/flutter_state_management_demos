import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/model/todo_model.dart';

import '../provider/todo_provider.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({Key? key}) : super(key: key);

  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // creating an instance of TodoProvider called task
    // we will use this instance to call the addTask method below to add a new task
    // we are using listen: false because we don't want to rebuild the widget tree
    final task = Provider.of<TodoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task"), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: "task title",
                  hintText: "Enter your todo task here",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                controller: titleController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      task.addTask(Todo(title: titleController.text));
                      // we are adding task title using addTask method defined in TodoProvider
                      // The title will be passed back to the TodoHomePage through already defined constructor with the help of Navigator.pop method

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
