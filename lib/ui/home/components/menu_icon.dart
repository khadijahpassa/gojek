import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/data/icons.dart';
import 'package:gojek/ui/map/order_screen.dart'; // Tambahkan impor untuk layar tujuan

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: defaultPadding, right: defaultPadding),
      child: SizedBox(
        height: 198,
        child: GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          children: [
            ...menuIcons.map((icon) => GestureDetector(
                  onTap: () {
                    if (icon.icon == 'goride') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderScreen(), // Layar tujuan
                        ),
                      );
                    }
                    // Tambahkan navigasi untuk ikon lainnya jika diperlukan
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color:
                              icon.icon == 'goclub' ? Colors.white : icon.color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/${icon.icon}.svg',
                          color: icon.icon == 'goclub'
                              ? icon.color
                              : icon.icon == 'other'
                                  ? darkGrey
                                  : Colors.white,
                          width: 24,
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        icon.title,
                        style: regular12_5.copyWith(color: darkGrey),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
