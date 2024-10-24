// ui.dart

import 'package:flutter/material.dart';

// A reusable AppBar that includes a logo
AppBar buildAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Alchem Technologies'),
        Image.asset(
          'assets/Logo.png', // image path
          height: 40,
        ),
      ],
    ),
    backgroundColor: const Color(0xFF00263E), // Dark blue background
  );
}

// A reusable TextField for user input
Widget buildTextField(TextEditingController controller) {
  return TextField(
    controller: controller,
    style: const TextStyle(color: Colors.white),
    decoration: const InputDecoration(
      filled: true,
      fillColor: Color(0xFF12324D), // Lighter background for the text field
      hintText: 'Enter your name',
      hintStyle: TextStyle(color: Colors.white70),
      border: OutlineInputBorder(),
    ),
  );
}

// A reusable button
Widget buildButton(String label, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFFFC107), // Gold color for the button
    ),
    child: Text(label), // Button label
  );
}

// Centered greeting text
Widget buildGreetingText(String name) {
  return Text(
    'Hello $name',
    style: const TextStyle(fontSize: 24, color: Colors.white),
  );
}

// Basic color scheme setup
ThemeData appTheme() {
  return ThemeData(
    primaryColor: const Color(0xFF00263E), // Dark blue background
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFFC107), // Gold accents
      background: const Color(0xFF00263E), // Background color
    ),
    scaffoldBackgroundColor: const Color(0xFF00263E),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),
    useMaterial3: true,
  );
}
