import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key, required this.image, required this.title, required this.subtitle});

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
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
          style: const TextStyle(fontSize: 16, color: darkGrey)
        ),
      ],
    );
  }
}