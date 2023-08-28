import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_todo/provider/todo_provider.dart';

import 'addTodo_page.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoProvider>(context).todoList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Todo-Home"),
        centerTitle: true,
      ),
      body: todoList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("No Task created yet"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => AddTodoPage()));
                      },
                      child: const Text("Add Task")),
                ],
              ),
            )
          : ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                final todo = todoList[index];
                return ListTile(
                  title: Text(todo.title),
                  leading: Checkbox(
                    value: todo.isDone,
                    onChanged: (_) =>
                        Provider.of<TodoProvider>(context, listen: false)
                            .toggleTaskStatus(index),
                  ),
                );
              }),
    );
  }
}
