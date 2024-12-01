import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/home/components/gopay.dart';
import 'package:gojek/home/components/menu_icon.dart';
import 'package:gojek/home/components/poin.dart';
import 'package:gojek/home/components/search.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 0,
        toolbarHeight: 71,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Search(), Pay(), MenuIcon(), Poin()],
        ),
      ),
    );
  }
}
