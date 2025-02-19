import 'package:get_it/get_it.dart';
import 'package:spotify_bloc/features/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_bloc/features/data/repository/song/song_repository_impl.dart';
import 'package:spotify_bloc/features/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_bloc/features/data/sources/song/song_firebase_service.dart';
import 'package:spotify_bloc/features/domain/repository/auth/auth_repo.dart';
import 'package:spotify_bloc/features/domain/repository/song/song_repo.dart';
import 'package:spotify_bloc/features/domain/usecase/auth/get_user_usecase.dart';
import 'package:spotify_bloc/features/domain/usecase/auth/signin_usecase.dart';
import 'package:spotify_bloc/features/domain/usecase/auth/signup_usecase.dart';
import 'package:spotify_bloc/features/domain/usecase/song/add_or_remove_favorite_song.dart';
import 'package:spotify_bloc/features/domain/usecase/song/get_favorite_songs.dart';
import 'package:spotify_bloc/features/domain/usecase/song/get_news_songs.dart';
import 'package:spotify_bloc/features/domain/usecase/song/get_play_list.dart';
import 'package:spotify_bloc/features/domain/usecase/song/is_favorite_song.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Features - Auth
  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<SignupUsecase>(SignupUsecase());
  getIt.registerSingleton<SigninUsecase>(SigninUsecase());
  getIt.registerSingleton<GetUserUsecase>(GetUserUsecase());

  // Features - Song
  getIt.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  getIt.registerSingleton<SongRepository>(SongRepositoryImpl());
  getIt.registerSingleton<GetNewsSongsUsecase>(GetNewsSongsUsecase());
  getIt.registerSingleton<GetPlayListUsecase>(GetPlayListUsecase());
  getIt.registerSingleton<IsFavoriteSongUsecase>(IsFavoriteSongUsecase());
  getIt.registerSingleton<AddOrRemoveFavoriteSongUsecase>(AddOrRemoveFavoriteSongUsecase());
  getIt.registerSingleton<GetFavoriteSongsUsecase>(GetFavoriteSongsUsecase());
}
