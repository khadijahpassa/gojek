import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gojek/consts.dart';

class Driver extends StatelessWidget {
  const Driver({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Akses Cepat',
            style: bold18.copyWith(color: black),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color(0xffe8e8e8)),
            ),
            child: Column(children: [
              ...[
                'Pintu masuk motor, MNC Land',
                'Pintu kelaur mobil, Grand Indonesia'
              ].map((text) => Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/goride.svg',
                            color: Colors.white,
                            width: 24,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            text,
                            style: regular14.copyWith(color: black),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: (Icon(Icons.arrow_forward_ios_rounded)),
                        )
                      ],
                    ),
                  )),
            ]),
          )
        ],
      ),
    );
  }
}
