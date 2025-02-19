import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';
import 'package:spotify_bloc/features/domain/usecase/song/get_favorite_songs.dart';
import 'package:spotify_bloc/features/presentation/profile/bloc/favorite_songs_state.dart';
import 'package:spotify_bloc/lib_src.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoriteSongsInitial());

  List<SongEntity> favoriteSongs = [];

  Future<void> getFavoriteSongs() async {
    var result = await getIt<GetFavoriteSongsUsecase>().call();

    result.fold((l) {
      emit(FavoriteSongsError(message: l.toString()));
    }, (songs) {
      favoriteSongs = songs;
      emit(FavoriteSongsLoaded(songs: favoriteSongs));
    });
  }

  Future<void> removeSong(int index) async {
    favoriteSongs.removeAt(index);
    emit(FavoriteSongsLoaded(songs: favoriteSongs));
  }
}
