import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
    final String address;
    final String description;
    final List<String> tags;

    const InfoCard({
        Key? key,
        required this.address,
        required this.description,
        this.tags = const [],
    }) : super(key: key);

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
            Text('Adres: $address', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('Beschrijving: $description'),
            const SizedBox(height: 8),
            if (tags.isNotEmpty)
              Wrap(
                spacing: 8,
                runSpacing: -8,
                children: tags.map((tag) => Chip(label: Text(tag))).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
