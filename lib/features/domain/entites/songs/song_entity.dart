class SongEntity {
  String songId;
  String title;
  String artist;
  String duration;
  String imageUrl;
  String urlSong;
  bool isFavorite;
  //final Timestamp releaseDate;

  SongEntity({
    required this.songId,
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.duration,
    required this.urlSong,
    required this.isFavorite,
    // required this.releaseDate,
  });

  factory SongEntity.fromJson(Map<String, dynamic> json) {
    return SongEntity(
      songId: json['songId'],
      title: json['title'],
      artist: json['artist'],
      imageUrl: json['imageUrl'],
      duration: json['duration'],
      urlSong: json['urlSong'],
      isFavorite: json['isFavorite'] == 'true' ? true : false,
      //  releaseDate: json['releaseDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'songId': songId,
      'title': title,
      'artist': artist,
      'imageUrl': imageUrl,
      'duration': duration,
      'urlSong': urlSong,
      'isFavorite': isFavorite ? 'true' : 'false',
      //  'releaseDate': releaseDate,
    };
  }
}
