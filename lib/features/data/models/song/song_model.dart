import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';

class SongModel {
  final String? title;
  final String? artist;
  final String? duration;
  final String? image;
  final Timestamp? releaseDate;
  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.image,
    required this.releaseDate,
  });

  factory SongModel.fromJson(Map<String, dynamic> data) {
    return SongModel(
      title: data['title'],
      artist: data['artist'],
      image: data['image'],
      duration: data['duration'],
      releaseDate: data['releaseDate'],
    );
  }
}

extension SongModelLX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title ?? '',
      artist: artist ?? '',
      imageUrl: image ?? '',
      duration: duration ?? '',
      releaseDate: releaseDate ?? Timestamp.now(),
    );
  }
}
