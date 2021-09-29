import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:music_search_app/core/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'data_event.dart';
part 'data_state.dart';

const url = "https://maqe.github.io/json/holidays.json";

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc({required this.httpClient}) : super(const DataState());

  final http.Client httpClient;
  @override
  Stream<DataState> mapEventToState(
    DataEvent event,
  ) async* {
    if (event is DataFetched) {
      yield await _mapDataFetchedToState(state);
    }
  }

  Future<DataState> _mapDataFetchedToState(DataState state) async {
    try {
      if (state.status == DataStatus.initial) {
        final _data = await _fetchData();
        return state.copyWith(
          status: DataStatus.success,
          data: _data,
        );
      }
      final _data = await _fetchData();

      return state.copyWith(
        status: DataStatus.success,
        data: _data,
      );
    } on Exception {
      return state.copyWith(status: DataStatus.failure);
    }
  }

  Future<DataModel> _fetchData() async {
    final response = await http.get(Uri.parse('$url'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return DataModel.fromJson(body);
    }
    throw Exception('Ooops! Something went wrong.');
  }
}
