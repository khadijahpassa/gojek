import 'package:flutter/material.dart';
import 'package:gojek/ui/home/home.dart';
import 'package:gojek/ui/auth/login_screen.dart';
import 'package:gojek/ui/auth/register_screen.dart';
import 'package:gojek/ui/profile/profile_screen.dart';
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
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'SF-Pro', scaffoldBackgroundColor: Colors.white),
      initialRoute: '/',
      routes: {
        // format pasangan key : value adalah => nama rute : kelas yang dituju
        '/': (context) => const SplashScreen(),

        '/home': (context) => const Home(),
       
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
