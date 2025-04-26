import 'package:flutter/material.dart';
import 'package:hackaton2025_6/ophalingen/data/sample_ophalingen.dart';
import 'package:hackaton2025_6/ophalingen/views/detail_page.dart';
import 'package:intl/intl.dart';
import 'info_card.dart';

class OphalingenPage extends StatelessWidget {
  const OphalingenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beschikbare ophalingen'),
      ),
      body: ListView.builder(
        itemCount: SampleOphalingen.ophalingen.length,
        itemBuilder: (context, index) {
          final ophaling = SampleOphalingen.ophalingen[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(ophaling: ophaling),
                ),
              );
            },
            child: info_card(
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
