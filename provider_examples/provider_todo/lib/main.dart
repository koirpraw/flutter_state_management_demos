import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:provider_todo/provider/todo_provider.dart";
import "package:provider_todo/view/todo_home_page.dart";

void main() {
  runApp(const TodoProviderApp());
}

class TodoProviderApp extends StatelessWidget {
  const TodoProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => TodoProvider(),
        child: const MaterialApp(home: TodoHomePage()));
  }
}
