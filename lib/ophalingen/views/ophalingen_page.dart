import 'package:flutter/material.dart';
import 'package:hackaton2025_6/ophalingen/data/sample_ophalingen.dart';
import 'package:hackaton2025_6/ophalingen/views/detail_page.dart';
import 'package:intl/intl.dart';

class OphalingenPage extends StatelessWidget {
  const OphalingenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ophalingen'),
      ),
      body: ListView.builder(
        itemCount: SampleOphalingen.ophalingen.length,
        itemBuilder: (context, index) {
          final ophaling = SampleOphalingen.ophalingen[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(ophaling.user.name),
              subtitle: Text(
                '${DateFormat('HH:mm').format(ophaling.start)} - ${DateFormat('HH:mm').format(ophaling.end)}',
              ),
              trailing: Text('${ophaling.currentVolunteers}/${ophaling.maxVolunteers}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(ophaling: ophaling),
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
