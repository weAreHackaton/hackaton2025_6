import 'package:equatable/equatable.dart';

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

class Ophaling extends Equatable {
  final User user;
  final List<FoodType> foodtypes;
  final DateTime start;
  final DateTime end;
  final String description;

  const Ophaling({
    required this.user,
    required this.foodtypes,
    required this.start,
    required this.end,
    required this.description,
  });

  @override
  List<Object?> get props => [user, foodtypes, start, end, description];
}

class User extends Equatable {
  final String name;

  const User({required this.name});

  @override
  List<Object?> get props => [name];
}

const tempUSer = User(name: "hi");
