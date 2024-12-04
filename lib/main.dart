import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:gojek/ui/home/home.dart';
import 'package:gojek/ui/auth/login_screen.dart';
import 'package:gojek/ui/auth/register_screen.dart';
import 'package:gojek/ui/payment/pay_screen.dart';
import 'package:gojek/ui/profile/profile_screen.dart';
import 'package:gojek/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart'; // Gunakan provider

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeProvider()), // Provider untuk tema
      ],
      child: const Gojek(),
    ),
  );
}

class Gojek extends StatelessWidget {
  const Gojek({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider =
        Provider.of<ThemeProvider>(context); // Menggunakan provider untuk tema

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: 'Chat',
      theme: ThemeData(
        brightness:
            themeProvider.isDarkTheme ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor:
            themeProvider.isDarkTheme ? Colors.black : Colors.white,
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
        '/pay': (context) => const PayScreen(),
      },
    );
  }
}
