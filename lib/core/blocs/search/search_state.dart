part of 'search_bloc.dart';

enum SearchStatus { initial, success, failure }

class SearchState extends Equatable {
  const SearchState({
    this.status = SearchStatus.initial,
    this.data = const SearchModel(),
  });

  final SearchStatus status;
  final SearchModel data;

  SearchState copyWith({
    SearchStatus? status,
    SearchModel? data,
  }) {
    return SearchState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => [status, data];
}
