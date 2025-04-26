import 'package:day_picker/model/day_in_week.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hackaton2025_6/profiel/models/availability_dates.dart';
import 'package:latlong2/latlong.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final LatLng location;
  List<DayTime>? workingTimes; // Make workingTimes nullable

  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.location,
    this.workingTimes, // Change to optional with 'this.workingTimes'
  });

  @override
  List<Object?> get props => [name, email, phoneNumber, location, workingTimes];
}




var tempUser = User(
  name: "Fhilip François",
  email: "hackaton@letssavefood.com",
  phoneNumber: "+32 123 45 67 89",
  location: const LatLng(51.0543, 3.7174),
  workingTimes: [
    DayTime(
      day: DayInWeek("Ma", dayKey: "monday"),
      startTime: const TimeOfDay(hour: 10, minute: 00),
      endTime: const TimeOfDay(hour: 12, minute: 00),
    ),
  ],
);
