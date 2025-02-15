import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DialogWidget {
  static showLoading() {
    return EasyLoading.show(
      indicator: Center(
        child: LoadingAnimationWidget.beat(
          color: Colors.grey,
          size: 50,
        ),
      ),
    );
  }

  static void dismissLoading() {
    EasyLoading.dismiss();
  }
}
