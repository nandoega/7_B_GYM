import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104, // Set the height of the navigation bar here
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(25), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BottomNavigationBar(
          elevation: 0, // Removes shadow
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(6), // Adjust padding for the icon
                decoration: BoxDecoration(
                  color: selectedIndex == 0
                      ? const Color(0xFF282A41)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.home,
                      color: selectedIndex == 0 ? Colors.white : Colors.black,
                      size: 40, // Adjusted icon size
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 12, // Adjusted font size
                        fontWeight: FontWeight.bold,
                        color:
                            selectedIndex == 0 ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(6), // Adjust padding for the icon
                decoration: BoxDecoration(
                  color: selectedIndex == 1
                      ? const Color(0xFF282A41)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.schedule,
                      color: selectedIndex == 1 ? Colors.white : Colors.black,
                      size: 40, // Adjusted icon size
                    ),
                    Text(
                      'Schedule',
                      style: TextStyle(
                        fontSize: 12, // Adjusted font size
                        fontWeight: FontWeight.bold,
                        color:
                            selectedIndex == 1 ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(6), // Adjust padding for the icon
                decoration: BoxDecoration(
                  color: selectedIndex == 2
                      ? const Color(0xFF282A41)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.settings,
                      color: selectedIndex == 2 ? Colors.white : Colors.black,
                      size: 40, // Adjusted icon size
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 12, // Adjusted font size
                        fontWeight: FontWeight.bold,
                        color:
                            selectedIndex == 2 ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              label: '',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
