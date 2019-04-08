import 'song.dart';
import 'album.dart';

class Chart {
  final AlbumChart albumChart;
  final SongChart songChart;

  Chart({this.albumChart, this.songChart});
}

class AlbumChart {
  final String chart;
  final String href;
  final String name;
  final List<Album> albums;

  AlbumChart({this.chart, this.href, this.name, this.albums});

  factory AlbumChart.fromJson(Map<String, dynamic> json) {
    final albumJson = json['data'] as List;
    final albums = albumJson.map((s) => Album.fromJson(s)).toList();

    return AlbumChart(
        chart: json['chart'],
        href: json['href'],
        name: json['name'],
        albums: albums);
  }
}

class SongChart {
  final String chart;
  final String href;
  final String name;
  final List<Song> songs;

  SongChart({this.chart, this.href, this.name, this.songs});

  factory SongChart.fromJson(Map<String, dynamic> json) {
    final songJson = json['data'] as List;
    final songs = songJson.map((s) => Song.fromJson(s)).toList();

    return SongChart(
        chart: json['chart'],
        href: json['href'],
        name: json['name'],
        songs: songs);
  }
}
