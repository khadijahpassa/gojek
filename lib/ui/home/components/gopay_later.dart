import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/data/news.dart';
import 'package:provider/provider.dart';
import 'package:gojek/state-management/theme_provider.dart';

class GopayLater extends StatelessWidget {
  const GopayLater({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Ambil warna teks yang sesuai dengan mode tema
    final textColor = themeProvider.isDarkTheme ? Colors.white : Colors.black;
    final borderColor = themeProvider.isDarkTheme
        ? const Color(0xff4d4d4d)
        : lightGrey; // Warna border sesuai tema

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
            style: bold18.copyWith(color: textColor),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: 350,
            child: Text(
              "Yuk, belanja di Tokopedia pake GoPay Later dan nikmatin cashback nya~",
              style: regular14.copyWith(color: textColor),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ...news.map((item) => Padding(
                padding: const EdgeInsets.only(top: defaultPadding),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: borderColor),
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/images/${item.image}'),
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: bold16.copyWith(color: textColor),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              item.description,
                              style: regular14.copyWith(
                                color: themeProvider.isDarkTheme
                                    ? Colors.grey[400]
                                    : darkGrey,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
