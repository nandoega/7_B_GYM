// personal_trainer_view.dart
import 'package:flutter/material.dart';

class PersonalTrainerView extends StatelessWidget {
  const PersonalTrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Trainer')),
      body: const Center(
        child: Text('Ini adalah halaman Personal Trainer.'),
      ),
    );
  }
}
