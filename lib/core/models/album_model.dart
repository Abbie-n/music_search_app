import 'package:equatable/equatable.dart';

class AlbumModel extends Equatable {
  final Albums? albums;

  const AlbumModel({this.albums});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
        albums: json['albums'] != null
            ? new Albums.fromJson(json['albums'])
            : null);
  }

  @override
  List<Object?> get props => [albums];
}

class Albums extends Equatable {
  final List<Album>? album;

  const Albums({this.album});

  factory Albums.fromJson(Map<String, dynamic> json) {
    return Albums(
      album: getAlbum(
        json['album'],
      ),
    );
  }

  static List<Album>? getAlbum(json) {
    List<Album>? _album;
    if (json != null) {
      _album = <Album>[];
      json.forEach((v) {
        _album!.add(Album.fromJson(v));
      });
    }
    return _album;
  }

  @override
  List<Object?> get props => [album];
}

class Album extends Equatable {
  final String? name;
  final String? mbid;
  final String? url;
  final Artist? artist;
  final List<Image>? image;

  const Album({this.name, this.mbid, this.url, this.artist, this.image});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['name'],
      mbid: json['mbid'],
      url: json['url'],
      artist:
          json['artist'] != null ? new Artist.fromJson(json['artist']) : null,
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
