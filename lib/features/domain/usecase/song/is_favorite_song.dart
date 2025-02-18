import 'package:spotify_bloc/features/domain/repository/song/song_repo.dart';
import 'package:spotify_bloc/lib_src.dart';

class IsFavoriteSongUsecase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) {
    return getIt<SongRepository>().isFavorateSong(params ?? '');
  }
}
