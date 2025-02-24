import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/lib_src.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({super.key, this.title, this.hideBackButton = false, this.action, this.backgroundColor});

  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      title: title,
      centerTitle: true,
      elevation: 0,
      actions: [action ?? const SizedBox()],
      leading: hideBackButton
          ? null
          : IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: context.isDarkMode ? white.withOpacity(0.03) : black.withOpacity(0.04),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 15.sp,
                  color: context.isDarkMode ? white : black,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
