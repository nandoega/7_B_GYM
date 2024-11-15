import 'package:flutter/material.dart';
import 'payment.dart'; // Import the PaymentScreen
import 'login.dart'; // Import the LoginView

class ProfileView extends StatelessWidget {
  final Map<String, dynamic> data;

  const ProfileView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C2B5E),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Color(0xFF2C2B5E),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Card
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 5,
                child: Container(
                  width: double.infinity, // Makes the card take full width
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 16.0),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(data['profileImage'] ?? ''),
                            radius: 50,
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        data['name'] ?? 'Name',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        data['email'] ?? 'email@example.com',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Icon Buttons (History, Payment, Schedule)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFeatureButton(context, Icons.history, 'History', () {}),
                  _buildFeatureButton(
                    context,
                    Icons.payment,
                    'Payment',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentScreen()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildFeatureButton(
                      context, Icons.schedule, 'Schedule', () {}),
                ],
              ),
              SizedBox(height: 30),

              // Action Buttons (Log Out and Delete Account)
              _buildActionButton(context, 'Log Out', Colors.red, () {
                _showLogoutDialog(context);
              }),
              SizedBox(height: 10),
              _buildActionButton(
                  context, 'Delete Account', Colors.redAccent, () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureButton(
      BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Center(
              child: Icon(icon, size: 50, color: Colors.black),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      BuildContext context, String label, Color color, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Log Out"),
          content: Text("Are you sure you want to log out?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
