import 'package:flutter/material.dart';
import 'package:gojek/bottom_nav.dart';
import 'package:gojek/ui/home/components/search.dart';
import 'package:gojek/ui/home/components/menu_icon.dart';
import 'package:gojek/ui/home/components/poin.dart';
import 'package:gojek/ui/home/components/driver.dart';
import 'package:gojek/ui/home/components/gopay_later.dart';
import 'package:gojek/ui/home/components/gopay.dart';
import 'package:gojek/ui/scanner_paymet/scanner.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    Home(),
    QrScannerScreen() // Profile
  ];

  // function untuk aksi tap pada bottom navbar

  // Fungsi untuk menangani perubahan tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header (tidak scrollable)
          Stack(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/header.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    child: Search(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Pay(),
                  ),
                ],
              ),
            ],
          ),

          // Konten yang bisa di-scroll
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  MenuIcon(),
                  Poin(),
                  Driver(),
                  GopayLater(),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
