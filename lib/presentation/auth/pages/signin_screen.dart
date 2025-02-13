import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/lib_src.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
          title: SvgPicture.asset(
        Assets.icons.logo,
        height: 33.h,
      )),
      bottomNavigationBar: _buildSignInText(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            Spacer(),
            Text(
              'Register',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30.sp,
                color: context.isDarkMode ? white : black,
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(height: 25.h),
            _buildFullnameField(context),
            SizedBox(height: 15.h),
            _buildPasswordField(context),
            SizedBox(height: 33.h),
            BasicAppButton(onPressed: () {}, title: 'Sign In', height: 80.h),
            SizedBox(height: 30.h),
            SizedBox(height: 38.h),
            _buildOtherLoginOptions(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildFullnameField(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter Username Or Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _buildOtherLoginOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: SizedBox(width: 30.w, height: 30.h, child: SvgPicture.asset(Assets.icons.iconGoogle)),
        ),
        SizedBox(width: 58.w),
        IconButton(
          onPressed: () {},
          icon: SizedBox(width: 35.w, height: 35.h, child: SvgPicture.asset(Assets.icons.iconApple)),
        ),
      ],
    );
  }

  Widget _buildSignInText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not A Member?',
            style: TextStyle(color: context.isDarkMode ? white : black, fontWeight: FontWeight.w500, fontSize: 14.sp),
          ),
          TextButton(
            onPressed: () => GoRouter.of(context).pushReplacement(Routes.siginUp),
            child: Text(
              'Register Now',
              style: TextStyle(color: blue, fontWeight: FontWeight.w700, fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
