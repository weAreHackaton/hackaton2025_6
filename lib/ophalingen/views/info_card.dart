import 'package:flutter/material.dart';
import 'package:hackaton2025_6/ophalingen/ophalingen.dart';
import 'package:hackaton2025_6/ophalingen/widgets/food_type_chip.dart';

class InfoCard extends StatelessWidget {
    final String address;
    final String description;
    final List<FoodType> tags;

    const InfoCard({
        super.key,
        required this.address,
        required this.description,
        this.tags = const [],
    });

@override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$address', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('$description'),
            const SizedBox(height: 8),
            if (tags.isNotEmpty)
              Wrap(
                spacing: 8,
                runSpacing: -8,
                children: tags.map((foodType) => FoodTypeChip(foodType: foodType)).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
