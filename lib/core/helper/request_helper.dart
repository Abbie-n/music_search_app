import 'dart:convert';

import 'package:flutter/services.dart';

class RequestHelper {
  Future<String> getKey() async {
    var jsonText = await rootBundle.loadString('assets/api_key.json');
    final _data = json.decode(jsonText);
    return _data['api_key'];
  }

  String baseUrl = 'http://ws.audioscrobbler.com/2.0/';
  // String? getTopAlbumsUrl({required String apiKey}) {
  //   String method = 'tag.gettopalbums';
  //   String tag = 'all';
  //   String _fullString =
  //       '$baseUrl?method=$method&tag=$tag&api_key=$apiKey&format=json';
  //   return _fullString;
  // }

  String? getSearchResultsUrl({
    required String apiKey,
    String? album,
  }) {
    String method = 'album.search';
    String _album = '$album';
    String _fullString =
        '$baseUrl?method=$method&album=$_album&api_key=$apiKey&format=json';
    return _fullString;
  }

  String? getTAlbumDetailsUrl({
    required String apiKey,
    String? artist,
    String? album,
  }) {
    String method = 'album.getinfo';
    String _artist = '$artist';
    String _album = '$album';
    String _fullString =
        '$baseUrl?method=$method&api_key=$apiKey&artist=$_artist&album=$_album&format=json';
    return _fullString;
  }
}
