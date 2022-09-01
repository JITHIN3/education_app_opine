// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

EventModel eventModelFromJson(String str) => EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());


class EventModel {
  EventModel({
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

  String? academicYear;
  String? id;
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

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
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
