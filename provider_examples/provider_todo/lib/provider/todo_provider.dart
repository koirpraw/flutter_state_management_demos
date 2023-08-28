import 'package:flutter/material.dart';
import 'package:provider_todo/model/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> _todoList = [];

  List<Todo> get todoList => _todoList;

  void addTask(Todo todo) {
    _todoList.add(todo);
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    _todoList[index].isDone = !_todoList[index].isDone;
    notifyListeners();
  }
}
