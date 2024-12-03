// import 'package:flutter/material.dart';
// import 'package:pbp/View/gym_equipment_view.dart'; // Import halaman alat gym
// import 'package:pbp/View/personal_trainer_view.dart'; // Import halaman personal trainer
// import 'package:pbp/View/fitness_classes_view.dart'; // Import halaman kelas kebugaran

// class ListNamaView extends StatelessWidget {
//   const ListNamaView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pilihan Fasilitas'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const GymEquipmentView()),
//                 );
//               },
//               child: const Text('Alat Gym'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const PersonalTrainerView()),
//                 );
//               },
//               child: const Text('Personal Trainer'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const FitnessClassesView()),
//                 );
//               },
//               child: const Text('Kelas Kebugaran'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
