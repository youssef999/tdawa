// To parse this JSON data, do
//
//     final appointment = appointmentFromJson(jsonString);

import 'dart:convert';

List<Appointment> appointmentFromJson(String str) => List<Appointment>.from(json.decode(str).map((x) => Appointment.fromJson(x)));

String appointmentToJson(List<Appointment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Appointment {
  Appointment({
    required this.id,
    required this.doctorName,
    required this.userName,
    required this.date,
    required this.time,
  });

  int id;
  String doctorName;
  String userName;
  DateTime date;
  String time;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
    id: int.parse(json["id"]),
    doctorName: json["doctor_name"],
    userName: json["user_name"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_name": doctorName,
    "user_name": userName,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time": time,
  };
}
