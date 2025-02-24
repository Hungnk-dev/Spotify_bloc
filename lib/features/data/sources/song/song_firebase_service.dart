import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_bloc/features/data/models/song/song_model.dart';
import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';
import 'package:spotify_bloc/features/domain/usecase/song/is_favorite_song.dart';
import 'package:spotify_bloc/lib_src.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavoriteSong(String songId);
  Future<bool> isFavorateSong(String songId);
  Future<Either> getUserFavoriteSongs();
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      final List<SongEntity> songs = [];
      final data = await FirebaseFirestore.instance.collection('Songs').orderBy('releaseDate', descending: true).limit(5).get();

      for (final element in data.docs) {
        final songModel = SongModel.fromJson(element.data());
        final bool isFavorate = await getIt<IsFavoriteSongUsecase>().call(params: element.reference.id);
        songModel.songId = element.reference.id;
        songModel.isFavorite = isFavorate;

        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } on FirebaseException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      final List<SongEntity> songs = [];
      final data = await FirebaseFirestore.instance.collection('Songs').orderBy('releaseDate', descending: true).get();

      for (final element in data.docs) {
        final songModel = SongModel.fromJson(element.data());
        final bool isFavorate = await getIt<IsFavoriteSongUsecase>().call(params: element.reference.id);
        songModel.songId = element.reference.id;
        songModel.isFavorite = isFavorate;

        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } on FirebaseException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) async {
    try {
      late bool isFavorate;
      final FirebaseAuth fireAuth = FirebaseAuth.instance;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      final userId = fireAuth.currentUser?.uid;

      final favoriteSongs = await firestore.collection('Users').doc(userId).collection('Favorites').where('songId', isEqualTo: songId).get();

      if (favoriteSongs.docs.isNotEmpty) {
        await favoriteSongs.docs.first.reference.delete();
        isFavorate = false;
      } else {
        await firestore.collection('Users').doc(userId).collection('Favorites').add({'songId': songId, 'addedDate': Timestamp.now()});
        isFavorate = true;
      }

      return Right(isFavorate);
    } on FirebaseException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<bool> isFavorateSong(String songId) async {
    try {
      final FirebaseAuth fireAuth = FirebaseAuth.instance;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      final userId = fireAuth.currentUser?.uid;

      final QuerySnapshot favoriteSongs = await firestore.collection('Users').doc(userId).collection('Favorites').where('songId', isEqualTo: songId).get();

      return favoriteSongs.docs.isNotEmpty;
    } on FirebaseException catch (_) {
      return false;
    }
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    try {
      final List<SongEntity> songs = [];
      final FirebaseAuth fireAuth = FirebaseAuth.instance;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      final userId = fireAuth.currentUser?.uid;

      final favoriteSongs = await firestore.collection('Users').doc(userId).collection('Favorites').get();

      for (final element in favoriteSongs.docs) {
        final songId = element['songId'];
        final song = await firestore.collection('Songs').doc(songId).get();
        final songModel = SongModel.fromJson(song.data()!);
        songModel.songId = songId;
        songModel.isFavorite = true;

        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } on FirebaseException catch (e) {
      return Left(e.message);
    }
  }
}
