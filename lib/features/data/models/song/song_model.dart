import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';

class SongModel {
  final String? title;
  final String? artist;
  final num? duration;
  final Timestamp? releaseDate;
  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
  });

  factory SongModel.fromJson(Map<String, dynamic> data) {
    return SongModel(
      title: data['title'],
      artist: data['artist'],
      duration: data['duration'],
      releaseDate: data['releaseDate'],
    );
  }
}

extension SongModelLX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
    );
  }
}
