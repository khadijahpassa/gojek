import 'package:flutter/material.dart';
import 'package:gojek/ui/splash/splash_screen.dart';

class Gojek extends StatefulWidget {
  const Gojek({super.key});

  @override
  State<Gojek> createState() => _GojekState();
}

class _GojekState extends State<Gojek> {
  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}