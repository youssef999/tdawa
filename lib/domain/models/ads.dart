// To parse this JSON data, do
//
//     final appointment = appointmentFromJson(jsonString);

import 'dart:convert';

List<Ads> appointmentFromJson(String str) => List<Ads>.from(json.decode(str).map((x) => Ads.fromJson(x)));

//String AdsToJson(List<Ads> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ads {
  Ads({
    required this.id,
    required this.name,
    required this.details,
    required this.image,
    required this.doctor_name,
    required this.doctor_email,
  });

  int id;
  String name;
  String details;
  String image;
  String doctor_name;
  String doctor_email;

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
    id: int.parse(json["id"]),
    name: json["name"]??"",
    details: json["details"]??"",
    image: json["image"]??"",
    doctor_name: json["doctor_name"]??"",
    doctor_email: (json["doctor-email"]??""),
  );

// Map<String, dynamic> toJson() => {
//   "id": id,
//   "doctor_name": doctorName,
//   "user_name": userName,
//   "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
//   "time": time,
// };
}
