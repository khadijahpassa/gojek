import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar(
      {super.key,
      required this.selectedIndex, // untuk mngeasih tau index yang dipilih, wadah utama
      required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: primaryColor,
      unselectedItemColor: lightGrey, // Warna untuk item yang tidak dipilih
      backgroundColor: Colors.white, // Warna latar belakang navbar
      type: BottomNavigationBarType.fixed, // Pastikan ukuran item tetap
      onTap: onItemTapped,
    );
  }
}
