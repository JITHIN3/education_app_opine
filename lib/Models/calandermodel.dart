// To parse this JSON data, do
//
//     final calanderModel = calanderModelFromJson(jsonString);

import 'dart:convert';

CalendarModel calendarModelFromJson(String str) => CalendarModel.fromJson(json.decode(str));

String calendarModelToJson(CalendarModel data) => json.encode(data.toJson());


class CalendarModel {
  CalendarModel({
     this.holidayList,
     this.eventList,
  });

  List<HolidayList>? holidayList;
  List<EventList>? eventList;

  factory CalendarModel.fromJson(Map<String, dynamic> json) => CalendarModel(
    holidayList: List<HolidayList>.from(json["holiday_list"].map((x) => HolidayList.fromJson(x))),
    eventList: List<EventList>.from(json["event_list"].map((x) => EventList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "holiday_list": List<dynamic>.from(holidayList!.map((x) => x.toJson())),
    "event_list": List<dynamic>.from(eventList!.map((x) => x.toJson())),
  };
}

class HolidayList {
  HolidayList({
    this.id,
    this.academicYear,
    this.year,
    this.mon,
    this.day,
    this.reason,
    this.holidayFlag,
    this.classIn,
    this.holidaySetId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? academicYear;
  String? year;
  String? mon;
  String? day;
  String? reason;
  String? holidayFlag;
  String? classIn;
  String? holidaySetId;
  String? status;
  String? createdAt;
  String? updatedAt;

  factory HolidayList.fromJson(Map<String, dynamic> json) => HolidayList(
    id: json["id"],
    academicYear: json["academic_year"],
    year: json["year"],
    mon: json["mon"],
    day: json["day"],
    reason: json["reason"],
    holidayFlag: json["holiday_flag"],
    classIn: json["class_in"],
    holidaySetId: json["holiday_set_id"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "academic_year": academicYear,
    "year": year,
    "mon": mon,
    "day": day,
    "reason": reason,
    "holiday_flag": holidayFlag,
    "class_in": classIn,
    "holiday_set_id": holidaySetId,
    "status": status,
    "created_at":createdAt,
    "updated_at": updatedAt,
  };
}
class EventList {
  EventList({
    this.id,
    this.academicYear,
    this.mon,
    this.day,
    this.year,
    this.reason,
    this.remarks,
    this.eventFlag,
    this.classIn,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.date,
  });

  String? id;
  String? academicYear;
  String? mon;
  String? day;
  String? year;
  String? reason;
  String? remarks;
  String? eventFlag;
  String? classIn;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? date;

  factory EventList.fromJson(Map<String, dynamic> json) => EventList(
    id: json["id"],
    academicYear: json["academic_year"],
    mon: json["mon"],
    day: json["day"],
    year: json["year"],
    reason: json["reason"],
    remarks: json["remarks"],
    eventFlag: json["event_flag"],
    classIn: json["class_in"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "academic_year": academicYear,
    "mon": mon,
    "day": day,
    "year": year,
    "reason": reason,
    "remarks": remarks,
    "event_flag": eventFlag,
    "class_in": classIn,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "date": date,
  };
}

