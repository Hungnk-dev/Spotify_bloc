import 'package:flutter/material.dart';

const primaryColor = Color(0xff42C83C);
const lightBackground = Color(0xffF2F2F2);
const darkBackground = Color(0xff0D0C0C);
const grey = Color(0xffBEBEBE);
const grey1 = Color(0xFF797979);
const grey2 = Color(0xff343434);
const grey3 = Color(0xFFAEAEAE);
const grey4 = Color(0xFF959595);

const grey5 = Color(0xFFE6E6E6);

const Color white = Colors.white;

const appTextColor = Color(0xFFD9D9D9);

const Color black = Colors.black;
const Color black1 = Color(0xFF5C5C5C);
const Color black2 = Color(0xFF2B2B2B);

const blue = Color(0xFF278CE8);

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
      background: darkBackground,
    );
  }
}
