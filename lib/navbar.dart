import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final String? selectedMenu; // Pass the selected menu item from main.dart
  final Function(String) onMenuItemSelected; // Function to call when a menu item is selected

  const NavBar({
    Key? key,
    required this.selectedMenu,
    required this.onMenuItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF132B3C), // Default background color of the drawer
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // User Header
                  UserAccountsDrawerHeader(
                    accountName: const Text('Cameron Juya'),
                    accountEmail: const Text('cameron@alchemtechnologies.com'),
                    decoration: const BoxDecoration(
                      color: Color(0xFF132B3C), // Dark blue for the header
                    ),
                  ),

                  // Dashboard Menu Item
                  _buildMenuItem(
                    title: 'Dashboard',
                    icon: Icons.dashboard,
                    selected: selectedMenu == 'Dashboard', // Check if it's the selected page
                    onTap: () => _navigateToPage(context, 'Dashboard'),
                  ),

                  // API & Website Status Menu Item
                  _buildMenuItem(
                    title: 'API & Website Status',
                    icon: Icons.line_axis,
                    selected: selectedMenu == 'API & Website Status', // Check if it's the selected page
                    onTap: () => _navigateToPage(context, 'API & Website Status'),
                  ),

                  // Workflows Menu Item
                  _buildMenuItem(
                    title: 'Workflows',
                    icon: Icons.arrow_forward_sharp,
                    selected: selectedMenu == 'Workflows', // Check if it's the selected page
                    onTap: () => _navigateToPage(context, 'Workflows'),
                  ),           
                ],
              ),
            ),
            // logo at the bottom

            // white divider above the logo
            const Divider(
              color: Colors.white, // White divider
              thickness: 1.0, // Thickness of the divider
              indent: 20, // Indentation from the left
              endIndent: 20, // Indentation from the right
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 15), // Add some margin for spacing
              width: 350,
              height: 150,
              child: Image.asset(
                'assets/Logo.png',
                fit: BoxFit.cover, // Cover the container's space
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required IconData icon,
    required bool selected,
    required Function onTap,
  }) {
    return Container(
      color: selected ? const Color(0xFF0070CD) : const Color(0xFF132B3C), // Highlight selected item
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        onTap: () => onTap(), // Handle the tap event
      ),
    );
  }

  // Navigate to specific page based on the selected menu item
  void _navigateToPage(BuildContext context, String menuItem) {
    onMenuItemSelected(menuItem); // Call the callback to set the selected page
    Navigator.of(context).pop(); // Close the drawer after selecting an item

    // Navigate to the appropriate page
    if (menuItem == 'Dashboard') {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else if (menuItem == 'API & Website Status') {
      Navigator.pushReplacementNamed(context, '/api_status');
    } else if (menuItem == 'Workflows') {
      Navigator.pushReplacementNamed(context, '/workflows');
    }
  }
}






