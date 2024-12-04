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
        title: const Text('Settings'),
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
                "Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notification Setting"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Divider(),
            ),
            const ListTile(
              leading: Icon(Icons.local_shipping),
              title: Text("Shipping Address"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Divider(),
            ),
            const ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text("Payment Info"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Divider(),
            ),
            const ListTile(
              leading: Icon(Icons.delete),
              title: Text("Delete Account"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text(
                "App Settings",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
            const ListTile(
              title: Text("Enable Face ID For Log In"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            const ListTile(
              title: Text("Enable Push Notifications"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            const ListTile(
              title: Text("Enable Location Service"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text(
                "Account Management",
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
              title: const Text("Logout"),
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
