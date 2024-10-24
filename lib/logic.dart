// logic.dart

import 'package:flutter/material.dart';
import 'ui.dart'; // Import the UI components from ui.dart

void main() {
  runApp(const HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  const HelloWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alchem Technologies',
      theme: appTheme(), // Use the theme defined in ui.dart
      home: const NameInputPage(),
    );
  }
}

// Page where the user enters their name
class NameInputPage extends StatefulWidget {
  const NameInputPage({super.key});

  @override
  _NameInputPageState createState() => _NameInputPageState();
}

class _NameInputPageState extends State<NameInputPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(), // Use the AppBar from ui.dart
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please enter your name:',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),
            buildTextField(_controller), // Use the TextField from ui.dart
            const SizedBox(height: 20),
            buildButton('Done', () {
              if (_controller.text.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelloWorldHomePage(
                      name: _controller.text,
                    ),
                  ),
                );
              }
            }), // Use the button from ui.dart
          ],
        ),
      ),
    );
  }
}

// Page that greets the user with their name
class HelloWorldHomePage extends StatelessWidget {
  final String name;

  const HelloWorldHomePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(), // Use the AppBar from ui.dart
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildGreetingText(name), // Use the greeting text from ui.dart
            const SizedBox(height: 20),
            buildButton('Back', () {
              Navigator.pop(context); // Navigate back to the name input page
            }), // Use the button from ui.dart
          ],
        ),
      ),
    );
  }
}
