import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final textColor = themeProvider.isDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
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
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.toggleTheme(!themeProvider.isDarkTheme);
            },
            icon: Icon(
              themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
              color:
                  themeProvider.isDarkTheme ? Colors.amberAccent : Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text(
                "Akun",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Pengaturan Notifikasi"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Divider(),
            ),
            const ListTile(
              leading: Icon(Icons.local_shipping),
              title: Text("Alamat Pengiriman"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Divider(),
            ),
            const ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text("Informasi Pembayaran"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Divider(),
            ),
            const ListTile(
              leading: Icon(Icons.delete),
              title: Text("Hapus Akun"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text(
                "Pengaturan Aplikasi",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
            const AppSet(text: "Aktifkan Face ID untuk Log In"),
            const AppSet(text: "Aktifkan Notifikasi Push"),
            const AppSet(text: "Aktifkan Layanan Lokasi"),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text(
                "Manajemen Akun",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              title: const Text("Keluar"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AppSet extends StatefulWidget {
  final String text;
  const AppSet({
    super.key,
    required this.text,
  });

  @override
  State<AppSet> createState() => _AppSetState();
}

class _AppSetState extends State<AppSet> {
  
  bool light = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final textColor = themeProvider.isDarkTheme ? Colors.white : Colors.black;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.text,
                style: TextStyle(fontSize: 16, color: textColor),
              ),
              const Spacer(),
              Switch(
                value: light,
                activeColor: primaryColor,
                onChanged: (bool value) {
                  setState(() {
                    light = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}