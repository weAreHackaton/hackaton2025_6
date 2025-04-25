import 'package:equatable/equatable.dart';
import 'package:hackaton2025_6/package.dart';

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

  const Ophaling({required this.user, required this.foodtypes});

  @override
  List<Object?> get props => [user, foodtypes];
}
