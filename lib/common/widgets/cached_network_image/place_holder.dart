import 'package:flutter/material.dart';

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({super.key, this.width, this.height, this.shape = BoxShape.rectangle});
  final double? width;
  final double? height;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
