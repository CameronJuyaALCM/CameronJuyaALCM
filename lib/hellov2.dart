import 'package:flutter/material.dart';

void main() {
  runApp(const HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  const HelloWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alchem Technologies',
      theme: ThemeData(
        // Color scheme based on the screenshot you've shared
        primaryColor: const Color(0xFF00263E), // Dark blue background
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFC107), // Gold/yellow accents
          background: const Color(0xFF00263E), // Background color similar to the screenshot
        ),
        scaffoldBackgroundColor: const Color(0xFF00263E), // Background of the app
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Updated 'bodyText2' to 'bodyMedium'
        ),
        useMaterial3: true,
      ),
      home: const NameInputPage(), // Start with the NameInputPage
    );
  }
}

// This page asks for the user's name
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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Alchem Technologies'),
            // Placeholder for a logo
            Image.network(
              'Logo.png', // logo
              height: 40,
            ),
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
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
            TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFF12324D), // Lighter background for the text field
                hintText: 'Enter your name',
                hintStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Replaced the submit button with "Done"
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HelloWorldHomePage(name: _controller.text),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: const Text('Done'), // Changed label to "Done"
            ),
          ],
        ),
      ),
    );
  }
}

// After entering the name, this page greets the user and includes a back button.
class HelloWorldHomePage extends StatelessWidget {
  final String name;

  const HelloWorldHomePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alchem Technologies'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Alchem Technologies',
                style: TextStyle(fontSize: 16, color: Colors.white),
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
              'Hello $name',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 20),
            // Replaced the greet button with "Back"
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Goes back to the name input page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: const Text('Back'), // Changed label to "Back"
            ),
          ],
        ),
      ),
    );
  }
}
