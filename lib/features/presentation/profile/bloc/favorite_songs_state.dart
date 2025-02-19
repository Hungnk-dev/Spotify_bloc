import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';

abstract class FavoriteSongsState {}

class FavoriteSongsInitial extends FavoriteSongsState {}

class FavoriteSongsLoaded extends FavoriteSongsState {
  final List<SongEntity> songs;

  FavoriteSongsLoaded({required this.songs});
}

class FavoriteSongsError extends FavoriteSongsState {
  final String message;

  FavoriteSongsError({required this.message});
}
