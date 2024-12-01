import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// animationDuration time definition
const animationDuration = Duration(milliseconds: 200);

// default constant value for padding size
const defaultPadding = 20.0;

const primaryColor = Color(0xFF097210);
const secondaryColor = Color(0xFF00880F);

const black = Color(0xFF1C1C1C);
const darkGrey = Color(0xFF4A4A4A);
const lightGrey = Color(0xFF999798);
const white = Color(0xFFEDEDED);

const darkBlue = Color(0xFF0281A0);
const blue = Color(0xFF00AED5);
const lightBlue = Color(0xFF38BBDA);

const red = Color(0xFFED2739);
const purple = Color(0xFF87027B);

// Typography
TextStyle regular12_5 =
    const TextStyle(fontFamily: 'SF-Pro-Display', fontSize: 12.5);
TextStyle regular14 = regular12_5.copyWith(fontSize: 14);

TextStyle semibold12_5 = regular12_5.copyWith(fontWeight: FontWeight.w600);
TextStyle semibold14 = semibold12_5.copyWith(fontSize: 14, letterSpacing: 0.1);

TextStyle bold16 = regular12_5.copyWith(
    fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 0.1);
TextStyle bold18 = bold16.copyWith(fontSize: 18, letterSpacing: -0.5);
