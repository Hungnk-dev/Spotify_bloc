import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';

class SongModel {
  String? songId;
  String? title;
  String? artist;
  String? duration;
  String? image;
  String? url;
  bool? isFavorite;
  Timestamp? releaseDate;
  SongModel({
    this.songId,
    required this.title,
    required this.artist,
    required this.duration,
    required this.image,
    required this.url,
    required this.releaseDate,
    this.isFavorite,
  });

  factory SongModel.fromJson(Map<String, dynamic> data) {
    return SongModel(
      songId: data['songId'],
      title: data['title'],
      artist: data['artist'],
      image: data['image'],
      duration: data['duration'],
      url: data['url'],
      releaseDate: data['releaseDate'],
      isFavorite: data['Favorites'],
    );
  }
}

extension SongModelLX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      songId: songId ?? '',
      title: title ?? '',
      artist: artist ?? '',
      imageUrl: image ?? '',
      duration: duration ?? '',
      urlSong: url ?? '',
      isFavorite: isFavorite ?? false,
      //  releaseDate: releaseDate ?? Timestamp.now(),
    );
  }
}
