import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ProviderApp());
}

// this is the provider class that keeps track of the count(state)
// here notifuListeners() is used to notify the listeners that the state has changed.
// anytime the state changes(incerement/decrement) the listeners are notified and the UI is updated.

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get countValue => _count;

  void incrementCounter() {
    _count++;
    notifyListeners();
  }

  void decrementCounter() {
    _count--;
    notifyListeners();
  }
}

// Here aere are wrapping the whole app with the provider that way we can access the provider anywhere in the app.
// In our case we are accessing the provider in the home screen and second screen.
// The change notifier provider is used to provide the state to the widgets.
// if we were tracking multiple states we would have used the multiprovider. we can provide multiple change notifiers to the multiprovider.
// the multiprovider is used to provide multiple states to the widgets.

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MaterialApp(home: HomeScreen()),
    );
  }
}

// here counter is the instance of the provider class that we created above.
// we are using the provider.of(context) to access the provider.
// we can use the intance in any screen by using the provider.of(context) method.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Counter"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Current Count is:"),
          const SizedBox(
            height: 24,
          ),
          Text(
            "${counter.countValue}",
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    counter.incrementCounter();
                  },
                  child: const Text("Increment")),
              ElevatedButton(
                  onPressed: () {
                    counter.decrementCounter();
                  },
                  child: const Text("Decrement")),
            ],
          ),
          const SizedBox(
            height: 48,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondPage()));
                  },
                  child: const Text("Second Page"))
            ],
          )
        ],
      )),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Last saved Count is:"),
          const SizedBox(
            height: 24,
          ),
          Text("${counter.countValue}")
        ],
      )),
    );
  }
}
