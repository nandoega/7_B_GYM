// gym_equipment_view.dart
import 'package:flutter/material.dart';

class GymEquipmentView extends StatelessWidget {
  const GymEquipmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alat Gym')),
      body: const Center(
        child: Text('Ini adalah halaman Alat Gym.'),
      ),
    );
  }
}
