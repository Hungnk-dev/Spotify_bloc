import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_bloc/features/presentation/home/bloc/news_songs_cubit.dart';

import '../../presentation/choose_mode/bloc/theme_cubit.dart';

class AppBloc {
  AppBloc._internal();

  static final ThemeCubit themeCubit = ThemeCubit();
  static final NewsSongsCubit newsSongsCubit = NewsSongsCubit();

  static final List<BlocProvider> providers = [
    BlocProvider<ThemeCubit>(
      create: (_) => themeCubit,
    ),
    BlocProvider<NewsSongsCubit>(
      create: (_) => newsSongsCubit,
    ),
  ];

  static final AppBloc instance = AppBloc._internal();
  factory AppBloc() {
    return instance;
  }
}
