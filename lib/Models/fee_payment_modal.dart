// To parse this JSON data, do
//
//     final feePaymentModal = feePaymentModalFromJson(jsonString);

import 'dart:convert';

FeePaymentModal feePaymentModalFromJson(String str) => FeePaymentModal.fromJson(json.decode(str));

String feePaymentModalToJson(FeePaymentModal data) => json.encode(data.toJson());

class FeePaymentModal {
  FeePaymentModal({
    this.status,
    this.statusMessage,
    this.data,
  });

  int? status;
  String? statusMessage;
  PaymentDataModal? data;

  factory FeePaymentModal.fromJson(Map<String, dynamic> json) => FeePaymentModal(
    status: json["status"],
    statusMessage: json["status_message"],
    data: json["data"] == null ? null : PaymentDataModal.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status_message": statusMessage,
    "data": data?.toJson(),
  };
}

class PaymentDataModal {
  PaymentDataModal({
    this.grandTotal,
    this.transDetails,
    this.feeDetails,
  });

  GrandTotal? grandTotal;
  String? transDetails;
  List<FeeDetail>? feeDetails;

  factory PaymentDataModal.fromJson(Map<String, dynamic> json) => PaymentDataModal(
    grandTotal: json["grand_total"] == null ? null : GrandTotal.fromJson(json["grand_total"]),
    transDetails: json["trans_details"] == null?"":json["trans_details"],
    feeDetails: json["fee_details"] == null ? [] : List<FeeDetail>.from(json["fee_details"]!.map((x) => FeeDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "grand_total": grandTotal?.toJson(),
    "trans_details": transDetails,
    "fee_details": feeDetails == null ? [] : List<dynamic>.from(feeDetails!.map((x) => x.toJson())),
  };
}

class FeeDetail {
  FeeDetail({
    this.feeMonthName,
    this.feeMonth,
    this.totalAmount,
    this.bal,
    this.details,
    this.dueDate,
  });

  String? feeMonthName;
  int? feeMonth;
  String? totalAmount;
  int? bal;
  List<PaymentDetailModal>? details;
  String? dueDate;

  factory FeeDetail.fromJson(Map<String, dynamic> json) => FeeDetail(
    feeMonthName: json["fee_month_name"],
    feeMonth: json["fee_month"],
    totalAmount: json["total_amount"],
    bal: json["bal"],
    details: json["details"] == null ? [] : List<PaymentDetailModal>.from(json["details"]!.map((x) => PaymentDetailModal.fromJson(x))),
    dueDate: json["due_date"],
  );

  Map<String, dynamic> toJson() => {
    "fee_month_name": feeMonthName,
    "fee_month": feeMonth,
    "total_amount": totalAmount,
    "bal": bal,
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
    "due_date": dueDate,
  };
}

class PaymentDetailModal {
  PaymentDetailModal({
    this.feeSettingsId,
    this.feeheadId,
    this.feeheadName,
    this.amount,
  });

  String? feeSettingsId;
  String? feeheadId;
  String? feeheadName;
  String? amount;


  factory PaymentDetailModal.fromJson(Map<String, dynamic> json) => PaymentDetailModal(
    feeSettingsId: json["id"],
    feeheadId: json["feehead_id"],
    feeheadName: json["feehead_name"],
    amount: json["monthly_fee_amt"],

  );

  Map<String, dynamic> toJson() => {
    "fee_settings_id": feeSettingsId,
    "feehead_id": feeheadId,
    "feehead_name": feeheadName,
    "monthly_fee_amt": amount,
  };
}

class GrandTotal {
  GrandTotal({
    this.grandTotal,
    this.balance,
    this.percentage,
  });

  int? grandTotal;
  int? balance;
  double? percentage;

  factory GrandTotal.fromJson(Map<String, dynamic> json) => GrandTotal(
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

