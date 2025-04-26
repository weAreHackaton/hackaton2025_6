import 'package:flutter/material.dart';
import 'package:hackaton2025_6/ophalingen/models/ophaling.dart';

class FoodTypeChip extends StatelessWidget {
  final FoodType foodType;

  const FoodTypeChip({
    super.key,
    required this.foodType,
  });

  String _getEmojiForFoodType(FoodType type) {
    switch (type) {
      case FoodType.vegetables:
        return '🥬';
      case FoodType.fruits:
        return '🍎';
      case FoodType.meat:
        return '🥩';
      case FoodType.fish:
        return '🐟';
      case FoodType.bread:
        return '🥖';
      case FoodType.pastries:
        return '🥐';
      case FoodType.dairy:
        return '🥛';
      case FoodType.preparedFood:
        return '🍱';
      case FoodType.other:
        return '🍽️';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Text(_getEmojiForFoodType(foodType)),
      label: Text(
        foodType.name[0].toUpperCase() + foodType.name.substring(1),
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
} 