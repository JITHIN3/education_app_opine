
import 'dart:convert';

MessageSentModel messageSentModelFromJson(String str) => MessageSentModel.fromJson(json.decode(str));

String messageSentModelToJson(MessageSentModel data) => json.encode(data.toJson());

class MessageSentModel {
  MessageSentModel({
    this.status,
    this.statusMessage,
    this.data,
  });

  int? status;
  String? statusMessage;
  String? data;

  factory MessageSentModel.fromJson(Map<String, dynamic> json) => MessageSentModel(
    status: json["status"],
    statusMessage: json["status_message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status_message": statusMessage,
    "data": data,
  };
}
