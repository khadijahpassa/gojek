import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/ui/onboarding/components/onboarding_content.dart';

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
      "title": "Welcome to Gojek!",
      "subtitle": "Your go-to app for a hassle-free life. We're here to help all your needs, anytime and anywhere",
    },
    {
      "image": "assets/images/splash_2.png",
      "title": "Transport & logistics",
      "subtitle": "Daily commute and goods delivery made easy.",
    },
    {
      "image": "assets/images/splash_3.png",
      "title": "Order food & groceries",
      "subtitle": "Either needs or cravings, we got you covered.",
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
                    label: const Text("English"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: darkGrey
                    ),
                  )
                ],
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                    width: double.infinity, //biar di tengah dengan titik koor 0.0
                    child: PageView.builder( //nampung data slide, builder: membangun data
                        controller: _pageController, 
                        onPageChanged: (value) {
                          // initial state method for statefulWidget behavior. method yang meng-set state awal untuk perilaku statefulWidget, ketika kita mau mengawali statefulWidget dengan apa
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: onboardingData.length, //memberikan batasan slide, length: definisi panjang array(data)
                        // sebagai adapter antara splashData & SplashContent 
                        itemBuilder: (context, index) => OnboardingContent( //context: memperkenalkan dlu kalo ini tuh punya body.dart, index: akses list data array
                            title: onboardingData[index]["title"]!, 
                            subtitle: onboardingData[index]["subtitle"]!, 
                            image: onboardingData[index]["image"]!),
                     ),
                  ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingData.length, //List.generate(untuk menghasilkan jumlah widget dots sesuai dengan panjang data splashData)
                      (index) => _dotsIndicator(index: index)  //mengakses index untuk menentukan posisi dot yang aktif
                    )
                ),
              ),
          
              ElevatedButton(
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: const Size(double.infinity, 42),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: white
                  ),
                ),
              ),
              const SizedBox(height: 10),
              
              ElevatedButton(
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 42),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: primaryColor)
                  )
                ),
                child: const Text(
                  "I'm new, sign me up",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text.rich(
                TextSpan(
                    children: [
                        TextSpan(
                            text: 'By logging in or registering, you agree to our ',
                            style: TextStyle(
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                            ),
                        ),
                        TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                            ),
                        ),
                        TextSpan(
                            text: ' and ',
                            style: TextStyle(
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                            ),
                        ),
                        TextSpan(
                            text: 'Privacy policy',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                            ),
                        ),
                        TextSpan(
                            text: '.',
                            style: TextStyle(
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                            ),
                        ),
                    ],
                ),
            )
            ],
          ),
        )
      ),
    );
  }
  
  AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      duration: animationDuration,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // dots halaman yang aktif, warnanya jadi primary
        color: currentPage == index ? primaryColor : lightGrey,
      ),
      width: currentPage == index ? 20 : 10,
      height: 10,
    );
  }
}