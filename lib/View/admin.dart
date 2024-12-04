import 'package:flutter/material.dart';
import 'package:pbp/View/user.dart'; 
import 'package:pbp/View/workout_class.dart';// Import the UserPage

class AtmaGymPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 405,
          decoration: BoxDecoration(
            color: Color(0xFF2A2A3A),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Atma Gym',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // Wrap the GridView in an Expanded widget to prevent overflow
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    // Add navigation for the "User" button
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserPage()),
                        );
                      },
                      child: 
                      _buildButton('User', Colors.blue),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WorkoutClassPage()),
                        );
                      },
                      child: 
                      _buildButton('Create Workout', Colors.blue),
                    ),

                    
                    _buildButton('Sport Class', Colors.yellow),
                    _buildButton('Equipment', Colors.yellow),
                    _buildButton('Personal Trainer', Colors.yellow),
                    _buildButton('Schedule', Colors.red),
                    _buildButton('Review', Colors.white),
                    _buildButton('Transaction', Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add logout functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text('Log Out', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color == Colors.white ? Colors.black : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}