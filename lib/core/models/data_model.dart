import 'package:equatable/equatable.dart';

class DataModel extends Equatable {
  final int? totalDay;
  final int? totalDayLeft;
  final int? totalDayUsed;
  final List<LeaveRequests>? leaveRequests;

  const DataModel({
    this.totalDay,
    this.totalDayLeft,
    this.totalDayUsed,
    this.leaveRequests,
  });

  factory DataModel.fromJson(Map<dynamic, dynamic> json) {
    return DataModel(
        totalDay: json['total_day'],
        totalDayLeft: json['total_day_left'],
        totalDayUsed: json['total_day_used'],
        leaveRequests: getLeaveRequests(json['leave_requests']));
  }

  static List<LeaveRequests>? getLeaveRequests(json) {
    List<LeaveRequests>? _leaveRequests;
    if (json != null) {
      _leaveRequests = <LeaveRequests>[];
      json.forEach((v) {
        _leaveRequests!.add(LeaveRequests.fromJson(v));
      });
    }
    return _leaveRequests;
  }

  @override
  List<Object?> get props =>
      [totalDay, totalDayLeft, totalDayUsed, leaveRequests];
}

class LeaveRequests extends Equatable {
  final status;
  final List<RequestList>? requestList;

  const LeaveRequests({this.status, this.requestList});

  factory LeaveRequests.fromJson(Map<String, dynamic> json) {
    return LeaveRequests(
      status: json['status'],
      requestList: getRequestList(json['request_list']),
    );
  }

  static List<RequestList>? getRequestList(json) {
    List<RequestList>? _requestList;
    if (json != null) {
      _requestList = <RequestList>[];
      json.forEach((v) {
        _requestList!.add(RequestList.fromJson(v));
      });
    }
    return _requestList;
  }

  @override
  List<Object?> get props => [status, requestList];
}

class RequestList extends Equatable {
  final date;
  final type;

  const RequestList({this.date, this.type});

  factory RequestList.fromJson(Map<String, dynamic> json) {
    return RequestList(
      date: json['date'],
      type: json['type'],
    );
  }

  @override
  List<Object> get props => [date, type];
}
