import 'package:flutter/material.dart';
import 'package:gojek/ui/home/home.dart';
import 'package:gojek/ui/scanner_paymet/scanner.dart';
import 'package:gojek/ui/splash/splash_screen.dart';

void main() => runApp(const Gojek());

class Gojek extends StatefulWidget {
  const Gojek({super.key});

  @override
  State<Gojek> createState() => _GojekState();
}

class _GojekState extends State<Gojek> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: 'Gojek',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'SF-Pro'),
      initialRoute: '/',
      routes: {
        // format pasangan key : value adalah => nama rute : kelas yang dituju
        '/': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        '/scanner': (context) => const QrScannerScreen(),
      },
    );
  }
}
