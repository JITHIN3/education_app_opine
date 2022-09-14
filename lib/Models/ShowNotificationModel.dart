// To parse this JSON data, do
//
//     final notificationModels = notificationModelsFromJson(jsonString);

import 'dart:convert';

NotificationModels notificationModelsFromJson(String str) => NotificationModels.fromJson(json.decode(str));

String notificationModelsToJson(NotificationModels data) => json.encode(data.toJson());


class NotificationModels {
  NotificationModels({
    this.id,
    this.studentId,
    this.notificationType,
    this.title,
    this.message,
    this.status,
    this.dateCreated,
  });

  String? id;
  String? studentId;
  String? notificationType;
  String? title;
  String? message;
  String? status;
  String? dateCreated;

  factory NotificationModels.fromJson(Map<String, dynamic> json) => NotificationModels(
    id: json["id"],
    studentId: json["student_id"],
    notificationType: json["notification_type"],
    title: json["title"],
    message: json["message"],
    status: json["status"],
    dateCreated:json["date_created"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student_id": studentId,
    "notification_type": notificationType,
    "title": title,
    "message": message,
    "status": status,
    "date_created": dateCreated,
  };
}
