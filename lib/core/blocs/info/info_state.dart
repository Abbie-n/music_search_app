part of 'info_bloc.dart';

enum InfoStatus { initial, success, failure }

class InfoState extends Equatable {
  const InfoState({
    this.status = InfoStatus.initial,
    this.data = const InfoModel(),
  });

  final InfoStatus status;
  final InfoModel data;

  InfoState copyWith({
    InfoStatus? status,
    InfoModel? data,
  }) {
    return InfoState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => [status, data];
}
