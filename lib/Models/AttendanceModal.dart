// To parse this JSON data, do
//
//     final attendanceModal = attendanceModalFromJson(jsonString);

import 'dart:convert';

AttendanceModal attendanceModalFromJson(String str) => AttendanceModal.fromJson(json.decode(str));

String attendanceModalToJson(AttendanceModal data) => json.encode(data.toJson());

class AttendanceModal {
  AttendanceModal({
    this.status,
    this.statusMessage,
    this.data,
  });

  int? status;
  String? statusMessage;
  AttendanceDataModal? data;

  factory AttendanceModal.fromJson(Map<String, dynamic> json) => AttendanceModal(
    status: json["status"],
    statusMessage: json["status_message"],
    data: json["data"] == null ? null : AttendanceDataModal.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status_message": statusMessage,
    "data": data?.toJson(),
  };
}

class AttendanceDataModal {
  AttendanceDataModal({
    this.statusMessage,
    this.status,
    this.attendanceInfo,
    this.monthList,
  });

  String? statusMessage;
  int? status;
  AttendanceInfo? attendanceInfo;
  List<MonthList>? monthList;

  factory AttendanceDataModal.fromJson(Map<String, dynamic> json) => AttendanceDataModal(
    statusMessage: json["status_message"],
    status: json["status"],
    attendanceInfo: json["attendance_info"] == null ? null : AttendanceInfo.fromJson(json["attendance_info"]),
    monthList: json["month_list"] == null ? [] : List<MonthList>.from(json["month_list"]!.map((x) => MonthList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_message": statusMessage,
    "status": status,
    "attendance_info": attendanceInfo?.toJson(),
    "month_list": monthList == null ? [] : List<dynamic>.from(monthList!.map((x) => x.toJson())),
  };
}

class AttendanceInfo {
  AttendanceInfo({
    this.totalAbsent,
    this.totalWorkingDays,
    this.totalPresentDays,
    this.attendancePercentage,
    this.dateOfAbsent,
  });

  int? totalAbsent;
  int? totalWorkingDays;
  int? totalPresentDays;
  String? attendancePercentage;
  dynamic dateOfAbsent;

  factory AttendanceInfo.fromJson(Map<String, dynamic> json) => AttendanceInfo(
    totalAbsent: json["total_absent"],
    totalWorkingDays: json["total_working_days"],
    totalPresentDays: json["total_present_days"],
    attendancePercentage: json["attendance_percentage"],
    dateOfAbsent: json["date_of_absent"],
  );

  Map<String, dynamic> toJson() => {
    "total_absent": totalAbsent,
    "total_working_days": totalWorkingDays,
    "total_present_days": totalPresentDays,
    "attendance_percentage": attendancePercentage,
    "date_of_absent": dateOfAbsent,
  };
}

class MonthList {
  MonthList({
    this.month,
    this.totalDays,
    this.notPresnt,
    this.present,
  });

  String? month;
  int? totalDays;
  int? notPresnt;
  int? present;

  factory MonthList.fromJson(Map<String, dynamic> json) => MonthList(
    month: json["month"],
    totalDays: json["total_days"],
    notPresnt: json["not_presnt"],
    present: json["present"],
  );

  Map<String, dynamic> toJson() => {
    "month": month,
    "total_days": totalDays,
    "not_presnt": notPresnt,
    "present": present,
  };
}
