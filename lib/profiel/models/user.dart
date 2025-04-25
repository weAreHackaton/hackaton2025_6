import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;

  const User({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [name, email, phoneNumber];
}

const tempUser = User(
  name: "Fhilip François",
  email: "hackaton@letssavefood.com",
  phoneNumber: "+32 123 45 67 89"
);
