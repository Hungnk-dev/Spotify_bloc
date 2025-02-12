import 'package:flutter/material.dart';

const primaryColor = Color(0xff42C83C);
const lightBackground = Color(0xffF2F2F2);
const darkBackground = Color(0xff0D0C0C);
const grey = Color(0xffBEBEBE);
const darkGrey = Color(0xff343434);

class AppColors {
  final Color primary;
  final Color background;

  AppColors({
    required this.primary,
    required this.background,
  });

  factory AppColors.light() {
    return AppColors(
      primary: primaryColor,
      background: lightBackground,
    );
  }

  factory AppColors.dark() {
    return AppColors(
      primary: primaryColor,
      background: lightBackground,
    );
  }
}
