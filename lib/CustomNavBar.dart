import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  CustomNavBar({required this.currentIndex, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.black87,
      // backgroundColor: Colors.red, // Uncomment this line if you want to set a background color
      onTap: (index) {
        if (index == currentIndex) {
          // If the tapped index is the current index, don't do anything
          return;
        }

        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/habit');
            break;
          case 2:
            Navigator.pushNamed(context, '/community');
            break;
          case 3:
            Navigator.pushNamed(context, '/story');
            break;
          case 4:
            Navigator.pushNamed(context, '/setting');
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.accessibility),
          label: "Habit",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: "Community",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Story",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Setting",
        ),
      ],
    );
  }
}
