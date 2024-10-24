import 'package:flutter/material.dart';

void main() {
  runApp(const HelloWorldApp()); // Added const here
}

// This is the root widget of the application.
class HelloWorldApp extends StatelessWidget {
  const HelloWorldApp({super.key}); // Added const constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alchem Technologies',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // Theme can't be const because it's dynamic
        useMaterial3: true,
      ),
      home: const HelloWorldHomePage(), // Added const here
    );
  }
}

// This is the stateful widget for the home page.
class HelloWorldHomePage extends StatefulWidget {
  const HelloWorldHomePage({super.key}); // Added const constructor

  @override
  State<HelloWorldHomePage> createState() => _HelloWorldHomePageState();
}

// This is the state class that manages the state of the HelloWorldHomePage.
class _HelloWorldHomePageState extends State<HelloWorldHomePage> {
  String greeting = '';

  // This function updates the greeting string when called.
  void _showGreeting() {
    setState(() {
      greeting = 'Hello Cameron'; // This can't be const since it changes during runtime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alchem Technologies'), // Added const here
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: const <Widget>[
          Padding( // Added const here
            padding: EdgeInsets.all(8.0), // Padding can be const
            child: Center(
              child: Text(
                'Alchem Technologies',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              greeting, // This can't be const as it depends on dynamic state
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20), // Added const here
            ElevatedButton(
              onPressed: _showGreeting, // No const for dynamic functions
              child: const Text('Greet Me'), // Added const here
            ),
          ],
        ),
      ),
    );
  }
}
