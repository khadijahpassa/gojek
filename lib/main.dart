import 'package:flutter/material.dart';
import 'package:gojek/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: 'Gojek',

      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'SF-Pro'),
      home: const SplashScreen(),
    );
  }
}
