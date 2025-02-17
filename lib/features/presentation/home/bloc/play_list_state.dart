import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';

abstract class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListLoaded extends PlayListState {
  final List<SongEntity> songs;

  PlayListLoaded({required this.songs});
}

class PlayListError extends PlayListState {
  final String message;

  PlayListError(this.message);
}
