import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the AppBar and the extra title from here
      body: const Center(
        child: Text(
          'This is the Settings page.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
