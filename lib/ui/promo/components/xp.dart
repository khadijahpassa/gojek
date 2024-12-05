// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:provider/provider.dart';

class Xp extends StatelessWidget {
  const Xp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Warna background dan teks sesuai tema
    final backgroundGradient = themeProvider.isDarkTheme
        ? [
            const Color(0xff1a2940),
            const Color(0xff24324e),
          ]
        : [
            const Color.fromARGB(255, 255, 240, 230),
            Colors.white,
          ];

    final borderColor = themeProvider.isDarkTheme
        ? const Color(0xff2b3a52)
        : const Color(0xffe8e8e8);

    final textColor = themeProvider.isDarkTheme ? Colors.white : black;

    final progressBgColor =
        themeProvider.isDarkTheme ? const Color(0xFF394861) : lightGrey;

    return Padding(
      padding: const EdgeInsets.only(top: 19, left: 2, right: 10),
      child: Container(
        height: 65,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: backgroundGradient,
          ),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 8,
              top: 4,
              bottom: 4,
              child: SvgPicture.asset(
                'assets/images/component_dots2.svg',
                color: themeProvider.isDarkTheme ? Colors.white30 : null,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/component_star2.svg',
                    height: 40,
                    color: themeProvider.isDarkTheme ? Colors.white : null,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "117 XP lagi ada Harta Karun",
                          style: semibold14.copyWith(color: textColor),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          width: double.infinity,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: LinearProgressIndicator(
                            backgroundColor: progressBgColor,
                            color: primaryColor,
                            value: .8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}