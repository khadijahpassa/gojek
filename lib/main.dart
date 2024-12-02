import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:gojek/ui/home/home.dart';
import 'package:gojek/ui/auth/login_screen.dart';
import 'package:gojek/ui/auth/register_screen.dart';
import 'package:gojek/ui/profile/profile_screen.dart';
import 'package:gojek/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const Gojek(),
    ),
  );
}

class Gojek extends StatelessWidget {
  const Gojek({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: 'Gojek',
      theme: ThemeData(
        brightness:
            themeProvider.isDarkTheme ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor:
            themeProvider.isDarkTheme ? black : Colors.white,
        primarySwatch: Colors.green,
        fontFamily: 'SF-Pro',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}