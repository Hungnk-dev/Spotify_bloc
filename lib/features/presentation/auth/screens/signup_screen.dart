import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/lib_src.dart';

import '../../../data/models/auth/create_user_req.dart';
import '../../../domain/usecase/auth/signup_usecase.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80.h),
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
              _buildEmailField(context),
              SizedBox(height: 15.h),
              _buildPasswordField(context),
              SizedBox(height: 33.h),
              BasicAppButton(
                  onPressed: () async {
                    if (_fullnameController.text.isEmpty || _emailController.text.isEmpty || _passwordController.text.isEmpty) {
                      ToastUtil.show('Please fill all fields');
                      return;
                    }

                    var result = await CallApiWidget.checkTimeCallApi(sl<SignupUsecase>().call(
                      params: CreateUserReq(
                        fullName: _fullnameController.text.trim(),
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      ),
                    ));
                    result.fold(
                      (l) => {
                        ToastUtil.show(l),
                      },
                      (r) {
                        ToastUtil.show('Account created successfully');
                        GoRouter.of(context).go(Routes.root);
                      },
                    );
                  },
                  title: 'Create Account',
                  height: 80.h),
              SizedBox(height: 30.h),
              SizedBox(height: 38.h),
              // _buildOtherLoginOptions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFullnameField(BuildContext context) {
    return TextFormField(
      controller: _fullnameController,
      decoration: const InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  // Widget _buildOtherLoginOptions() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       IconButton(
  //         onPressed: () {},
  //         icon: SizedBox(width: 30.w, height: 30.h, child: SvgPicture.asset(Assets.icons.iconGoogle)),
  //       ),
  //       SizedBox(width: 58.w),
  //       IconButton(
  //         onPressed: () {},
  //         icon: SizedBox(width: 35.w, height: 35.h, child: SvgPicture.asset(Assets.icons.iconApple)),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildSignInText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do You Have An Account?',
            style: TextStyle(color: context.isDarkMode ? white : black, fontWeight: FontWeight.w500, fontSize: 14.sp),
          ),
          TextButton(
            onPressed: () => GoRouter.of(context).pushReplacement(Routes.signIn),
            child: Text(
              'Sign In',
              style: TextStyle(color: blue, fontWeight: FontWeight.w700, fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
