import 'package:flutter/material.dart';
import 'package:spotify_bloc/core/core_src.dart';
import 'package:spotify_bloc/gen/gen_src.dart';

class DefaultImage extends StatelessWidget {
  const DefaultImage({
    super.key,
    required this.width,
    required this.height,
    required this.shape,
    this.margin,
    this.borderRadius,
    this.border,
    this.color,
    this.title,
    this.childInAvatar,
  });
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final Color? color;
  final String? title;
  final Widget? childInAvatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            child: Container(
              width: width,
              height: height,
              alignment: Alignment.bottomRight,
              decoration: color != null
                  ? BoxDecoration(
                      shape: shape,
                      borderRadius: borderRadius,
                      border: border,
                      color: color,
                    )
                  : BoxDecoration(
                      shape: shape,
                      borderRadius: borderRadius,
                      border: border,
                      image: DecorationImage(
                        image: AssetImage(Assets.icons.logo),
                        fit: shape == BoxShape.circle ? BoxFit.fitHeight : BoxFit.contain,
                      ),
                    ),
              child: childInAvatar,
            ),
          ),
          title == null
              ? const SizedBox.shrink()
              : Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width / 2.85,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
        ],
      ),
    );
  }
}
