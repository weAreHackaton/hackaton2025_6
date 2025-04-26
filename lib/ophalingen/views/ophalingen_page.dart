import 'package:flutter/material.dart';
import 'package:hackaton2025_6/package.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';

import 'detail_page.dart';
import 'InfoCard.dart';

class OphalingenPage extends StatelessWidget {
  const OphalingenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of business/store names
    final List<String> businessNames = [
      'Bakker X',
      'Aldi',
      'Carrefour',
      'Lidl',
      'Delhaize',
      'Colruyt',
      'Jumbo',
      'Albert Heijn',
      'Spar',
      'Coop',
      'Bakkerij De Smet',
      'Slagerij Van Damme',
      'Viswinkel De Zee',
      'Groenteboer Van Dijk',
      'Koffiebar Java',
      'Restaurant De Keuken',
      'Cafetaria De Friet',
      'Patisserie Sweet',
      'Supermarkt Plus',
      'Marktkraam Groenten'
    ];

    // Generate sample data
    final List<Ophaling> ophalingen = List.generate(
      20,
      (index) => Ophaling(
         user: User(
          name: businessNames[index],
          email: 'contact@${businessNames[index].toLowerCase().replaceAll(' ', '')}.be',
          phoneNumber: '+32 123 45 67 89',
          location: LatLng(51.0543, 3.7174),
        ),
        foodtypes: [
          FoodType.values[index % FoodType.values.length],
          FoodType.values[(index + 1) % FoodType.values.length],
        ],
        start: DateTime.now().add(Duration(hours: index)),
        end: DateTime.now().add(Duration(hours: index + 2)),
        description: 'Food collection from ${businessNames[index]}',
        location: LatLng(51.0543 + (index * 0.01), 3.7174 + (index * 0.01)),
        transportType: TransportType.values[index % TransportType.values.length],
        needsRefrigeration: index % 3 == 0,
        maxVolunteers: (index % 3) + 1,
        currentVolunteers: index % 2,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ophalingen'),
      ),
      body: ListView.builder(
        itemCount: ophalingen.length,
        itemBuilder: (context, index) {
          final ophaling = ophalingen[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(ophaling: ophaling),
                ),
              );
            },
            child: InfoCard(
              address: ophaling.user.name,
              description: '${ophaling.description}\nVrijwilligers: ${ophaling.currentVolunteers}/${ophaling.maxVolunteers}',
              tags: ophaling.foodtypes,
            ),
          );
        },
      ),
    );
  }
}
