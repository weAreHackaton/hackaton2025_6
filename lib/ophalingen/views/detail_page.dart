import 'package:flutter/material.dart';
import 'package:hackaton2025_6/ophalingen/models/ophaling.dart';
import 'package:hackaton2025_6/ophalingen/widgets/food_type_chip.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final Ophaling ophaling;

  const DetailPage({super.key, required this.ophaling});

  String _getEmojiForTransportType(TransportType type) {
    switch (type) {
      case TransportType.cargoBike:
        return '🚲';
      case TransportType.minivan:
        return '🚐';
      case TransportType.truck:
        return '🚚';
      case TransportType.other:
        return '🚗';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ophaling Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Description and User Info Section
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ophaling.description,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        CircleAvatar(
                          child: Text(ophaling.user.name[0]),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ophaling.user.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ophaling.user.email,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.email),
                          onPressed: () {
                            // TODO: Implement email functionality
                          },
                          tooltip: 'Send Email',
                        ),
                        IconButton(
                          icon: const Icon(Icons.phone),
                          onPressed: () {
                            // TODO: Implement call functionality
                          },
                          tooltip: 'Call',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Time Section
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Collection Time',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${DateFormat('HH:mm').format(ophaling.start)} - ${DateFormat('HH:mm').format(ophaling.end)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Transport Section
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transport',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Chip(
                          avatar: Text(_getEmojiForTransportType(ophaling.transportType)),
                          label: Text(
                            ophaling.transportType.name[0].toUpperCase() + 
                            ophaling.transportType.name.substring(1),
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        if (ophaling.needsRefrigeration) ...[
                          const SizedBox(width: 8),
                          Chip(
                            avatar: const Text('❄️'),
                            label: const Text(
                              'Refrigerated',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Food Types Section
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Food Types',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: ophaling.foodtypes.map((type) => FoodTypeChip(foodType: type)).toList(),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
            // Volunteers Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Volunteers',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${ophaling.currentVolunteers}/${ophaling.maxVolunteers}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ophaling.currentVolunteers >= ophaling.maxVolunteers
                        ? null
                        : () {
                            // TODO: Implement volunteer registration
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Volunteer registration coming soon!'),
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      ophaling.currentVolunteers >= ophaling.maxVolunteers
                          ? 'All spots claimed'
                          : 'Claim this collection',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
