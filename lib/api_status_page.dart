import 'package:flutter/material.dart';

class ApiStatusPage extends StatelessWidget {
  const ApiStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the AppBar and the extra title from here
      body: const Center(
        child: Text(
          'This is the API & Website Status page.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

