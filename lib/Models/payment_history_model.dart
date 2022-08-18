// class PaymentHistoryModel {
//   int? status;
//   String? statusMessage;
//   List<Data>? data;
//
//   PaymentHistoryModel({this.status, this.statusMessage, this.data});
//
//   PaymentHistoryModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     statusMessage = json['status_message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['status_message'] = this.statusMessage;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class PaymentHistoryModel {
  String? feeName;
  String? feeAmount;
  String? fine;
  String? concession;
  String? alreadyPaid;
  String? paidDate;
  String? balance;

  PaymentHistoryModel(
      {this.feeName,
        this.feeAmount,
        this.fine,
        this.concession,
        this.alreadyPaid,
        this.paidDate,
        this.balance});

  PaymentHistoryModel.fromJson(Map<String, dynamic> json) {
    feeName = json['fee_name'];
    feeAmount = json['fee_amount'];
    fine = json['fine'];
    concession = json['concession'];
    alreadyPaid = json['already_paid'];
    paidDate = json['paid_date'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fee_name'] = this.feeName;
    data['fee_amount'] = this.feeAmount;
    data['fine'] = this.fine;
    data['concession'] = this.concession;
    data['already_paid'] = this.alreadyPaid;
    data['paid_date'] = this.paidDate;
    data['balance'] = this.balance;
    return data;
  }
}