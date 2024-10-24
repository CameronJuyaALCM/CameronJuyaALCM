import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alchem Mercury',
      theme: ThemeData(
        primaryColor: Color(0xFF001A31), // primary color
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFF59C2FA), // Use colorScheme.secondary
        ),
        scaffoldBackgroundColor: Color(0xFF001A31), // background color
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Color(0xFFCCE3F5)), // Updated to bodyMedium
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF001A31),
        title: Text('Welcome Cameron', style: TextStyle(color: Color(0xFFCCE3F5))),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Color(0xFF59C2FA)),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xFF001A31),
              child: Column(
                children: [
                  Expanded(
                    child: PlaceholderBox(),
                  ),
                  Expanded(
                    child: PlaceholderBox(),
                  ),
                  Expanded(
                    child: PlaceholderBox(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Color(0xFF1E364A),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrawerTile(title: 'Dashboard', isActive: true),
                  DrawerTile(title: 'API & Website Status'),
                  DrawerTile(title: 'Workflows'),
                  DrawerTile(title: 'Notifications'),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/alchem_mercury_logo.png', // Add your logo asset here
                        height: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class PlaceholderBox extends StatelessWidget {
  const PlaceholderBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xFF152B3C),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Color(0xFFD1D5DB)),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title;
  final bool isActive;

  const DrawerTile({super.key, required this.title, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      color: isActive ? Color(0xFF57B4FF) : Color(0xFF1E364A),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Color(0xFFCCE3F5),
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF001A31),
      selectedItemColor: Color(0xFFE5A20C),
      unselectedItemColor: Color(0xFFCCE3F5),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, color: Color(0xFFE5A20C)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, color: Color(0xFFE5A20C)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: Color(0xFFE5A20C)),
          label: '',
        ),
      ],
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF001A31),
            ),
            child: Text(
              'Alchem Mercury',
              style: TextStyle(
                color: Color(0xFFCCE3F5),
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard, color: Color(0xFF59C2FA)),
            title: Text('Dashboard', style: TextStyle(color: Color(0xFFCCE3F5))),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.api, color: Color(0xFF59C2FA)),
            title: Text('API & Website Status', style: TextStyle(color: Color(0xFFCCE3F5))),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.work, color: Color(0xFF59C2FA)),
            title: Text('Workflows', style: TextStyle(color: Color(0xFFCCE3F5))),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Color(0xFF59C2FA)),
            title: Text('Notifications', style: TextStyle(color: Color(0xFFCCE3F5))),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
