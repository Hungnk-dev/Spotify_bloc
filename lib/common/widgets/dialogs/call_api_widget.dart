import '../../../lib_src.dart';

class CallApiWidget {
  static Future<dynamic> checkTimeCallApi(dynamic api, {bool isDimiss = true}) async {
    DialogWidget.showLoading();
    Stopwatch stopwatch = Stopwatch()..start();
    final result = await api;
    stopwatch.stop();
    if (stopwatch.elapsedMilliseconds < 200) {
      await Future.delayed(const Duration(milliseconds: 900));
    }
    if (isDimiss) DialogWidget.dismissLoading();
    return result;
  }
}
