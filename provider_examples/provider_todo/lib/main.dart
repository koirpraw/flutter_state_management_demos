import "package:flutter/material.dart";

void main() {
  runApp(const TodoProviderApp());
}

class TodoProviderApp extends StatelessWidget {
  const TodoProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const TodoHomePage();
  }
}

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Provider Todo-Home"),
        ),
        body: const Center(child: Text("Todo Home")),
      ),
    );
  }
}
