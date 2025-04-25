import 'package:flutter/material.dart';
import 'package:hackaton2025_6/ophalingen/models/ophaling.dart';

import 'detail_page.dart';

class OphalingenPage extends StatelessWidget {
  const OphalingenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the list
    final List<Ophaling> items = List.generate(
      20,
      (index) => Ophaling(
        user: User(name: "user-$index"),
        foodtypes: [FoodType.vegetables, FoodType.fruits],
        start: DateTime.now().add(Duration(hours: index)),
        end: DateTime.now().add(Duration(hours: index + 2)),
        description: "Sample collection $index",
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Ophalingen')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          Ophaling item = items[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: ListTile(
              title: Text(item.user.name),
              subtitle: Text('Details for $item'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(ophaling: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
