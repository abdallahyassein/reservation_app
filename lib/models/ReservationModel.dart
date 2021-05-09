import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationModel {
  final String userId;
  final String details;
  final String userPicUrl;
  final Timestamp creationDate;
  final Timestamp appointmentDate;

  ReservationModel(this.userId, this.details, this.userPicUrl,
      this.creationDate, this.appointmentDate);

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'details': details,
      'userPicUrl': userPicUrl,
      'creationDate': creationDate,
      'appointmentDate': appointmentDate,
    };
  }

  factory ReservationModel.fromMap(map) {
    return ReservationModel(
      map['userId'],
      map['details'],
      map['userPicUrl'],
      map['creationDate'],
      map['appointmentDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationModel.fromJson(String source) =>
      ReservationModel.fromMap(json.decode(source));
}
