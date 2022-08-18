// To parse this JSON data, do
//
//     final adminChatModel = adminChatModelFromJson(jsonString);

import 'dart:convert';

AdminChatModel adminChatModelFromJson(String str) => AdminChatModel.fromJson(json.decode(str));

String adminChatModelToJson(AdminChatModel data) => json.encode(data.toJson());

class AdminChatModel {
  AdminChatModel({
    this.messageId,
    this.date,
    this.time,
    this.sentBy,
    this.subject,
    this.message,
    this.messageType,
  });

  String? messageId;
  DateTime? date;
  String? time;
  String? sentBy;
  String? subject;
  String? message;
  String? messageType;

  factory AdminChatModel.fromJson(Map<String, dynamic> json) => AdminChatModel(
    messageId: json["message_id"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    sentBy: json["sent_by"],
    subject: json["subject"],
    message: json["message"],
    messageType: json["message_type"],
  );

  Map<String, dynamic> toJson() => {
    "message_id": messageId,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
    "sent_by": sentBy,
    "subject": subject,
    "message": message,
    "message_type": messageType,
  };
}
