import 'package:dartz/dartz.dart';

abstract class SongRepository {
  Future<Either> getNewsSongs();

  Future<Either> getPlayList();

  Future<Either> addOrRemoveFavoriteSong(String songId);

  Future<bool> isFavorateSong(String songId);
}
