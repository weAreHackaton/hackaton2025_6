import 'package:flutter/material.dart';
import 'package:hackaton2025_6/ophalingen/models/ophaling.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final Ophaling ophaling;

  const DetailPage({super.key, required this.ophaling});

  String _getEmojiForFoodType(FoodType type) {
    switch (type) {
      case FoodType.vegetables:
        return '🥬';
      case FoodType.fruits:
        return '🍎';
      case FoodType.meat:
        return '🥩';
      case FoodType.fish:
        return '🐟';
      case FoodType.dairy:
        return '🥛';
      case FoodType.bread:
        return '🍞';
      case FoodType.pastries:
        return '🥐';
      case FoodType.preparedFood:
        return '🍱';
      case FoodType.other:
        return '📦';
    }
  }

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
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text('Collection Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Description and User Info Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      ophaling.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Divider(height: 32),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                          child: Text(
                            ophaling.user.name[0].toUpperCase(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ophaling.user.name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                ophaling.user.email,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // TODO: Implement email
                              },
                              icon: const Icon(Icons.email),
                              tooltip: 'Send Email',
                            ),
                            IconButton(
                              onPressed: () {
                                // TODO: Implement call
                              },
                              icon: const Icon(Icons.phone),
                              tooltip: 'Call',
                            ),
                          ],
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
                    Row(
                      children: [
                        const Icon(Icons.access_time),
                        const SizedBox(width: 8),
                        Text(
                          '${DateFormat('HH:mm').format(ophaling.start)} - ${DateFormat('HH:mm').format(ophaling.end)}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Transport Section
            Card(
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
                          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        if (ophaling.needsRefrigeration) ...[
                          const SizedBox(width: 8),
                          Chip(
                            avatar: const Text('❄️'),
                            label: const Text(
                              'Refrigerated',
                              style: TextStyle(fontSize: 14),
                            ),
                            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
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
                      children: ophaling.foodtypes.map((type) {
                        return Chip(
                          avatar: Text(_getEmojiForFoodType(type)),
                          label: Text(
                            type.name[0].toUpperCase() + type.name.substring(1),
                            style: const TextStyle(fontSize: 14),
                          ),
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
