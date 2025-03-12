// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

// Lớp CubitObserver kế thừa từ BlocObserver
class CubitObserver extends BlocObserver {
  // Ghi đè phương thức onChange để theo dõi thay đổi trạng thái của Cubit
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // Kiểm tra nếu bloc là một Cubit
    if (bloc is Cubit) {
      print('Thay đổi trạng thái trong Cubit ${bloc.runtimeType}: '
          'Trạng thái hiện tại: ${change.currentState} -> '
          'Trạng thái mới: ${change.nextState}');
    }
  }

  // Ghi đè phương thức onCreate để theo dõi khi Cubit được tạo
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (bloc is Cubit) {
      print('Cubit ${bloc.runtimeType} đã được tạo.');
    }
  }

  // Ghi đè phương thức onClose để theo dõi khi Cubit bị đóng
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (bloc is Cubit) {
      print('Cubit ${bloc.runtimeType} đã bị đóng.');
    }
  }

  // Ghi đè phương thức onError để xử lý lỗi trong Cubit
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (bloc is Cubit) {
      print('Lỗi trong Cubit ${bloc.runtimeType}: $error\nStackTrace: $stackTrace');
    }
  }
}
