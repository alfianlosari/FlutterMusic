import 'song.dart';
import 'album.dart';

class Artist {
  final String id;
  final String type;
  final String href;
  final String name;

  final List<Song> songs;
  final List<Album> albums;

  Artist({this.id, this.type, this.href, this.name, this.songs, this.albums});

  factory Artist.fromJson(Map<String, dynamic> json) {
    final List<Song> songs = [];
    final List<Album> albums = [];

    final relationshipJSON = json['relationships'];
    if (relationshipJSON != null) {
      final songsJSON = relationshipJSON['songs'];
      if (songsJSON != null) {
        songs.addAll((songsJSON['data'] as List).map((s) => Song.fromJson(s)));
      }

      final albumJSON = relationshipJSON['albums'];
      if (albumJSON != null) {
        albums
            .addAll((albumJSON['data'] as List).map((s) => Album.fromJson(s)));
      }
    }

    return Artist(
        id: json['id'],
        type: json['type'],
        href: json['href'],
        name: json['attributes']['name'],
        albums: albums,
        songs: songs);
  }
}
