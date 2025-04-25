import 'package:flutter/material.dart';
import 'package:hackaton2025_6/package.dart';
import 'package:latlong2/latlong.dart';

import 'detail_page.dart';

class OphalingenPage extends StatelessWidget {
  const OphalingenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the list
    final List<Ophaling> items = List.generate(20,
      (index) => Ophaling(
        user: User(
          name: "user-$index",
          email: "example@example.com",

          phoneNumber: "+32 123 45 67 89"

          location: LatLng(51.0543, 3.7174), // ghent

        ),
        foodtypes: [FoodType.vegetables, FoodType.fruits],
        start: DateTime.now().add(Duration(hours: index)),
        end: DateTime.now().add(Duration(hours: index + 2)),
        description: "Sample collection $index",

        transportType: TransportType.values[index % TransportType.values.length],
        needsRefrigeration: index % 3 == 0, // Every third item needs refrigeration

        location: LatLng(51.0543, 3.7174),
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
                  MaterialPageRoute(builder: (context) => DetailPage(
                    ophaling: item,
                  )),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
