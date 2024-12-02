import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/data/icons.dart';
import 'package:gojek/models/gojek_icon.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: black),
          onPressed: () {
          Navigator.pop(context);
          },
        ),
        title: const Text('Profilku', style: TextStyle(color: black, fontWeight: FontWeight.bold)),
        centerTitle: false,
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
                    Text('+621555333000',
                        style: TextStyle(color: lightGrey)),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: SvgPicture.asset('assets/icons/profile_edit.svg', color: black),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Divider(),
          ...profileIcons.map((icon) => _buildListTile(icon)).toList(),
        ],
      ),
    );
  }

  Widget _buildListTile(GojekIcon icon) {
    return ListTile(
      leading: SvgPicture.asset(
        'assets/icons/${icon.icon}.svg',
        width: 24,
        height: 24,
        color: darkGrey,
      ),
      title: Text(icon.title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: icon.subtitle != null ? Text(icon.subtitle!) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
