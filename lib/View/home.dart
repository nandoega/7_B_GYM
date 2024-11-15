import 'package:flutter/material.dart';
import 'package:pbp/View/view_list.dart'; // Import ListNamaView if it's part of your project
import 'profile_view.dart'; // Import ProfileView

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Image(image: NetworkImage('https://picsum.photos/200/300')),
    ),
    ListNamaView(), // Replace with your actual list view widget
    ProfileView(
      data: {
        'name': 'Aiko Evelyn',
        'email': 'aikoevelyn@gmail.com',
        'profileImage':
            'https://example.com/profile.jpg', // Replace with actual image URL
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFF2C2B5E), // Set the background color of the main screen
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _selectedIndex == 0 ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: _selectedIndex == 1 ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: _selectedIndex == 2 ? Colors.white : Colors.black,
                ),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor:
                Colors.transparent, // Transparent to show container color
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
