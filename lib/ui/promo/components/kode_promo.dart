import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:provider/provider.dart';

class KodePromo extends StatelessWidget {
  const KodePromo({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final textColor = themeProvider.isDarkTheme ? Colors.white : black;

    return Container(
      width: 400,
      height: 46, // Tinggi container diperbesar sedikit
      padding: const EdgeInsets.symmetric(
      horizontal: 10, vertical: 10), // Spasi dalam
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // ignore: deprecated_member_use
          SvgPicture.asset('assets/icons/ic_promo.svg', color: orange,),
          const SizedBox(width: 10),
          Text('Masukkan kode promo',
          style: TextStyle(
            color: textColor,
              fontSize: 14,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: 0.12,
          ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios_rounded, size: 20)
        ],
      ),
      
    );
  }
}