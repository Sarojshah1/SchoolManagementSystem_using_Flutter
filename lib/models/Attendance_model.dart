// To parse this JSON data, do
//
//     final attendanceModel = attendanceModelFromJson(jsonString);

import 'dart:convert';

List<AttendanceModel> attendanceModelFromJson(String str) => List<AttendanceModel>.from(json.decode(str).map((x) => AttendanceModel.fromJson(x)));

String attendanceModelToJson(List<AttendanceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AttendanceModel {
  String? id;
  String? studentId;
  String? className;
  DateTime? date;
  bool? isPresent;
  int? v;

  AttendanceModel({
    this.id,
    this.studentId,
    this.className,
    this.date,
    this.isPresent,
    this.v,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => AttendanceModel(
    id: json["_id"],
    studentId: json["studentId"],
    className: json["className"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    isPresent: json["isPresent"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "studentId": studentId,
    "className": className,
    "date": date?.toIso8601String(),
    "isPresent": isPresent,
    "__v": v,
  };
}
