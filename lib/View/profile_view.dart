import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final Map<String, dynamic> data;

  const ProfileView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${data['name']}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Username: ${data['username']}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Email: ${data['email']}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Phone Number: ${data['notelp']}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Date of Birth: ${data['dob']}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Address: ${data['address']}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
