class Song {
  final String id;
  final String type;
  final String href;
  final String name;
  final String previewUrl;
  final String artworkRawUrl;
  final String artistName;
  final String releaseDate;
  final String albumName;

  Song(
      {this.id,
      this.type,
      this.href,
      this.name,
      this.previewUrl,
      this.artworkRawUrl,
      this.artistName,
      this.releaseDate,
      this.albumName});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
        id: json['id'],
        type: json['type'],
        href: json['href'],
        name: json['attributes']['name'],
        previewUrl: json['attributes']['previews'][0]['url'],
        artworkRawUrl: json['attributes']['artwork']['url'],
        artistName: json['attributes']['artistName'],
        releaseDate: json['attributes']['releaseDate'],
        albumName: json['attributes']['albumName']);
  }

  String artworkUrl(int size) {
    return this.artworkRawUrl.replaceAll('{w}x{h}', "${size}x$size");
  }
}
