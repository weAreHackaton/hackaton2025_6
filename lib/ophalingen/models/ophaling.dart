import 'package:equatable/equatable.dart';
import 'package:hackaton2025_6/package.dart';

import 'package:hackaton2025_6/profiel/models/user.dart';

import 'package:latlong2/latlong.dart';


enum FoodType {
  groenten,
  fruit,
  vlees,
  vis,
  zuivel,
  brood,
  gebakjes,
  bereid,
  overig,
}

enum TransportType {
  fiets,
  minibus,
  vrachtwagen,
  overig,
}

class Ophaling extends Equatable {
  final String id;

  final User user;
  final List<FoodType> foodtypes;

  final DateTime start;
  final DateTime end;
  final String description;

  final TransportType transportType;
  final bool needsRefrigeration;
  final bool isRegular;

  final LatLng location;

  final int maxVolunteers;
  final int currentVolunteers;

  const Ophaling({
    required this.id,

    required this.user,
    required this.foodtypes,
    required this.start,
    required this.end,
    required this.description,

    required this.transportType,
    required this.needsRefrigeration,
    required this.isRegular,

    required this.location,

    required this.maxVolunteers,
    required this.currentVolunteers,
  });

  Ophaling copyWith({
    String? id,
    User? user,
    List<FoodType>? foodtypes,
    DateTime? start,
    DateTime? end,
    String? description,
    TransportType? transportType,
    bool? needsRefrigeration,
    bool? isRegular,
    LatLng? location,
    int? maxVolunteers,
    int? currentVolunteers,
  }) {
    return Ophaling(
      id: id ?? this.id,
      user: user ?? this.user,
      foodtypes: foodtypes ?? this.foodtypes,
      start: start ?? this.start,
      end: end ?? this.end,
      description: description ?? this.description,
      transportType: transportType ?? this.transportType,
      needsRefrigeration: needsRefrigeration ?? this.needsRefrigeration,
      isRegular: isRegular ?? this.isRegular,
      location: location ?? this.location,
      maxVolunteers: maxVolunteers ?? this.maxVolunteers,
      currentVolunteers: currentVolunteers ?? this.currentVolunteers,
    );
  }

  @override
  List<Object?> get props => [
    id,
    user,
    foodtypes,
    start,
    end,
    description,
    transportType,
    needsRefrigeration,
    location,
    maxVolunteers,
    currentVolunteers,
  ];
}
