import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_bloc/core/configs/color/app_colors.dart';
import 'package:spotify_bloc/gen/fonts.gen.dart';

class AppTheme {
  AppTheme(this.data);
  final ThemeData data;

  factory AppTheme.light() {
    final appColors = AppColors.light();
    final themeData = ThemeData(
      useMaterial3: true,
      primaryColor: appColors.primary,
      scaffoldBackgroundColor: appColors.background,
      fontFamily: FontFamily.satoshi,
      brightness: Brightness.light,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: appColors.primary,
        textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      )),
    );
    return AppTheme(themeData);
  }

  factory AppTheme.dark() {
    final appColors = AppColors.dark();
    final themeData = ThemeData(
      useMaterial3: true,
      primaryColor: appColors.primary,
      scaffoldBackgroundColor: appColors.background,
      fontFamily: FontFamily.satoshi,
      brightness: Brightness.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: appColors.primary,
        textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      )),
    );
    return AppTheme(themeData);
  }
}
