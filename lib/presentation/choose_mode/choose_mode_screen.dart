import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../lib_src.dart';

class ChooseModeScreen extends StatelessWidget {
  const ChooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.chooseModeBg.path),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Column(
              children: [
                SizedBox(height: 42.h),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(Assets.icons.logo),
                ),
                const Spacer(),
                Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: appTextColor,
                  ),
                ),
                SizedBox(height: 21.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButtonChooseMode(
                      onTap: () => context.read<ThemeCubit>().updateTheme(ThemeMode.dark),
                      iconPath: Assets.icons.moon,
                      label: 'Dark Mode',
                    ),
                    SizedBox(width: 71.w),
                    _buildButtonChooseMode(
                      onTap: () => context.read<ThemeCubit>().updateTheme(ThemeMode.light),
                      iconPath: Assets.icons.sun,
                      label: 'Light Mode',
                    ),
                  ],
                ),
                SizedBox(height: 37.h),
                BasicAppButton(
                    onPressed: () {
                      GoRouter.of(context).push(Routes.signupOrSignin);
                    },
                    title: 'Continue',
                    height: 92.h),
                SizedBox(height: 69.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonChooseMode({
    required VoidCallback onTap,
    required String iconPath,
    required String label,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.w, sigmaY: 10.h),
              child: Container(
                height: 73.h,
                width: 73.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF30393C).withOpacity(0.5),
                ),
                child: SvgPicture.asset(
                  iconPath,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 17.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color: appTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
