import 'package:flutter/material.dart';
import 'package:neat_test_app/screens/home_screen.dart';
import 'package:neat_test_app/screens/my_bookings_screen.dart';
import 'package:neat_test_app/screens/profile_screen.dart';
import 'package:neat_test_app/screens/settings_screen.dart';
import 'package:neat_test_app/screens/chat_screen.dart';
// import 'package:neat_test_app/screens/payment_options_screen.dart';
import 'package:neat_test_app/widgets/custom_navbar_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(
      selectedIndex: 0,
      onItemTapped: (int value) {},
    ),
    MyBookingsPage(),
    SettingsScreen(),
    ProfileScreen(),
    ChatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
