import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:provider/provider.dart';

class Vouchers extends StatelessWidget {
  const Vouchers({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final textColor = themeProvider.isDarkTheme ? Colors.white : black;

    return SafeArea(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 109,
                height: 92, // Tinggi container diperbesar sedikit
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 7), // Spasi dalam
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "13",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 20,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      ],
                    ),
                    const SizedBox(height: 4), // Spasi antara row atas dan teks tambahan
                    Text(
                      "Voucher",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 10,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Menjaga teks tetap di kiri
                      children: [
                        Text(
                          "13 akan hangus",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          height: 4,
                          width: double.infinity, // Mengatur LinearProgressIndicator agar melebar
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const LinearProgressIndicator(
                            color: primaryColor,
                            value: 10,
                          ),
                        ),
                      ],
                    ),
                  ]
              ),
              )
            ],
          ),
        const SizedBox(width: 10),
          Column(
            children: [
              Container(
                width: 109,
                height: 92, // Tinggi container diperbesar sedikit
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 7), // Spasi dalam
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 20,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      ],
                    ),
                    const SizedBox(height: 4), // Spasi antara row atas dan teks tambahan
                    Text(
                      "Langganan",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 10,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Menjaga teks tetap di kiri
                      children: [
                        Text(
                          "Lagi aktif",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          height: 4,
                          width: double.infinity, // Mengatur LinearProgressIndicator agar melebar
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const LinearProgressIndicator(
                            color: Colors.purple,
                            value: 10,
                          ),
                        ),
                      ],
                    ),
                  ]
              ),
              )
            ],
          ),
        const SizedBox(width: 10),
          Column(
            children: [
              Container(
                width: 109,
                height: 92, // Tinggi container diperbesar sedikit
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 7), // Spasi dalam
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 20,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      ],
                    ),
                    const SizedBox(height: 4), // Spasi antara row atas dan teks tambahan
                    Text(
                      "Mission",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 10,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Menjaga teks tetap di kiri
                      children: [
                        Text(
                          "Lagi Berjalan",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          height: 4,
                          width: double.infinity, // Mengatur LinearProgressIndicator agar melebar
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const LinearProgressIndicator(
                            color: Colors.blue,
                            value: 10,
                          ),
                        ),
                      ],
                    ),
                  ]
              ),
              )
            ],
          )]
      ),
     );
  }}