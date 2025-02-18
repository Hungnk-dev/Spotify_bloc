abstract class SongPlayerState {}

class SongPlayerLoading extends SongPlayerState {}

class SongPlayerLoaded extends SongPlayerState {
  SongPlayerLoaded();
}

class SongPlayerError extends SongPlayerState {
  final String message;

  SongPlayerError({required this.message});
}
