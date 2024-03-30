// To parse this JSON data, do
//
//     final resultModel = resultModelFromJson(jsonString);

import 'dart:convert';

List<ResultModel> resultModelFromJson(String str) => List<ResultModel>.from(json.decode(str).map((x) => ResultModel.fromJson(x)));

String resultModelToJson(List<ResultModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResultModel {
  String? id;
  StudentId? studentId;
  SubjectId? subjectId;
  int? term;
  int? marks;
  int? v;
  String? subjectName;
  String? studentName;

  ResultModel({
    this.id,
    this.studentId,
    this.subjectId,
    this.term,
    this.marks,
    this.v,
    this.subjectName,
    this.studentName
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
    id: json["_id"],
    studentId: json["studentId"] == null ? null : StudentId.fromJson(json["studentId"]),
    subjectId: json["subjectId"] == null ? null : SubjectId.fromJson(json["subjectId"]),
    term: json["term"],
    marks: json["marks"],
    v: json["__v"],
    subjectName: json["subjectId"] != null ? json["subjectId"]["name"] : null,
    studentName: json["studentId"]!=null?json["studentId"]["fullname"] :null,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "studentId": studentId?.toString(),
    "subjectId": subjectId?.toString(),
    "term": term,
    "marks": marks,
    "__v": v,
    "subjectName":subjectName,
    "studentName":studentName
  };
  @override
  String toString() {
    String studentIdString = studentId != null ? 'studentId: ${studentId!.id}, ' : 'studentId: null, ';
    String subjectIdString = subjectId != null ? 'subjectId: ${subjectId!.id}, ' : 'subjectId: null, ';

    return 'Result($studentIdString, $subjectIdString'
        'term: $term, marks: $marks, subjectName:$subjectName,studentName:$studentName)';
  }
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
}

class SubjectId {
  String? id;
  String? name;
  int? v;

  SubjectId({
    this.id,
    this.name,
    this.v,
  });

  factory SubjectId.fromJson(Map<String, dynamic> json) => SubjectId(
    id: json["_id"],
    name: json["name"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "__v": v,
  };
}
