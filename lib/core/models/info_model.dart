import 'package:equatable/equatable.dart';
import 'package:music_search_app/core/models/album_model.dart';

class InfoModel extends Equatable {
  final Album? album;

  const InfoModel({this.album});

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
        album: json['album'] != null ? Album.fromJson(json['album']) : null);
  }

  @override
  List<Object?> get props => [album];
}

class Album extends Equatable {
  final String? listeners;
  final String? playcount;
  final String? artist;
  final String? mbid;
  final Tracks? tracks;
  final String? url;
  final Tags? tags;
  final String? name;
  final List<Image>? image;

  const Album(
      {this.listeners,
      this.playcount,
      this.artist,
      this.mbid,
      this.tracks,
      this.url,
      this.tags,
      this.name,
      this.image});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      listeners: json['listeners'],
      playcount: json['playcount'],
      artist: json['artist'],
      mbid: json['mbid'],
      tracks: json['tracks'] != null ? Tracks.fromJson(json['tracks']) : null,
      url: json['url'],
      tags: json['tags'] != null ? Tags.fromJson(json['tags']) : null,
      name: json['name'],
      image: getImages(
        json['image'],
      ),
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
  List<Object?> get props =>
      [listeners, playcount, artist, mbid, tracks, url, tags, name, image];
}

class Tracks extends Equatable {
  final List<Track>? track;

  const Tracks({this.track});

  factory Tracks.fromJson(Map<String, dynamic> json) {
    return Tracks(track: getTracks(json['track']));
  }
  static List<Track>? getTracks(json) {
    print(json != null);
    List<Track>? _track = <Track>[];
    if (json != null && json.toString().contains('[')) {
      _track = <Track>[];
      json?.forEach((v) {
        _track!.add(Track.fromJson(v));
      });
    } else {
      _track.add(Track.fromJson(json));
    }
    return _track;
  }

  @override
  List<Object?> get props => [track];
}

class Track extends Equatable {
  final Artist? artist;
  final Attr? attr;
  final int? duration;
  final String? url;
  final String? name;
  final Streamable? streamable;

  const Track(
      {this.artist,
      this.attr,
      this.duration,
      this.url,
      this.name,
      this.streamable});

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      artist: json['artist'] != null ? Artist.fromJson(json['artist']) : null,
      attr: json['@attr'] != null ? Attr.fromJson(json['@attr']) : null,
      duration: json['duration'],
      url: json['url'],
      name: json['name'],
      streamable: json['streamable'] != null
          ? Streamable.fromJson(json['streamable'])
          : null,
    );
  }
  @override
  List<Object?> get props => [artist, attr, duration, url, name, streamable];
}

class Artist extends Equatable {
  final String? url;
  final String? name;
  final String? mbid;

  const Artist({this.url, this.name, this.mbid});

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      url: json['url'],
      name: json['name'],
      mbid: json['mbid'],
    );
  }
  @override
  List<Object?> get props => [url, name, mbid];
}

class Attr extends Equatable {
  final int? rank;

  const Attr({this.rank});

  factory Attr.fromJson(Map<String, dynamic> json) {
    return Attr(rank: json['rank']);
  }
  @override
  List<Object?> get props => [rank];
}

class Streamable extends Equatable {
  final String? fulltrack;
  final String? text;

  const Streamable({this.fulltrack, this.text});

  factory Streamable.fromJson(Map<String, dynamic> json) {
    return Streamable(
      fulltrack: json['fulltrack'],
      text: json['#text'],
    );
  }
  @override
  List<Object?> get props => [fulltrack, text];
}

class Tags extends Equatable {
  final List<Tag>? tag;

  const Tags({this.tag});

  factory Tags.fromJson(Map<String, dynamic> json) {
    return Tags(
      tag: getTag(
        json['tag'],
      ),
    );
  }
  static List<Tag>? getTag(json) {
    List<Tag>? _tag;
    if (json != null) {
      _tag = <Tag>[];
      json.forEach((v) {
        _tag!.add(Tag.fromJson(v));
      });
    }
    return _tag;
  }

  @override
  List<Object?> get props => [tag];
}

class Tag extends Equatable {
  final String? name;
  final String? url;

  const Tag({this.name, this.url});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      name: json['name'],
      url: json['url'],
    );
  }
  @override
  List<Object?> get props => [name, url];
}
