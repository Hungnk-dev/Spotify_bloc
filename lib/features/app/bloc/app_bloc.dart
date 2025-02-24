import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_bloc/lib_src.dart';

class AppBloc {
  AppBloc._internal();

  static final ThemeCubit themeCubit = ThemeCubit();
  static final NewsSongsCubit newsSongsCubit = NewsSongsCubit();
  static final PlayListCubit playListCubit = PlayListCubit();
  static final ProfileCubit profileCubit = ProfileCubit();
  static final FavoriteButtonCubit favoriteButtonCubit = FavoriteButtonCubit();

  static final List<BlocProvider> providers = [
    BlocProvider<ThemeCubit>(
      create: (_) => themeCubit,
    ),
    BlocProvider<NewsSongsCubit>(
      create: (_) => newsSongsCubit,
    ),
    BlocProvider<PlayListCubit>(
      create: (_) => playListCubit,
    ),
    BlocProvider<ProfileCubit>(
      create: (_) => profileCubit,
    ),
    BlocProvider<FavoriteButtonCubit>(
      create: (_) => favoriteButtonCubit,
    ),
  ];

  static final AppBloc instance = AppBloc._internal();
  factory AppBloc() {
    return instance;
  }
}
