import 'package:flutter/material.dart';
import 'package:7_b_gym/View/view_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
/* selectedIndex berkaitan dengan index halaman pada bottomNavigasi */
  int _selectedIndex = 0;
/* fungsi yang nantinya akan dijalankan setiap menekan menu pada navbar */
  void _onItemTapped(int index) {
    /* setState berkaitan dengan fungsi untuk menampilkan perubahan kondisi di dalam widget */
    setState(() {
      _selectedIndex = index;
    });
  }

/* Menampung List Widget yang akan ditampilkan sesuai index yang dipilih. */
  static const List<Widget> _widgetOptions = <Widget>[
    /* index 0 */
    Center(
      child: Image(image: NetworkImage('https://picsum.photos/200/300')),
    ),
    /* index 1 */
    ListNamaView(), // Jika Error di Comment dulu aja
    /* index 2 */
    Center(
      child: Text(
        'Index 3: Profile',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* setting navigasi bar */
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.list,),label: 'List',),
          BottomNavigationBarItem(icon: Icon(Icons.person,),label: 'Profile',),
        ],
        currentIndex: _selectedIndex, // parameter yang menampung index dari menu navigasi yang ditekan
        onTap: _onItemTapped, /* menjalankan fungsi _onItemTapped, yang dimana fungsi ini akan mengubah selected index berdasarkan item yang dipilih */
      ),
      /* bagian body dari home berdasarkan List _widgetOption berdasarkan index yang dipilih */
      body: _widgetOptions.elementAt(_selectedIndex), // Mengubah tampilan widget berdasarkan index
    );
  }
}
