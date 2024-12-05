import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:gojek/ui/onboarding/components/onboarding_content.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  final PageController _pageController = PageController();
  Timer? _autoSlideTimer;

  // dasar pengambilan data dari API
  List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/splash_1.png",
      "title": "Halo, selamat datang di Gojek!",
      "subtitle":
          "Aplikasi andalan untuk hidup lebih praktis. Gojek siap bantu kebutuhanmu kapan aja, di mana aja!",
    },
    {
      "image": "assets/images/splash_2.png",
      "title": "Transportasi & Kirim Barang",
      "subtitle": "Butuh tumpangan atau kirim paket? Semua bisa diatur dengan Gojek!",
    },
    {
      "image": "assets/images/splash_3.png",
      "title": "Pesan Makanan & Belanja",
      "subtitle": "Lagi laper atau perlu belanja bulanan? Santai, serahin aja ke Gojek!",
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentPage < onboardingData.length - 1) {
        currentPage++;
      } else {
        // Reset ke halaman pertama
        currentPage = 0;
      }
      _pageController.animateToPage(
        currentPage,
        duration: animationDuration,
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/gojek-logo.png"),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.translate_rounded),
                  label: const Text("Indonesia"),
                  style: OutlinedButton.styleFrom(foregroundColor: themeProvider.isDarkTheme ? white : darkGrey),
                )
              ],
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity, //biar di tengah dengan titik koor 0.0
                child: PageView.builder(
                  //nampung data slide, builder: membangun data
                  controller: _pageController,
                  onPageChanged: (value) {
                    // initial state method for statefulWidget behavior. method yang meng-set state awal untuk perilaku statefulWidget, ketika kita mau mengawali statefulWidget dengan apa
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onboardingData
                      .length, //memberikan batasan slide, length: definisi panjang array(data)
                  // sebagai adapter antara splashData & SplashContent
                  itemBuilder: (context, index) => OnboardingContent(
                      //context: memperkenalkan dlu kalo ini tuh punya body.dart, index: akses list data array
                      title: onboardingData[index]["title"]!,
                      subtitle: onboardingData[index]["subtitle"]!,
                      image: onboardingData[index]["image"]!),
                ),
              ),
            ),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      onboardingData
                          .length, //List.generate(untuk menghasilkan jumlah widget dots sesuai dengan panjang data splashData)
                      (index) => _dotsIndicator(
                          index:
                              index) //mengakses index untuk menentukan posisi dot yang aktif
                      )),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: const Size(double.infinity, 42),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              child: const Text(
                'Masuk',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: themeProvider.isDarkTheme ? black : white,
                  minimumSize: const Size(double.infinity, 42),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: themeProvider.isDarkTheme ? white : primaryColor))),
              child: Text(
                "Baru di sini? Daftar yuk!",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.isDarkTheme ? white : primaryColor),
              ),
            ),
            const SizedBox(height: 20),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Dengan masuk atau daftar, kamu setuju dengan ',
                    style: TextStyle(
                      color: themeProvider.isDarkTheme ? white : black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: 'Syarat & Ketentuan',
                    style: TextStyle(
                      color: themeProvider.isDarkTheme ? white : primaryColor,
                      fontSize: 14,
                      fontWeight: themeProvider.isDarkTheme ? FontWeight.bold : FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: ' serta ',
                    style: TextStyle(
                      color: themeProvider.isDarkTheme ? white : black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: 'Kebijakan Privasi',
                    style: TextStyle(
                      color: themeProvider.isDarkTheme ? white : primaryColor,
                      fontSize: 14,
                      fontWeight: themeProvider.isDarkTheme ? FontWeight.bold : FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: ' kami.',
                    style: TextStyle(
                      color: themeProvider.isDarkTheme ? white : black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  AnimatedContainer _dotsIndicator({required int index}) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AnimatedContainer(
      duration: animationDuration,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // dots halaman yang aktif, warnanya jadi primary
        color: currentPage == index ? primaryColor : themeProvider.isDarkTheme ? const Color(0x6FEDEDED) : lightGrey,
      ),
      width: currentPage == index ? 20 : 10,
      height: 10,
    );
  }
}
