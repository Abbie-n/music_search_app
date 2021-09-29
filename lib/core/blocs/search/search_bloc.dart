import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:music_search_app/core/helper/request_helper.dart';
import 'package:music_search_app/core/models/search_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required this.httpClient}) : super(const SearchState());

  final http.Client httpClient;
  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchDone) {
      yield await _mapDataFetchedToState(state);
    }
  }

  Future<SearchState> _mapDataFetchedToState(SearchState state) async {
    try {
      if (state.status == SearchStatus.initial) {
        final _data = await _search();
        return state.copyWith(
          status: SearchStatus.success,
          data: _data,
        );
      }
      final _data = await _search();

      return state.copyWith(
        status: SearchStatus.success,
        data: _data,
      );
    } on Exception {
      return state.copyWith(status: SearchStatus.failure);
    }
  }

  Future<SearchModel> _search() async {
    String key = await RequestHelper().getKey();
    String? url = RequestHelper().getSearchResultsUrl(apiKey: key);
    final response = await http.get(Uri.parse('$url'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return SearchModel.fromJson(body);
    }
    throw Exception('Ooops! Something went wrong.');
  }
}
