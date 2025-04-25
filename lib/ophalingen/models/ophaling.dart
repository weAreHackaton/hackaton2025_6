import 'package:equatable/equatable.dart';
import 'package:hackaton2025_6/package.dart';

import 'package:hackaton2025_6/profiel/models/user.dart';

import 'package:latlong2/latlong.dart';


enum FoodType {
  vegetables,
  fruits,
  meat,
  fish,
  dairy,
  bread,
  pastries,
  preparedFood,
  other,
}

enum TransportType {
  cargoBike,
  minivan,
  truck,
  other,
}

class Ophaling extends Equatable {
  final User user;
  final List<FoodType> foodtypes;

  final DateTime start;
  final DateTime end;
  final String description;

  final TransportType transportType;
  final bool needsRefrigeration;

  final LatLng location;


  const Ophaling({
    required this.user,
    required this.foodtypes,
    required this.start,
    required this.end,
    required this.description,

    required this.transportType,
    required this.needsRefrigeration,

    required this.location

  });

  @override
  List<Object?> get props => [user, foodtypes, start, end, description, transportType, needsRefrigeration];
}
