import 'package:dartz/dartz.dart';
import 'package:spotify_bloc/features/data/sources/song/song_firebase_service.dart';
import 'package:spotify_bloc/features/domain/repository/song/song_repo.dart';
import 'package:spotify_bloc/lib_src.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await getIt<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await getIt<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) async {
    return await getIt<SongFirebaseService>().addOrRemoveFavoriteSong(songId);
  }

  @override
  Future<bool> isFavorateSong(String songId) async {
    return await getIt<SongFirebaseService>().isFavorateSong(songId);
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    return await getIt<SongFirebaseService>().getUserFavoriteSongs();
  }
}
