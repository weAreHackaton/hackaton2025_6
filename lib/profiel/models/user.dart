import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final LatLng location;

  const User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.location,
  });

  @override
  List<Object?> get props => [name, email, phoneNumber, location];
}

const tempUser = User(
  name: "Fhilip François",
  email: "hackaton@letssavefood.com",
  phoneNumber: "+32 123 45 67 89",
  location: LatLng(51.0543, 3.7174), // ghent
);
