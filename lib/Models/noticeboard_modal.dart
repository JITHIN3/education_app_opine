// To parse this JSON data, do
//
//     final noticeBoardModal = noticeBoardModalFromJson(jsonString);

import 'dart:convert';

NoticeBoardModal noticeBoardModalFromJson(String str) => NoticeBoardModal.fromJson(json.decode(str));

String noticeBoardModalToJson(NoticeBoardModal data) => json.encode(data.toJson());

class NoticeBoardModal {
  NoticeBoardModal({
    this.status,
    this.statusMessage,
    this.data,
  });

  int? status;
  String? statusMessage;
  Data? data;

  factory NoticeBoardModal.fromJson(Map<String, dynamic> json) => NoticeBoardModal(
    status: json["status"],
    statusMessage: json["status_message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status_message": statusMessage,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.details,
  });

  List<NoticeBoardDetailModal>? details;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    details: json["details"] == null ? [] : List<NoticeBoardDetailModal>.from(json["details"]!.map((x) => NoticeBoardDetailModal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

class NoticeBoardDetailModal {
  NoticeBoardDetailModal({
    this.id,
    this.date,
    this.classId,
    this.divisionId,
    this.teacherId,
    this.categoryId,
    this.newsHeading,
    this.newsSubHeading,
    this.newsContent,
    this.newsFilePath,
    this.status,
    this.createdAt,
    this.updatedAt,
    required this.isExpanded,
  });

  String? id;
  String? date;
  String? classId;
  String? divisionId;
  String? teacherId;
  String? categoryId;
  String? newsHeading;
  String? newsSubHeading;
  String? newsContent;
  String? newsFilePath;
  String? status;
  String? createdAt;
  String? updatedAt;
  bool isExpanded;

  factory NoticeBoardDetailModal.fromJson(Map<String, dynamic> json) => NoticeBoardDetailModal(
    id: json["id"],
    date: json["date"],
    classId: json["class_id"],
    divisionId: json["division_id"],
    teacherId: json["teacher_id"],
    categoryId: json["category_id"],
    newsHeading: json["news_heading"],
    newsSubHeading: json["news_sub_heading"],
    newsContent: json["news_content"],
    newsFilePath: json["news_file_path"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    isExpanded:false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "class_id": classId,
    "division_id": divisionId,
    "teacher_id": teacherId,
    "category_id": categoryId,
    "news_heading": newsHeading,
    "news_sub_heading": newsSubHeading,
    "news_content": newsContent,
    "news_file_path": newsFilePath,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
