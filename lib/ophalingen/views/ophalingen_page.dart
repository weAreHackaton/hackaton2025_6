import 'package:flutter/material.dart';
import 'package:hackaton2025_6/package.dart';

import 'detail_page.dart';
import 'InfoCard.dart';

class OphalingenPage extends StatelessWidget {
  const OphalingenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the list
    final List<InfoCard> ophalingen = [
     const InfoCard(
        address: 'Albert Heijn Overpoot',
        description: 'Donkere grijze bakken',
        tags: ['meat', 'vegetables', 'freezer'],
      ),
      const InfoCard(
        address: 'Bakker Klaas Wintercircus',
        description: 'Brood',
        tags: ['bread', 'pastries'],
      ),
      const InfoCard(
        address: 'Bioplanet Destelbergen',
        description: 'Groene plooibakken',
        tags: ['fruit', 'dairy'],
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Ophalingen')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: ophalingen,
      ),
    );
  }
}
