import 'package:equatable/equatable.dart';
import 'package:music_search_app/core/models/album_model.dart';

class SearchModel extends Equatable {
  final Results? results;

  const SearchModel({this.results});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
        results: json['results'] != null
            ? Results.fromJson(
                json['results'],
              )
            : null);
  }

  @override
  List<Object?> get props => [results];
}

class Results extends Equatable {
  final String? opensearchTotalResults;
  final Albummatches? albummatches;

  const Results({this.opensearchTotalResults, this.albummatches});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
        opensearchTotalResults: json['opensearch:totalResults'],
        albummatches: json['albummatches'] != null
            ? Albummatches.fromJson(json['albummatches'])
            : null);
  }
  @override
  List<Object?> get props => [opensearchTotalResults, albummatches];
}

class Albummatches extends Equatable {
  final List<Album>? album;

  const Albummatches({this.album});

  factory Albummatches.fromJson(Map<String, dynamic> json) {
    return Albummatches(
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
