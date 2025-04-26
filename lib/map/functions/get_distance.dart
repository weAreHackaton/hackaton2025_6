import "package:latlong2/latlong.dart";
import 'dart:math';

// returns distance in m
double getDistance(LatLng point1, LatLng point2) {
  // const R = 6371e3; // metres
  // const φ1 = lat1 * Math.PI/180; // φ, λ in radians
  // const φ2 = lat2 * Math.PI/180;
  // const Δφ = (lat2-lat1) * Math.PI/180;
  // const Δλ = (lon2-lon1) * Math.PI/180;
  //
  // const a = Math.sin(Δφ/2) * Math.sin(Δφ/2) +
  //           Math.cos(φ1) * Math.cos(φ2) *
  //           Math.sin(Δλ/2) * Math.sin(Δλ/2);
  // const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  //
  // const d = R * c; // in metres

  final double R = 6378137.0; // earth's equatorial radius in metres
  final double phi1 = point1.latitudeInRad;
  final double phi2 = point2.latitudeInRad;
  final double deltaPhi = (point2.latitudeInRad - point1.latitudeInRad);
  final double deltaLambda = (point2.longitudeInRad - point1.longitudeInRad);

  final double a =
      sin(deltaPhi / 2) * sin(deltaPhi / 2)
      + cos(phi1) * cos(phi2)
      + sin(deltaLambda / 2) * sin(deltaLambda / 2);

  final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return R * c;
}