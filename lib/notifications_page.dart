import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the AppBar and the extra title from here
      body: const Center(
        child: Text(
          'This is the Notifications page.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

