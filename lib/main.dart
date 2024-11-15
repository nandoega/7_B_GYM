import 'package:flutter/material.dart';
import 'package:pbp/View/login.dart';
import 'package:pbp/View/admin.dart'; // Import corrected

void main() {
  runApp(AtmaGymApp());
}

class AtmaGymApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AtmaGymPage(), // Panggil halaman Atma Gym di sini
    );
  }
}




// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: LoginView(), // Fixed: added missing comma
//     );
//   }
// }