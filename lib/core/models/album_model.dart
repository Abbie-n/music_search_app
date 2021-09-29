import 'package:equatable/equatable.dart';

class Album extends Equatable {
  final String? name;
  final String? mbid;
  final String? url;
  final String? artist;
  final List<Image>? image;

  const Album({this.name, this.mbid, this.url, this.artist, this.image});

  factory Album.fromJson(Map<dynamic, dynamic> json) {
    return Album(
      name: json['name'],
      mbid: json['mbid'],
      url: json['url'],
      artist: json['artist'],
      image: getImages(json['image']),
    );
  }
  static List<Image>? getImages(json) {
    List<Image>? _images;
    if (json != null) {
      _images = <Image>[];
      json.forEach((v) {
        _images!.add(Image.fromJson(v));
      });
    }
    return _images;
  }

  @override
  List<Object?> get props => [name, mbid, url, artist, image];
}

class Artist extends Equatable {
  final String? name;
  final String? mbid;
  final String? url;

  const Artist({this.name, this.mbid, this.url});

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      name: json['name'],
      mbid: json['mbid'],
      url: json['url'],
    );
  }

  @override
  List<Object?> get props => [name, mbid, url];
}

class Image extends Equatable {
  final String? text;
  final String? size;

  const Image({this.text, this.size});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      text: json['#text'],
      size: json['size'],
    );
  }

  @override
  List<Object?> get props => [text, size];
}
