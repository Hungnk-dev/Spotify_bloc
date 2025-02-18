import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String title;
  final String artist;
  final String duration;
  final String imageUrl;
  final Timestamp releaseDate;

  SongEntity({
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.duration,
    required this.releaseDate,
  });

  factory SongEntity.fromJson(Map<String, dynamic> json) {
    return SongEntity(
      title: json['title'],
      artist: json['artist'],
      imageUrl: json['imageUrl'],
      duration: json['duration'],
      releaseDate: json['releaseDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'artist': artist,
      'imageUrl': imageUrl,
      'duration': duration,
    };
  }
}
