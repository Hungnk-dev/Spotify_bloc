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
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        hintStyle: const TextStyle(color: grey2, fontWeight: FontWeight.w700),
        contentPadding: EdgeInsets.all(30.r),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: grey2, width: 0.4.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: grey2, width: 0.4.w),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appColors.primary,
          elevation: 0,
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        ),
      ),
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
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        hintStyle: const TextStyle(color: grey3, fontWeight: FontWeight.w700),
        contentPadding: EdgeInsets.all(30.r),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: grey3, width: 0.4.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: grey3, width: 0.4.w),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appColors.primary,
          elevation: 0,
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        ),
      ),
    );
    return AppTheme(themeData);
  }
}
