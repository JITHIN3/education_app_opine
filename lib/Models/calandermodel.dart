// To parse this JSON data, do
//
//     final calanderModel = calanderModelFromJson(jsonString);

import 'dart:convert';

CalendarModel calendarModelFromJson(String str) => CalendarModel.fromJson(json.decode(str));

String calendarModelToJson(CalendarModel data) => json.encode(data.toJson());


class CalendarModel {
  CalendarModel({
    required this.holidayList,
    required this.eventList,
  });

  List<HolidayList> holidayList;
  List<dynamic> eventList;

  factory CalendarModel.fromJson(Map<String, dynamic> json) => CalendarModel(
    holidayList: List<HolidayList>.from(json["holiday_list"].map((x) => HolidayList.fromJson(x))),
    eventList: List<dynamic>.from(json["event_list"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "holiday_list": List<dynamic>.from(holidayList.map((x) => x.toJson())),
    "event_list": List<dynamic>.from(eventList.map((x) => x)),
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
  AcademicYear? academicYear;
  String? year;
  String? mon;
  String? day;
  String? reason;
  String? holidayFlag;
  ClassIn? classIn;
  HolidaySetId? holidaySetId;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory HolidayList.fromJson(Map<String, dynamic> json) => HolidayList(
    id: json["id"],
    academicYear: academicYearValues.map[json["academic_year"]],
    year: json["year"],
    mon: json["mon"],
    day: json["day"],
    reason: json["reason"],
    holidayFlag: json["holiday_flag"],
    classIn: classInValues.map[json["class_in"]],
    holidaySetId: holidaySetIdValues.map[json["holiday_set_id"]],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "academic_year": academicYearValues.reverse![academicYear],
    "year": year,
    "mon": mon,
    "day": day,
    "reason": reason,
    "holiday_flag": holidayFlag,
    "class_in": classInValues.reverse![classIn],
    "holiday_set_id": holidaySetIdValues.reverse![holidaySetId],
    "status": status,
    "created_at": "${createdAt?.year.toString().padLeft(4, '0')}-${createdAt?.month.toString().padLeft(2, '0')}-${createdAt?.day.toString().padLeft(2, '0')}",
    "updated_at": updatedAt?.toIso8601String(),
  };
}

enum AcademicYear { THE_20222023 }

final academicYearValues = EnumValues({
  "'2022-2023'": AcademicYear.THE_20222023
});

enum ClassIn { THE_1234567891011121314 }

final classInValues = EnumValues({
  "1,2,3,4,5,6,7,8,9,10,11,12,13,14": ClassIn.THE_1234567891011121314
});

enum HolidaySetId { THE_62_AF0983_B0_B97 }

final holidaySetIdValues = EnumValues({
  "62af0983b0b97": HolidaySetId.THE_62_AF0983_B0_B97
});

class EnumValues<T> {
  Map<String , T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
