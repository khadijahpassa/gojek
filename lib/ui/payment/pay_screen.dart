import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> with TickerProviderStateMixin {
  late AnimationController _controller; // Late untuk menghindari error
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Menginisialisasi AnimationController dengan vsync
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Durasi animasi
    )..repeat(reverse: true); // Mengulang animasi dengan arah berlawanan

    _animation = Tween<double>(begin: 0, end: 30).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // menunggu beberapa detik sebelum ke Home screen
    Future.delayed(const Duration(seconds: 3), () {
      // Arahkan ke halaman Home setelah animasi selesai
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Melepas controller agar tetap ringan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value), // Gerakan vertikal
                  child: child,
                );
              },
              child: Image.asset("assets/images/lc_pay.png", width: 200),
            ),
            const SizedBox(height: 60),
            const Text(
              "Thank you for your payment!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
