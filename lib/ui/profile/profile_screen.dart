// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/data/icons.dart';
import 'package:gojek/models/gojek_icon.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final textColor = themeProvider.isDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(
            color: textColor,
            fontSize: 24,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: themeProvider.isDarkTheme ? black : Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: secondaryColor,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Odit',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('khadijah@gmail.com',
                        style: TextStyle(color: lightGrey)),
                    Text('+621555333000', style: TextStyle(color: lightGrey)),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: SvgPicture.asset('assets/icons/profile_edit.svg',
                      color: themeProvider.isDarkTheme ? black : Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Divider(),
          ...profileIcons.map((icon) => _buildListTile(context, icon)).toList(),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, GojekIcon icon) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ListTile(
      leading: SvgPicture.asset(
        'assets/icons/${icon.icon}.svg',
        width: 24,
        height: 24,
        color: themeProvider.isDarkTheme ? white : darkGrey,
      ),
      title: Text(icon.title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: icon.subtitle != null ? Text(icon.subtitle!) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
