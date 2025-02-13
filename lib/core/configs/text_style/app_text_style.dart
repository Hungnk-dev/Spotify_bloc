import 'package:flutter/material.dart';
import 'package:spotify_bloc/gen/fonts.gen.dart';

class AppTextStyle {
  AppTextStyle._();

  static const font = FontFamily.satoshi;

  static const TextStyle h1 = TextStyle(
    fontFamily: font,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
}
