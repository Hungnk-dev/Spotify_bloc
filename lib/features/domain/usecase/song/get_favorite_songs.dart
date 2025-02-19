import 'package:dartz/dartz.dart';
import 'package:spotify_bloc/features/domain/repository/song/song_repo.dart';
import 'package:spotify_bloc/lib_src.dart';

class GetFavoriteSongsUsecase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) {
    return getIt<SongRepository>().getUserFavoriteSongs();
  }
}
