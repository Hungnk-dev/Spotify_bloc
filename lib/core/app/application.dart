import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:spotify_bloc/lib_src.dart';

class Application {
  ///Singleton factory
  static final Application _instance = Application._internal();

  static Future<void> initialAppLication() async {
    try {
      configLoading();
      await initializeDependencies();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  factory Application() {
    return _instance;
  }

  Application._internal();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.chasingDots
    ..loadingStyle = EasyLoadingStyle.custom
    ..radius = 10.0
    ..backgroundColor = Colors.transparent
    ..boxShadow = <BoxShadow>[]
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale
    ..maskType = EasyLoadingMaskType.black; // Tạo nền đen phủ toàn màn hình
}
