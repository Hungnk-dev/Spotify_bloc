import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_bloc/core/configs/color/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton({super.key, required this.onPressed, required this.title, this.height});

  final String title;
  final VoidCallback onPressed;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 90.h),
      ),
      child: Text(title, style: const TextStyle(color: white)),
    );
  }
}
