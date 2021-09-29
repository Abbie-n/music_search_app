import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_search_app/core/helper/request_helper.dart';
import 'package:music_search_app/core/models/info_model.dart';
import 'package:http/http.dart' as http;

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc({
    this.httpClient,
    this.album,
    this.artist,
  }) : super(const InfoState());

  final http.Client? httpClient;
  final album;
  final artist;

  @override
  Stream<InfoState> mapEventToState(
    InfoEvent event,
  ) async* {
    if (event is DataFetched) {
      yield await _mapDataFetchedToState(state);
    }
  }

  Future<InfoState> _mapDataFetchedToState(InfoState state) async {
    try {
      if (state.status == InfoStatus.initial) {
        final _data = await _getInfo(album, artist);
        return state.copyWith(
          status: InfoStatus.success,
          data: _data,
        );
      }
      final _data = await _getInfo(album, artist);

      return state.copyWith(
        status: InfoStatus.success,
        data: _data,
      );
    } on Exception {
      return state.copyWith(status: InfoStatus.failure);
    }
  }

  Future<InfoModel> _getInfo(String album, String artist) async {
    String key = await RequestHelper().getKey();
    String? url = RequestHelper()
        .getTAlbumDetailsUrl(apiKey: key, album: '$album', artist: '$artist');
    final response = await http.get(Uri.parse('$url'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return InfoModel.fromJson(body);
    }
    throw Exception('Ooops! Something went wrong.');
  }
}
