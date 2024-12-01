import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/data/news.dart';

class GopayLater extends StatelessWidget {
  const GopayLater({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Pastikan align ke kiri
        mainAxisSize: MainAxisSize.min, // Agar tinggi hanya mengikuti konten
        children: [
          Image.asset(
            'assets/images/gopaylater_logo.png',
            height: 15,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Lebih hemat pake GoPayLater🤩",
            style: bold18,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: 350,
            child: const Text(
              "Yuk, belanja di Tokopedia pake GoPay Later  dan nikmatin cashback nya~",
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ...news.map((item) => Padding(
              padding: EdgeInsets.only(top: defaultPadding),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: lightGrey)),
                child: Column(
                  children: [
                    Image.asset('assets/images/${item.image}'),
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: bold16.copyWith(color: black),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            item.description,
                            style: regular14.copyWith(color: darkGrey),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )))
        ],
      ),
    );
  }
}
