import 'package:flutter/material.dart';
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
        debugShowCheckedModeBanner: false,
        title: 'Gojek',
        theme: ThemeData(
          fontFamily: 'SF-Pro',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          // format pasangan key : value adalah => nama rute : kelas yang dituju
          '/' : (context) => const SplashScreen(),
        },
      );
  }
}