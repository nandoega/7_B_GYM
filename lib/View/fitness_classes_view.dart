// fitness_classes_view.dart
import 'package:flutter/material.dart';

class FitnessClassesView extends StatelessWidget {
  const FitnessClassesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kelas Kebugaran')),
      body: const Center(
        child: Text('Ini adalah halaman Kelas Kebugaran.'),
      ),
    );
  }
}
