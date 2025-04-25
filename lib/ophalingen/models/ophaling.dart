import 'package:equatable/equatable.dart';
import 'package:hackaton2025_6/package.dart';

class Ophaling extends Equatable {
  final User user;

  const Ophaling({required this.user});

  @override
  List<Object?> get props => [user];
}
