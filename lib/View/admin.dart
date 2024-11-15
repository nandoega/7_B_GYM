import 'package:flutter/material.dart';
import 'package:pbp/View/user.dart';
import 'package:pbp/View/create_workout.dart';
import 'package:pbp/View/sport_class.dart';

class AtmaGymPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 300,
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
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildButton(context, 'User', Colors.blue, UserPage()),
                  _buildButton(context, 'Create Workout', Colors.blue, null),
                  _buildButton(context, 'Sport Class', Colors.yellow, null),
                  _buildButton(context, 'Equipment', Colors.yellow, null), // Tambahkan halaman yang sesuai jika ada
                  _buildButton(context, 'Personal Trainer', Colors.yellow, null), // Tambahkan halaman yang sesuai jika ada
                  _buildButton(context, 'Schedule', Colors.red, null), // Tambahkan halaman yang sesuai jika ada
                  _buildButton(context, 'Review', Colors.white, null), // Tambahkan halaman yang sesuai jika ada
                  _buildButton(context, 'Transaction', Colors.white, null), // Tambahkan halaman yang sesuai jika ada
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan fungsi logout di sini
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

  Widget _buildButton(BuildContext context, String text, Color color, Widget? page) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      child: Container(
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
      ),
    );
  }
}
