// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Trainer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF282C3A),
      ),
      home: const PersonalTrainerList(),
    );
  }
}

class PersonalTrainer {
  String fullName;
  String speciality;
  double fee;

  PersonalTrainer({
    required this.fullName,
    required this.speciality,
    required this.fee,
  });
}

class PersonalTrainerList extends StatefulWidget {
  const PersonalTrainerList({super.key});

  @override
  State<PersonalTrainerList> createState() => _PersonalTrainerListState();
}

class _PersonalTrainerListState extends State<PersonalTrainerList> {
  List<PersonalTrainer> trainers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Trainer',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF282C3A),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Look for personal trainer here...',
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: trainers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF3F51B5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(
                        '${index + 1} - ${trainers[index].fullName}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.white),
                            onPressed: () => _editTrainer(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white),
                            onPressed: () => _showDeleteDialog(index),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: _addNewTrainer,
            child: const Text(
              'Add new personal trainer',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addNewTrainer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditTrainerScreen(
          onSave: (trainer) {
            setState(() {
              trainers.add(trainer);
            });
          },
        ),
      ),
    );
  }

  void _editTrainer(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditTrainerScreen(
          trainer: trainers[index],
          onSave: (trainer) {
            setState(() {
              trainers[index] = trainer;
            });
          },
        ),
      ),
    );
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete ${trainers[index].fullName}?'),
          content: Text('Press "confirm" to delete ${trainers[index].fullName}.'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green,
              ),
              onPressed: () {
                setState(() {
                  trainers.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}

class AddEditTrainerScreen extends StatefulWidget {
  final PersonalTrainer? trainer;
  final Function(PersonalTrainer) onSave;

  const AddEditTrainerScreen({
    super.key,
    this.trainer,
    required this.onSave,
  });

  @override
  State<AddEditTrainerScreen> createState() => _AddEditTrainerScreenState();
}

class _AddEditTrainerScreenState extends State<AddEditTrainerScreen> {
  late TextEditingController _nameController;
  late TextEditingController _specialityController;
  late TextEditingController _feeController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.trainer?.fullName ?? '');
    _specialityController = TextEditingController(text: widget.trainer?.speciality ?? '');
    _feeController = TextEditingController(
      text: widget.trainer?.fee.toString() ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Trainer'),
        backgroundColor: const Color(0xFF282C3A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Full Name:',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Speciality:',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _specialityController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Fee:',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _feeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  final trainer = PersonalTrainer(
                    fullName: _nameController.text,
                    speciality: _specialityController.text,
                    fee: double.tryParse(_feeController.text) ?? 0.0,
                  );
                  widget.onSave(trainer);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _specialityController.dispose();
    _feeController.dispose();
    super.dispose();
  }
}