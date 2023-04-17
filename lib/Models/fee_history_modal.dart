// To parse this JSON data, do
//
//     final feeHistoryModal = feeHistoryModalFromJson(jsonString);

import 'dart:convert';

FeeHistoryModal feeHistoryModalFromJson(String str) => FeeHistoryModal.fromJson(json.decode(str));

String feeHistoryModalToJson(FeeHistoryModal data) => json.encode(data.toJson());

class FeeHistoryModal {
  FeeHistoryModal({
    this.status,
    this.statusMessage,
    this.data,
  });

  int? status;
  String? statusMessage;
  HistoryDataModal? data;

  factory FeeHistoryModal.fromJson(Map<String, dynamic> json) => FeeHistoryModal(
    status: json["status"],
    statusMessage: json["status_message"],
    data: json["data"] == null ? null : HistoryDataModal.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status_message": statusMessage,
    "data": data?.toJson(),
  };
}

class HistoryDataModal {
  HistoryDataModal({
    this.grandTotal,
    this.balance,
    this.feePaidDetails,
  });

  int? grandTotal;
  int? balance;
  List<FeePaidDetail>? feePaidDetails;

  factory HistoryDataModal.fromJson(Map<String, dynamic> json) => HistoryDataModal(
    grandTotal: json["grand_total"],
    balance: json["balance"],
    feePaidDetails: json["fee_paid_details"] == null ? [] : List<FeePaidDetail>.from(json["fee_paid_details"]!.map((x) => FeePaidDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "grand_total": grandTotal,
    "balance": balance,
    "fee_paid_details": feePaidDetails == null ? [] : List<dynamic>.from(feePaidDetails!.map((x) => x.toJson())),
  };
}

class FeePaidDetail {
  FeePaidDetail({
    this.feeMonth,
    this.totalAmt,
    this.studentName,
    this.receiptNo,
    this.className,
    this.divisionName,
    this.detail,
  });

  String? feeMonth;
  String? totalAmt;
  String? studentName;
  String? receiptNo;
  String? className;
  String? divisionName;
  List<PaidSubDetail>? detail;

  factory FeePaidDetail.fromJson(Map<String, dynamic> json) => FeePaidDetail(
    feeMonth: json["fee_month"],
    totalAmt: json["total_amt"],
    studentName: json["student_name"],
    receiptNo: json["receipt_no"],
    className: json["class_name"],
    divisionName: json["division_name"],
    detail: json["detail"] == null ? [] : List<PaidSubDetail>.from(json["detail"]!.map((x) => PaidSubDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "fee_month": feeMonth,
    "total_amt": totalAmt,
    "student_name": studentName,
    "receipt_no": receiptNo,
    "class_name": className,
    "division_name": divisionName,
    "detail": detail == null ? [] : List<dynamic>.from(detail!.map((x) => x.toJson())),
  };
}

class PaidSubDetail {
  PaidSubDetail({
    this.feeName,

    this.feeAmount,
    this.fine,
    this.concession,
    this.alreadyPaid,
    this.paidDate,
    this.balance,
  });

  String? feeName;

  String? feeAmount;
  String? fine;
  String? concession;
  String? alreadyPaid;
  String? paidDate;
  String? balance;

  factory PaidSubDetail.fromJson(Map<String, dynamic> json) => PaidSubDetail(
    feeName: json["fee_name"],

    feeAmount: json["fee_amount"],
    fine: json["fine"],
    concession: json["concession"],
    alreadyPaid: json["already_paid"],
    paidDate: json["paid_date"],
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "fee_name": feeName,

    "fee_amount": feeAmount,
    "fine": fine,
    "concession": concession,
    "already_paid": alreadyPaid,
    "paid_date": paidDate,
    "balance": balance,
  };
}
