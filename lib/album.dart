import 'song.dart';

class Album {
  final String id;
  final String type;
  final String href;
  final String name;
  final String artworkRawUrl;
  final String artistName;
  final String releaseDate;
  final List<Song> songs;
  final List<dynamic> genreNames;
  final String artistId;
  final String shortNote;

  Album(
      {this.id,
      this.type,
      this.href,
      this.name,
      this.artworkRawUrl,
      this.artistName,
      this.releaseDate,
      this.songs,
      this.genreNames,
      this.shortNote,
      this.artistId});

  factory Album.fromJson(Map<String, dynamic> json) {
    final List<Song> songs = [];
    String artistId = '';

    final relationshipJSON = json['relationships'];
    if (relationshipJSON != null) {
      final tracksJSON = relationshipJSON['tracks']['data'] as List;
      songs.addAll(tracksJSON.map((s) => Song.fromJson(s)));

      artistId = relationshipJSON['artists']['data'][0]['id'];
    }

    String shortNote = '';
    String name = '';
    String artworkRawUrl = '';
    String artistName = '';
    String releaseDate = '';
    List<dynamic> genreNames = [];

    final attributesJSON = json['attributes'];
    if (attributesJSON != null) {
      name = json['attributes']['name'];
      artworkRawUrl = json['attributes']['artwork']['url'];
      artistName = json['attributes']['artistName'];
      releaseDate = json['attributes']['releaseDate'];
      genreNames = json['attributes']['genreNames'] as List;
      final editNoteJson = json['attributes']['editorialNotes'];
      if (editNoteJson != null) {
        shortNote = editNoteJson['short'];
      }
    }

    return Album(
        id: json['id'],
        type: json['type'],
        href: json['href'],
        name: name,
        artworkRawUrl: artworkRawUrl,
        artistName: artistName,
        releaseDate: releaseDate,
        songs: songs,
        genreNames: genreNames,
        shortNote: shortNote,
        artistId: artistId);
  }

  String artworkUrl(int size) {
    return this.artworkRawUrl.replaceAll('{w}x{h}', "${size}x$size");
  }

  String get releaseYear {
    return this.releaseDate.substring(0, 4);
  }
}
