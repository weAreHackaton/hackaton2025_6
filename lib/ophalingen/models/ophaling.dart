import 'package:equatable/equatable.dart';

class Ophaling extends Equatable {
  final User user;

  const Ophaling({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}

class User extends Equatable {
  final String name;

  const User({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}