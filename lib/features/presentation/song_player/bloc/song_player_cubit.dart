import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_bloc/features/presentation/song_player/bloc/song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  SongPlayerCubit() : super(SongPlayerLoading()) {
    audioPlayer.positionStream.listen((positionSong) {
      updateSongPlayer(positionSong);
    });

    audioPlayer.durationStream.listen((durationSong) {
      songDuration = durationSong ?? Duration.zero;
    });
  }

  Future<void> loadSong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerLoaded());
    } catch (e) {
      emit(SongPlayerError(message: e.toString()));
    }
  }

  Future<void> playOrPauseSong() async {
    if (audioPlayer.playing) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play();
    }
    emit(SongPlayerLoaded());
  }

  Future<void> updateSongPlayer(Duration duration) async {
    songPosition = duration;
    emit(SongPlayerLoaded());
  }

  Future<void> fastForwardSong() async {
    if (songPosition.inSeconds > 0) {
      await audioPlayer.seek(songPosition + const Duration(seconds: 10));
    }
    emit(SongPlayerLoaded());
  }

  Future<void> fastRewindSong() async {
    if (songPosition.inSeconds < songDuration.inSeconds) {
      await audioPlayer.seek(songPosition + const Duration(seconds: -10));
    }
    emit(SongPlayerLoaded());
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
