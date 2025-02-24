import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/lib_src.dart';

class SignupOrSigninScreen extends StatelessWidget {
  const SignupOrSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(Assets.icons.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(Assets.icons.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(Assets.images.authBg.path, fit: BoxFit.fill),
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Column(
                children: [
                  const Spacer(),
                  SvgPicture.asset(Assets.icons.logo),
                  SizedBox(height: 55.h),
                  Text(
                    'Enjoy Listenning To Music',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 21.h),
                  Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w300, color: grey1),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: BasicAppButton(
                          onPressed: () => GoRouter.of(context).push(Routes.siginUp),
                          title: 'Register',
                          height: 73.h,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: SizedBox(
                          height: 73.h,
                          child: TextButton(
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r))),
                            ),
                            onPressed: () => GoRouter.of(context).push(Routes.signIn),
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: context.isDarkMode ? white : black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
