import 'package:flutter/material.dart';
import 'package:pbp/View/login.dart'; // Import corrected

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginView(), // Fixed: added missing comma
    );
  }
}