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
      case FoodType.groenten:
        return '🥬';
      case FoodType.fruit:
        return '🍎';
      case FoodType.vlees:
        return '🥩';
      case FoodType.vis:
        return '🐟';
      case FoodType.brood:
        return '🥖';
      case FoodType.gebakjes:
        return '🥐';
      case FoodType.zuivel:
        return '🥛';
      case FoodType.bereid:
        return '🍱';
      case FoodType.overig:
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