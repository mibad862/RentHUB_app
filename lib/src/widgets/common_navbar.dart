import 'package:flutter/material.dart';
import 'package:rental_app/src/utils/colors.dart';

class CommonBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CommonBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedFontSize:  16.0,
      unselectedFontSize: 15.0,
      iconSize: 30.0,
      elevation: 8,
      backgroundColor: AppColors.darkLightBlue, // <-- This works for fixed
      selectedItemColor: AppColors.color5,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: (value){
        onItemTapped(value);
      },
    );
  }
}
