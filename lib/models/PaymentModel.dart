// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);

import 'dart:convert';

List<PaymentModel> paymentModelFromJson(String str) => List<PaymentModel>.from(json.decode(str).map((x) => PaymentModel.fromJson(x)));

String paymentModelToJson(List<PaymentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentModel {
  String? id;
  StudentId? studentId;
  int? totalAmount;
  int? paidAmount;
  int? dueAmount;
  FeeId? feeId;
  bool? isPaid;
  List<Installment>? installments;
  int? v;

  PaymentModel({
    this.id,
    this.studentId,
    this.totalAmount,
    this.paidAmount,
    this.dueAmount,
    this.feeId,
    this.isPaid,
    this.installments,
    this.v,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    id: json["_id"],
    studentId: json["studentId"] == null ? null : StudentId.fromJson(json["studentId"]),
    totalAmount: json["totalAmount"],
    paidAmount: json["paidAmount"],
    dueAmount: json["dueAmount"],
    feeId: json["feeId"] == null ? null : FeeId.fromJson(json["feeId"]),
    isPaid: json["isPaid"],
    installments: json["installments"] == null ? [] : List<Installment>.from(json["installments"]!.map((x) => Installment.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "studentId": studentId?.toString(),
    "totalAmount": totalAmount,
    "paidAmount": paidAmount,
    "dueAmount": dueAmount,
    "feeId": feeId?.toString(),
    "isPaid": isPaid,
    "installments": installments == null ? [] : List<dynamic>.from(installments!.map((x) => x.toJson())),
    "__v": v,
  };

  @override
  String toString() {
    String installmentString = installments!.map((installment) =>
    '{installmentNumber: ${installment.installmentNumber}, '
        'amountPaid: ${installment.amountPaid}, '
        'paymentDate: ${installment.paymentDate}}').join(', ');

    return 'Payment(studentId: $studentId, totalAmount: $totalAmount, '
        'paidAmount: $paidAmount, dueAmount: $dueAmount, feeId: $feeId, '
        'installments: [$installmentString], isPaid: $isPaid)';
  }

}

class FeeId {
  String? id;
  String? feeIdClass;
  String? feeType;
  String? description;
  int? amount;
  int? v;
  String? className;

  FeeId({
    this.id,
    this.feeIdClass,
    this.feeType,
    this.description,
    this.amount,
    this.v,
    this.className,
  });

  factory FeeId.fromJson(Map<String, dynamic> json) => FeeId(
    id: json["_id"],
    feeIdClass: json["class"],
    feeType: json["feeType"],
    description: json["description"],
    amount: json["amount"],
    v: json["__v"],
    className: json["className"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "class": feeIdClass,
    "feeType": feeType,
    "description": description,
    "amount": amount,
    "__v": v,
    "className": className,
  };
  @override
  String toString() {

    return '$id';
  }
}

class Installment {
  int? installmentNumber;
  int? amountPaid;
  DateTime? paymentDate;
  String? id;

  Installment({
    this.installmentNumber,
    this.amountPaid,
    this.paymentDate,
    this.id,
  });

  factory Installment.fromJson(Map<String, dynamic> json) => Installment(
    installmentNumber: json["installmentNumber"],
    amountPaid: json["amountPaid"],
    paymentDate: json["paymentDate"] == null ? null : DateTime.parse(json["paymentDate"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "installmentNumber": installmentNumber,
    "amountPaid": amountPaid,
    "paymentDate": paymentDate?.toIso8601String(),
    "_id": id,
  };
}

class StudentId {
  String? id;
  String? fullname;
  String? gender;
  String? className;
  String? parents;
  String? address;
  DateTime? dateofbirth;
  String? phone;
  String? username;
  String? password;
  int? v;

  StudentId({
    this.id,
    this.fullname,
    this.gender,
    this.className,
    this.parents,
    this.address,
    this.dateofbirth,
    this.phone,
    this.username,
    this.password,
    this.v,
  });

  factory StudentId.fromJson(Map<String, dynamic> json) => StudentId(
    id: json["_id"],
    fullname: json["fullname"],
    gender: json["gender"],
    className: json["className"],
    parents: json["parents"],
    address: json["address"],
    dateofbirth: json["dateofbirth"] == null ? null : DateTime.parse(json["dateofbirth"]),
    phone: json["phone"],
    username: json["username"],
    password: json["password"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullname": fullname,
    "gender": gender,
    "className": className,
    "parents": parents,
    "address": address,
    "dateofbirth": dateofbirth?.toIso8601String(),
    "phone": phone,
    "username": username,
    "password": password,
    "__v": v,
  };
  @override
  String toString() {

    return '$id';
  }

}
