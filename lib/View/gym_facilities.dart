import 'package:flutter/material.dart';

class GymFacilitiesView extends StatelessWidget {
  const GymFacilitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fasilitas Gym'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Fasilitas Gym Kami:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(Icons.check, color: Colors.blueAccent),
              title: Text('Alat Kardio (Treadmill, Sepeda Statis)'),
            ),
            const ListTile(
              leading: Icon(Icons.check, color: Colors.blueAccent),
              title: Text('Ruangan Angkat Beban'),
            ),
            const ListTile(
              leading: Icon(Icons.check, color: Colors.blueAccent),
              title: Text('Kelas Kebugaran (Zumba, Yoga)'),
            ),
            const ListTile(
              leading: Icon(Icons.check, color: Colors.blueAccent),
              title: Text('Ruang Ganti dan Loker'),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              child: const Text('Kembali', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
