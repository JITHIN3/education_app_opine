// To parse this JSON data, do
//
//     final studentDetailModel = studentDetailModelFromJson(jsonString);

import 'dart:convert';

StudentDetailModel studentDetailModelFromJson(String str) => StudentDetailModel.fromJson(json.decode(str));

String studentDetailModelToJson(StudentDetailModel data) => json.encode(data.toJson());



class StudentDetailModel {
  StudentDetailModel({
    this.studentId,
    this.admissionNo,
    this.academicYear,
    this.name,
    this.dataClass,
    this.division,
    this.dob,
    this.gender,
    this.religionId,
    this.imageUrl,
    this.address,
    this.pincode,
    this.state,
    this.country,
    this.phone,
    this.pschool,
    this.grade,
    this.mother,
    this.mEmail,
    this.mMobile,
    this.mOccupation,
    this.guardian,
    this.gMobile,
    this.gEmail,
    this.gEducation,
    this.gOccupation,
    this.gRelation,
    this.father,
    this.fOccupation,
    this.fEmail,
    this.fMobile,
    this.studentStatus,
    this.schooladmissionno,
    this.mobile,
    this.email,
  });

  String? studentId;
  String? admissionNo;
  String? academicYear;
  String? name;
  String? dataClass;
  String? division;
  DateTime? dob;
  String? gender;
  String? religionId;
  String? imageUrl;
  String? address;
  String? pincode;
  String? state;
  String? country;
  String? phone;
  String? pschool;
  String? grade;
  String? mother;
  String? mEmail;
  String? mMobile;
  String? mOccupation;
  String? guardian;
  String? gMobile;
  String? gEmail;
  String? gEducation;
  String? gOccupation;
  String? gRelation;
  String? father;
  String? fOccupation;
  String? fEmail;
  String? fMobile;
  int? studentStatus;
  String? schooladmissionno;
  String? mobile;
  String? email;

  factory StudentDetailModel.fromJson(Map<String, dynamic> json) => StudentDetailModel(
    studentId: json["student_id"],
    admissionNo: json["admission_no"],
    academicYear: json["academic_year"],
    name: json["name"],
    dataClass: json["class"],
    division: json["division"],
    dob: DateTime.parse(json["dob"]),
    gender: json["gender"],
    religionId: json["religion_id"],
    imageUrl: json["image_url"],
    address: json["address"],
    pincode: json["pincode"],
    state: json["state"],
    country: json["country"],
    phone: json["phone"],
    pschool: json["pschool"],
    grade: json["grade"],
    mother: json["mother"],
    mEmail: json["m_email"],
    mMobile: json["m_mobile"],
    mOccupation: json["m_occupation"],
    guardian: json["guardian"],
    gMobile: json["g_mobile"],
    gEmail: json["g_email"],
    gEducation: json["g_education"],
    gOccupation: json["g_occupation"],
    gRelation: json["g_relation"],
    father: json["father"],
    fOccupation: json["f_occupation"],
    fEmail: json["f_email"],
    fMobile: json["f_mobile"],
    studentStatus: json["student_status"],
    schooladmissionno: json["schooladmissionno"],
    mobile: json["mobile"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "student_id": studentId,
    "admission_no": admissionNo,
    "academic_year": academicYear,
    "name": name,
    "class": dataClass,
    "division": division,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "religion_id": religionId,
    "image_url": imageUrl,
    "address": address,
    "pincode": pincode,
    "state": state,
    "country": country,
    "phone": phone,
    "pschool": pschool,
    "grade": grade,
    "mother": mother,
    "m_email": mEmail,
    "m_mobile": mMobile,
    "m_occupation": mOccupation,
    "guardian": guardian,
    "g_mobile": gMobile,
    "g_email": gEmail,
    "g_education": gEducation,
    "g_occupation": gOccupation,
    "g_relation": gRelation,
    "father": father,
    "f_occupation": fOccupation,
    "f_email": fEmail,
    "f_mobile": fMobile,
    "student_status": studentStatus,
    "schooladmissionno": schooladmissionno,
    "mobile": mobile,
    "email": email,
  };
}
