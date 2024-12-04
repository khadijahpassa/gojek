import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:provider/provider.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key, required this.image, required this.title, required this.subtitle});

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        const Spacer(),
        Image.asset(image),
        const SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16, 
            color: themeProvider.isDarkTheme ?white : black,
          )
        ),
      ],
    );
  }
}