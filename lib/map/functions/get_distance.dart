import "package:latlong2/latlong.dart";
import 'dart:math';

// returns distance in m
double getDistance(LatLng point1, LatLng point2) {
  final double R = 6378137.0; // earth's equatorial radius in metres
  final double phi1 = point1.latitudeInRad;
  final double phi2 = point2.latitudeInRad;
  final double deltaPhi = (point2.latitudeInRad - point1.latitudeInRad);
  final double deltaLambda = (point2.longitudeInRad - point1.longitudeInRad);

  final double a =
      sin(deltaPhi / 2) * sin(deltaPhi / 2)
      + cos(phi1) * cos(phi2)
      * sin(deltaLambda / 2) * sin(deltaLambda / 2);

  final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return R * c;
}

String getDistanceFormatted(LatLng point1, LatLng point2) {
  final double d = getDistance(point1, point2);

  if (d >= 1000) {
    return '${(d / 1000).toStringAsFixed(1)} km';
  }
  return '${d.round()} m';
}