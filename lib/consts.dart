import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// default constant value for padding size
const defaultPadding = 20.0;

const green1 =  Color(0xFF097210);
const green2 =  Color(0xFF00880F);

const dark1 =  Color(0xFF1C1C1C);
const dark2 =  Color(0xFF4A4A4A);
const dark3 =  Color(0xFF999798);
const dark4 =  Color(0xFFEDEDED);

const blue1 =  Color(0xFF0281A0);
const blue2 =  Color(0xFF00AED5);
const blue3 =  Color(0xFF38BBDA);

const red =  Color(0xFFED2739);
const purple =  Color(0xFF87027B);

// Typography
TextStyle regular12_5 =
    const TextStyle(fontFamily: 'SF-Pro-Display', fontSize: 12.5);
TextStyle regular14 = regular12_5.copyWith(fontSize: 14);

TextStyle semibold12_5 = regular12_5.copyWith(fontWeight: FontWeight.w600);
TextStyle semibold14 = semibold12_5.copyWith(fontSize: 14, letterSpacing: 0.1);

TextStyle bold16 = regular12_5.copyWith(
    fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 0.1);
TextStyle bold18 = bold16.copyWith(fontSize: 18, letterSpacing: -0.5);