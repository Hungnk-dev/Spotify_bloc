import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/choose_mode/bloc/theme_cubit.dart';

class AppBloc {
  AppBloc._internal();

  static final List<BlocProvider> providers = [
    BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(),
    ),
  ];

  static final AppBloc instance = AppBloc._internal();
  factory AppBloc() {
    return instance;
  }
}
