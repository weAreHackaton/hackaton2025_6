import 'package:hackaton2025_6/package.dart';
import 'package:latlong2/latlong.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';

class UserRepository {
  late User tempUser;

  UserRepository() {
    tempUser = User(
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
  }

  void updateTempUser(User newUser) {
    tempUser = newUser;
  }

  User getTempUser() {
    return tempUser;
  }
}