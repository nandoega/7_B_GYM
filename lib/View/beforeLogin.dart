import 'package:flutter/material.dart';
import 'package:pbp/View/login.dart';
import 'package:pbp/View/register.dart';

class BeforeLoginView extends StatelessWidget {
  const BeforeLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282A41), // Background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              const SizedBox(height: 20),
              const Text(
                'Atma Gym',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Log in to explore more',
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
                  const SizedBox(width: 15), // Gap between boxes
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
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return _buildTrainerBox('Trainer ${index + 1}');
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
                height: 100,
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
              const Spacer(),

              // Login and Register Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildRoundedActionButton(
                    'Login',
                    const Color(0xFFEAC009),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginView()),
                    ),
                    textColor: Colors.black,
                  ),
                  const SizedBox(width: 20), // Gap between buttons
                  _buildRoundedActionButton(
                    'Register',
                    const Color(0xFF3951BD),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterView()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget for Sports Class and Equipment
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
              fontSize: 20, // Bigger font
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Helper Widget for Personal Trainer
  Widget _buildTrainerBox(String name) {
    return Container(
      width: 100,
      height: 100,
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

  // Helper Widget for Equipment
  Widget _buildEquipmentBox(String title) {
    return Container(
      width: 100,
      height: 100,
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

  // Helper Widget for Rounded Buttons
  Widget _buildRoundedActionButton(
      String title, Color color, VoidCallback onPressed,
      {Color textColor = Colors.white}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
