import 'package:flutter/material.dart';
import 'package:hackaton2025_6/package.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'info_card.dart';

class OphalingenPage extends StatelessWidget {
  const OphalingenPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Ophaling> ophalingen = context.read<OphalingRepository>().getTempOphalingen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beschikbare ophalingen'),
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
            child: info_card(
              ophaling: ophaling,
            ),
          );
        },
      ),
    );
  }
}
