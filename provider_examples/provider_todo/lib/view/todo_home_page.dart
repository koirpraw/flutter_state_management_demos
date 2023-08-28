import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_todo/provider/todo_provider.dart';

import 'addTodo_page.dart';

// ignore: must_be_immutable
class TodoHomePage extends StatelessWidget {
  TodoHomePage({super.key, required this.title});
  late String title;
// this title is passed from the AddTodoPage through Navigator.pop method when user adds a new task
  @override
  Widget build(BuildContext context) {
    // here we are creating an instance of TodoProvider called todoList which will be used to get the list of tasks
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
                  title: todo.isDone
                      ? Text(
                          todo.title,
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                        )
                      : Text(todo.title),
                  leading: Checkbox(
                    value: todo.isDone,
                    onChanged: (_) =>
                        Provider.of<TodoProvider>(context, listen: false)
                            .toggleTaskStatus(index),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddTodoPage()));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
