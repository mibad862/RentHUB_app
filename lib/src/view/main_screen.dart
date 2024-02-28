import 'package:flutter/material.dart';
import 'package:rental_app/src/view/home_screen.dart';
import 'package:rental_app/src/view/profile_screen.dart';
import '../widgets/common_navbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const Text('Hello'),
    const ProfileScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CommonBottomNavBar(
          onItemTapped: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          selectedIndex: selectedIndex,
        ),
        body: screens[selectedIndex],
      ),
    );
  }
}
