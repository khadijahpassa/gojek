// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar(
      {super.key,
      required this.selectedIndex, // untuk mngeasih tau index yang dipilih, wadah utama
      required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_home.svg',
            color: selectedIndex == 0 ? themeProvider.isDarkTheme ? Colors.white : primaryColor : lightGrey,
          ),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_promo.svg',
            color: selectedIndex == 1 ? themeProvider.isDarkTheme ? Colors.white : primaryColor : lightGrey,
          ),
          label: 'Promo',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_gochat.svg',
            color: selectedIndex == 2 ? themeProvider.isDarkTheme ? Colors.white : primaryColor : lightGrey,
          ),
          label: 'GoChat',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_setting.svg',
            color: selectedIndex == 3 ? themeProvider.isDarkTheme ? Colors.white : primaryColor : lightGrey,
          ),
          label: 'Setting',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: themeProvider.isDarkTheme ? Colors.white : primaryColor,
      unselectedItemColor: lightGrey, // Warna untuk item yang tidak dipilih
      backgroundColor: themeProvider.isDarkTheme 
        ? black 
        : white, // Warna latar belakang navbar
      type: BottomNavigationBarType.fixed,// Pastikan ukuran item tetap
      onTap: onItemTapped,
    );
  }
}
