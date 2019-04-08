class Genre {
  final String id;
  final String type;
  final String href;
  final String name;

  Genre({this.id, this.type, this.href, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
        id: json['id'],
        type: json['type'],
        href: json['href'],
        name: json['attributes']['name']);
  }
}
