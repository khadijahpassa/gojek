import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:gojek/ui/promo/components/banner.dart';
import 'package:gojek/ui/promo/components/categories.dart';
import 'package:gojek/ui/promo/components/kode_promo.dart';
import 'package:gojek/ui/promo/components/vouchers.dart';
import 'package:gojek/ui/promo/components/xp.dart';
import 'package:provider/provider.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  
  @override
  Widget build(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  final textColor = themeProvider.isDarkTheme ? Colors.white : black;

  return Scaffold(
  appBar: AppBar(
    backgroundColor: themeProvider.isDarkTheme ? black : Colors.white,
    elevation: 0, // Hilangkan bayangan bawaan
    title: Text(
      'Promo',
      style: TextStyle(
        color: textColor,
        fontSize: 24,
        fontFamily: 'SF Pro',
        fontWeight: FontWeight.w700,
      ),
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        color: themeProvider.isDarkTheme ? black : Colors.white, // Warna latar belakang AppBar
        boxShadow: const [
          BoxShadow(
            color: Colors.black26, // Warna bayangan
            offset: Offset(0, 1), // Posisi bayangan
            blurRadius: 3.0, // Tingkat blur
          ),
        ],
      ),
    ),
  ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding global untuk sebagian besar konten
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Xp(),
                    const SizedBox(height: defaultPadding),
                    const Vouchers(),
                    const SizedBox(height: 15),
                    const KodePromo(),
                    const SizedBox(height: 15),
                    Text(
                      "Promo menarik buat kamu",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              // Categories (Tidak kena padding body)
              const SizedBox(height: 10),
              const Categories(),

              // Text dan BannerScreen (Tidak kena padding body)
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Biar makin hemat",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const BannerScreen(),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: defaultPadding),
                    Image.asset(
                      'assets/images/gopay_logo.png',
                      width: 80,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Promo menarik dari brand populer",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Buat rileks atau produktif, kamu yang tentuin!",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}