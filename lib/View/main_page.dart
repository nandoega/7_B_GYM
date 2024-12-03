import 'package:flutter/material.dart';
import 'profile_view.dart';
import 'navbar.dart';
import 'personal_trainer_view.dart';

class MainPage extends StatefulWidget {
  final String name;
  final String email;
  final String profileImage;

  const MainPage({
    super.key,
    required this.name,
    required this.email,
    required this.profileImage,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> get _widgetOptions => [
        const MainPageContent(),
        const Center(
          child: Text(
            'This page is under construction.',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        ProfileView(
          name: widget.name,
          email: widget.email,
          profileImage: widget.profileImage,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282A41),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class MainPageContent extends StatelessWidget {
  const MainPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, Vero!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ready to be better with us?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50),

            // Sports Class Section
            const Text(
              'Sports Class',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryBox('Workouts', const Color(0xFF3951BD)),
                const SizedBox(width: 15),
                _buildCategoryBox('Gym', const Color(0xFF3951BD)),
              ],
            ),
            const SizedBox(height: 30),

            // Personal Trainer Section
            const Text(
              'Personal Trainer',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalTrainerView(
                            trainerData: {
                              'name': 'Trainer ${index + 1}',
                              'experience': '5 Years',
                              'rating': '4.9',
                              'speciality': 'Speciality Info',
                              'image': 'https://via.placeholder.com/150',
                            },
                          ),
                        ),
                      );
                    },
                    child: _buildTrainerBox('Trainer ${index + 1}'),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),

            // Available Equipment Section
            const Text(
              'Available Equipment',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildEquipmentBox([
                    'Matress',
                    'Cardio',
                    'Boxing Gloves',
                    'Treadmill',
                    'Kettlebell'
                  ][index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBox(String title, Color color) {
    return Expanded(
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTrainerBox(String name) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildEquipmentBox(String title) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
