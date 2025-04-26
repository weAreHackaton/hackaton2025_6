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
  final List<DayTime>? workingTimes; // Made final but kept nullable

  const User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.location,
    this.workingTimes,
  });

  User copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    LatLng? location,
    List<DayTime>? workingTimes,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
      workingTimes: workingTimes ?? this.workingTimes,
    );
  }

  @override
  List<Object?> get props => [name, email, phoneNumber, location, workingTimes];
}
