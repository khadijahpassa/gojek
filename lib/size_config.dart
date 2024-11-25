import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Inisialisasi
class SizeConfig{
  static MediaQueryData _mediaQueryData =
  MediaQueryData.fromView(
    // ignore: deprecated_member_use
    WidgetsBinding.instance.window
  );
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}

// Function that used to get the proportionate height size of the screen
double getProportionateScreenHeight(double inputHeight){
  double screenHeight = SizeConfig.screenHeight;
  // 812.0 is the layout height size that commonly used
  return (inputHeight / 812.0) * screenHeight;
}

// Function that used to get the proportionate width size of the screen
double getProportionateScreenWidth(double inputWidth){
  double screenWidth = SizeConfig.screenWidth;
  // 812.0 is the layout width size that commonly used
  return (inputWidth / 375.0) * screenWidth;
}
 