import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gojek/consts.dart';

class Poin extends StatelessWidget {
  const Poin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 19, left: 15, right: 15),
      child: Container(
        height: 65,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffeaf3f6), Colors.white]),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffe8e8e8)),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 8,
              top: 4,
              bottom: 4,
              child: SvgPicture.asset('assets/images/component_dots.svg'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/component_star.svg',
                    height: 40,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "117 XP lagi ada Harta  Karun",
                          style: semibold14.copyWith(color: black),
                        ),
                        SizedBox(
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
                              backgroundColor: lightGrey,
                              color: primaryColor,
                              value: .8,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: (Icon(Icons.arrow_forward_ios_rounded)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
