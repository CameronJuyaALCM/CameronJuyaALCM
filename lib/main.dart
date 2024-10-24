import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'navbar.dart';
import 'notifications_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';
import 'workflows_page.dart';
import 'dashboard_page.dart';
import 'api_status_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? _selectedBottomNavIndex = 0; // Set a default valid index
  String? _selectedMenu; // Track the selected menu from the navbar
  final PanelController _panelController = PanelController(); // Controller for the sliding panel

  final List<Widget> _bottomNavPages = [
    const NotificationsPage(),
    const ProfilePage(),
    const SettingsPage(),
  ];

  // Function to handle bottom navigation tap
  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedBottomNavIndex = index;
      _selectedMenu = null; // Clear the selected navbar page when navigating to bottom nav
    });
    _panelController.close(); // Close the panel after selecting an item
  }

  // Function to get the correct content to display (based on navbar or bottom nav selection)
  Widget _getPageContent() {
    if (_selectedMenu == null) {
      // When no navbar page is selected, show the bottom nav page based on _selectedBottomNavIndex
      return _bottomNavPages[_selectedBottomNavIndex!];
    } else {
      // When a navbar page is selected, show the respective navbar page
      switch (_selectedMenu) {
        case 'Dashboard':
          return const DashboardPage();
        case 'API & Website Status':
          return const ApiStatusPage();
        case 'Workflows':
          return const WorkflowsPage();
        default:
          return const DashboardPage();
      }
    }
  }

  // Function to get the correct title for the AppBar
  String _getPageTitle() {
    if (_selectedMenu != null) {
      return _selectedMenu!; // Return the name of the selected navbar page
    } else {
      switch (_selectedBottomNavIndex) {
        case 0:
          return 'Notifications';
        case 1:
          return 'Profile';
        case 2:
          return 'Settings';
        default:
          return 'API & Website Tracker';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: NavBar(
          selectedMenu: _selectedMenu,
          onMenuItemSelected: (menuItem) {
            setState(() {
              _selectedMenu = menuItem;
              _selectedBottomNavIndex = 0; // Reset the bottom nav when a navbar page is selected
            });
          },
        ),
        appBar: AppBar(
          title: Text(
            _getPageTitle(), // Dynamic page title
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF19264C), // Dark blue color
          iconTheme: const IconThemeData(color: Colors.white),
          toolbarHeight: 50.0, // Adjust toolbar height to minimize space
        ),
        body: Stack(
          children: [
            _getPageContent(), // Show the correct content based on navbar or bottom nav selection
            if (_selectedMenu != null)
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () => _panelController.open(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    color: const Color(0xFF001A31),
                    child: const Center(
                      child: Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        bottomNavigationBar: _selectedMenu == null
            ? BottomNavigationBar(
                currentIndex: _selectedBottomNavIndex!, // Valid index (never -1)
                onTap: _onBottomNavTapped, // Handle taps on the bottom nav
                backgroundColor: const Color(0xFF001A31), // Dark blue background
                selectedItemColor: const Color(0xFFE5A20C), // Selected item color (yellow)
                unselectedItemColor: const Color(0xFFCCE3F5), // Unselected item color (light blue)
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: 'Notifications',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle),
                    label: 'Profile',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
              )
            : null, // Hide BottomNavigationBar when a Navbar page is selected
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _selectedMenu != null
            ? SlidingUpPanel(
                controller: _panelController,
                maxHeight: 100, // Maximum height of the bottom navigation bar
                minHeight: 0, // Initially collapsed
                panel: BottomNavigationBar(
                  currentIndex: _selectedBottomNavIndex!, // Valid index (never -1)
                  onTap: _onBottomNavTapped, // Handle taps on the bottom nav
                  backgroundColor: const Color(0xFF001A31), // Dark blue background
                  selectedItemColor: const Color(0xFFE5A20C), // Selected item color (yellow)
                  unselectedItemColor: const Color(0xFFCCE3F5), // Unselected item color (light blue)
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.notifications),
                      label: 'Notifications',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}


















