import 'package:dartz/dartz.dart';
import 'package:spotify_bloc/features/data/sources/song/song_firebase_service.dart';
import 'package:spotify_bloc/features/domain/repository/song/song_repo.dart';
import 'package:spotify_bloc/lib_src.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await getIt<SongFirebaseService>().getNewsSongs();
  }
}
