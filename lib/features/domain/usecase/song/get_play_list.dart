import 'package:dartz/dartz.dart';
import 'package:spotify_bloc/features/domain/repository/song/song_repo.dart';
import 'package:spotify_bloc/lib_src.dart';

class GetPlayListUsecase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) {
    return getIt<SongRepository>().getPlayList();
  }
}
