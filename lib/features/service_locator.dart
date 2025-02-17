import 'package:get_it/get_it.dart';
import 'package:spotify_bloc/features/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_bloc/features/data/repository/song/song_repository_impl.dart';
import 'package:spotify_bloc/features/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_bloc/features/data/sources/song/song_firebase_service.dart';
import 'package:spotify_bloc/features/domain/repository/auth/auth_repo.dart';
import 'package:spotify_bloc/features/domain/repository/song/song_repo.dart';
import 'package:spotify_bloc/features/domain/usecase/auth/signin_usecase.dart';
import 'package:spotify_bloc/features/domain/usecase/auth/signup_usecase.dart';
import 'package:spotify_bloc/features/domain/usecase/song/get_news_songs.dart';
import 'package:spotify_bloc/features/domain/usecase/song/get_play_list.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Features - Auth
  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<SignupUsecase>(SignupUsecase());
  getIt.registerSingleton<SigninUsecase>(SigninUsecase());

  // Features - Song
  getIt.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  getIt.registerSingleton<SongRepository>(SongRepositoryImpl());
  getIt.registerSingleton<GetNewsSongsUsecase>(GetNewsSongsUsecase());
  getIt.registerSingleton<GetPlayListUsecase>(GetPlayListUsecase());
}
