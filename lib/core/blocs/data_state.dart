part of 'data_bloc.dart';

enum DataStatus { initial, success, failure }

class DataState extends Equatable {
  const DataState({
    this.status = DataStatus.initial,
    this.data = const DataModel(),
  });

  final DataStatus status;
  final DataModel data;

  DataState copyWith({
    DataStatus? status,
    DataModel? data,
  }) {
    return DataState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => [status, data];
}
