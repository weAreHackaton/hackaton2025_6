import 'package:flutter/material.dart';
import 'package:hackaton2025_6/package.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final Ophaling ophaling;

  const DetailPage({
    super.key,
    required this.ophaling,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Ophaling _ophaling;

  @override
  void initState() {
    super.initState();
    _ophaling = widget.ophaling;
  }

  String _getEmojiForTransportType(TransportType type) {
    switch (type) {
      case TransportType.fiets:
        return '🚲';
      case TransportType.minibus:
        return '🚐';
      case TransportType.vrachtwagen:
        return '🚚';
      case TransportType.overig:
        return '🚗';
    }
  }

  void _registerAsVolunteer() {
    if (_ophaling.currentVolunteers >= _ophaling.maxVolunteers) return;

    setState(() {
      _ophaling = _ophaling.copyWith(
        currentVolunteers: _ophaling.currentVolunteers + 1,
      );
    });

    context.read<OphalingRepository>().updateTempOphaling(_ophaling.id, _ophaling);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Geregistreerd!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tempUser = context.read<UserRepository>().getTempUser();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ophaling details'),
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
                      _ophaling.description,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        CircleAvatar(
                          child: Text(_ophaling.user.name[0]),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _ophaling.user.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                _ophaling.isRegular
                                    ? 'Regelmatig ophaaladres'
                                    : 'Ophaling op afroep',
                              ),
                              Text(
                                _ophaling.user.email,
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
                      'Tijdstip',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${DateFormat('HH:mm').format(_ophaling.start)} - '
                          '${DateFormat('HH:mm').format(_ophaling.end)}',
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
                      'Transport (${getDistanceFormatted(_ophaling.location, tempUser.location)})',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Chip(
                          avatar: Text(_getEmojiForTransportType(_ophaling.transportType)),
                          label: Text(
                            _ophaling.transportType.name[0].toUpperCase() +
                                _ophaling.transportType.name.substring(1),
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        if (_ophaling.needsRefrigeration) ...[
                          const SizedBox(width: 8),
                          Chip(
                            avatar: const Text('❄️'),
                            label: const Text(
                              'Koeling nodig',
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
                      'Type voedsel',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _ophaling.foodtypes
                          .map((type) => FoodTypeChip(foodType: type))
                          .toList(),
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
                      'Vrijwilligers',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${_ophaling.currentVolunteers}/${_ophaling.maxVolunteers}',
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
                    onPressed: _ophaling.currentVolunteers >= _ophaling.maxVolunteers
                        ? null
                        : _registerAsVolunteer,
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
                      _ophaling.currentVolunteers >= _ophaling.maxVolunteers
                          ? 'Alle plekken zijn bezet'
                          : 'Ophalen',
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