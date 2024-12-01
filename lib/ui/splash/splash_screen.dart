import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/ui/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState(); // Memastikan inisialisasi superclass
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen(),
      ));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green1,
      body: Center(
        child: Image.asset('assets/images/gojek-logo-white.png'),
      ),
    );
  }
}