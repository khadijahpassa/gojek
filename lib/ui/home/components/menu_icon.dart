import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/data/icons.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:gojek/ui/map/order_screen.dart';
import 'package:provider/provider.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final textColor = themeProvider.isDarkTheme ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
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
                        MaterialPageRoute(builder: (context) => const OrderScreen()),
                      );
                    }
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
                      const SizedBox(height: 9),
                      Text(
                        icon.title,
                        style: regular12_5.copyWith(color: textColor),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
