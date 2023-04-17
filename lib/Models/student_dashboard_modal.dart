// To parse this JSON data, do
//
//     final studentDashboardModal = studentDashboardModalFromJson(jsonString);

import 'dart:convert';

StudentDashboardModal studentDashboardModalFromJson(String str) => StudentDashboardModal.fromJson(json.decode(str));

String studentDashboardModalToJson(StudentDashboardModal data) => json.encode(data.toJson());

class StudentDashboardModal {
  StudentDashboardModal({
     this.status,
     this.statusMessage,
     this.data,
  });

  int? status;
  String? statusMessage;
  Data? data;

  factory StudentDashboardModal.fromJson(Map<String, dynamic> json) => StudentDashboardModal(
    status: json["status"],
    statusMessage: json["status_message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status_message": statusMessage,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    required this.details,
  });

  DashboardDetailsModal details;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    details: DashboardDetailsModal.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "details": details.toJson(),
  };
}

class DashboardDetailsModal {
  DashboardDetailsModal({
     this.grandTotal,
     this.balance,
     this.percentage,
  });

  int? grandTotal;
  int? balance;
  double? percentage;

  factory DashboardDetailsModal.fromJson(Map<String, dynamic> json) => DashboardDetailsModal(
    grandTotal: json["grand_total"],
    balance: json["balance"],
    percentage: json["percentage"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "grand_total": grandTotal,
    "balance": balance,
    "percentage": percentage,
  };
}
