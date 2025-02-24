import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static Future<void> show(String toastMessage) async {
    Fluttertoast.cancel();
    await Fluttertoast.showToast(
      msg: toastMessage,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      webPosition: 'center',
      webBgColor: 'black',
      fontSize: 16.0,
    );
  }
}
