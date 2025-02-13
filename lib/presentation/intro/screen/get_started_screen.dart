import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../lib_src.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.introBg.path),
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
                'Enjoy Listenning To Music',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: appTextColor,
                ),
              ),
              SizedBox(height: 21.h),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: appTextColor,
                ),
              ),
              SizedBox(height: 37.h),
              BasicAppButton(
                  onPressed: () {
                    GoRouter.of(context).push(Routes.chooseMode);
                  },
                  title: 'Get Started',
                  height: 92.h),
              SizedBox(height: 69.h),
            ],
          ),
        ),
      ],
    ));
  }
}
