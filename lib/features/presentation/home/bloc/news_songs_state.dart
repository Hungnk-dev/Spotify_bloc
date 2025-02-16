import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsLoaded extends NewsSongsState {
  final List<SongEntity> songs;

  NewsSongsLoaded({required this.songs});
}

class NewsSongsError extends NewsSongsState {
  final String message;

  NewsSongsError(this.message);
}
