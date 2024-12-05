import 'package:flutter/material.dart';
import 'package:gojek/ui/promo/components/dots_indicator.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> bannerImages = [
    'assets/images/banner_carousel.png',
    'assets/images/banner_carousel.png',
    'assets/images/banner_carousel.png',
    'assets/images/banner_carousel.png',
    'assets/images/banner_carousel.png',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PageView untuk banner
        SizedBox(
          height: 170, // Ukuran banner yang lebih besar
          width: double.infinity, // Membuat gambar mengisi lebar layar
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: bannerImages.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16), // Margin antar gambar
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(bannerImages[index]),
                    fit: BoxFit.cover, // Membuat gambar memenuhi container
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Dots Indicator
        DotsIndicator(
          currentPage: _currentPage,
          totalDots: bannerImages.length,
        ),
      ],
    );
  }
}