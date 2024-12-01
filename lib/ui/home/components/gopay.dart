import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/data/icons.dart';
import 'package:gojek/ui/scanner_paymet/scanner.dart';

class Pay extends StatelessWidget {
  const Pay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
      ),
      child: Container(
        height: 96,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.1), // Warna shadow dengan transparansi
              spreadRadius: 1, // Penyebaran shadow
              blurRadius: 6, // Tingkat blur
              offset: const Offset(0, 4), // Posisi shadow (x, y)
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 13,
                ),
                Container(
                  height: 75,
                  width: 128,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/gopay_logo.png',
                        height: 15,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text('Rp12.000', style: bold18.copyWith(color: black)),
                      Text(
                        'Klik & Cek Riwayat',
                        style: semibold12_5.copyWith(color: primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ...gopayIcons.map((icon) => Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      if (icon.icon == 'topup') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                QrScannerScreen(), // Replace with your target page
                          ),
                        );
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: darkBlue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/${icon.icon}.svg',
                            color: white,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          icon.title,
                          style: semibold14.copyWith(color: black),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
