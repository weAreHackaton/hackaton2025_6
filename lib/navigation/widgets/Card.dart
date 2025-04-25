import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
    final String address;
    final String description;
    final String vervoer;
    final List<String> chips;

    const InfoCard({
        Key? key,
        required this.address,
        required this.description,
        required this.vervoer,
        this.chips = const [],
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text("$address", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("$description"),
                const SizedBox(height: 8),
                Text("$vervoer"),
                const SizedBox(height: 12),
                if (chips.isNotEmpty) Wrap(
                spacing: 8,
                runSpacing: -8,
                children: chips.map((chipText) => Chip(label: Text(chipText))).toList(),
                ),
            ],
            ),
        ),
        );
    }
}
