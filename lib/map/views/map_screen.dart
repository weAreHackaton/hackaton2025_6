import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:hackaton2025_6/ophalingen/models/ophaling.dart';
import 'package:hackaton2025_6/ophalingen/views/detail_page.dart';
import 'package:hackaton2025_6/profiel/models/user.dart';
import 'package:intl/intl.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final List<Marker> _markers = [];

  // Hardcoded Ophaling objects
  final List<Ophaling> _ophalingen = [
    Ophaling(
      user: User(
        name: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '+32 123 45 67 89',
        location: LatLng(51.0543, 3.7174),
      ),
      foodtypes: [FoodType.vegetables, FoodType.fruits],
      start: DateTime.now().add(const Duration(hours: 2)),
      end: DateTime.now().add(const Duration(hours: 4)),
      transportType: TransportType.cargoBike,
      needsRefrigeration: false,
      description: 'Verse groenten en fruit van de lokale markt',
      location: LatLng(51.2194, 4.4025),
      maxVolunteers: 2,
      currentVolunteers: 1,
    ),
    Ophaling(
      user: User(
        name: 'Jane Smith',
        email: 'jane@example.com',
        phoneNumber: '+32 123 45 67 89',
        location: LatLng(51.0543, 3.7174),
      ),
      foodtypes: [FoodType.bread, FoodType.pastries],
      start: DateTime.now().add(const Duration(hours: 5)),
      end: DateTime.now().add(const Duration(hours: 7)),
      transportType: TransportType.minivan,
      needsRefrigeration: false,
      description: 'Koffiekoeken van de bakker om de hoek',
      location: LatLng(50.8503, 4.3517),
      maxVolunteers: 1,
      currentVolunteers: 0,
    ),
    Ophaling(
      user: User(
        name: 'Mike Johnson',
        email: 'mike@example.com',
        phoneNumber: '+32 123 45 67 89',
        location: LatLng(51.0543, 3.7174),
      ),
      foodtypes: [FoodType.meat, FoodType.fish],
      start: DateTime.now().add(const Duration(hours: 8)),
      end: DateTime.now().add(const Duration(hours: 10)),
      transportType: TransportType.truck,
      needsRefrigeration: true,
      description: 'Vers vlees en vis uit de carrefour',
      location: LatLng(51.0543, 3.7174),
      maxVolunteers: 3,
      currentVolunteers: 2,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    for (int i = 0; i < _ophalingen.length; i++) {
      final ophaling = _ophalingen[i];
      
      _markers.add(
        Marker(
          point: ophaling.location,
          width: 120,
          height: 80,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(ophaling: ophaling),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.pallet,
                    color: Colors.amber,
                    size: 30,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${DateFormat('HH:mm').format(ophaling.start)} - ${DateFormat('HH:mm').format(ophaling.end)}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _ophalingen[0].location,
          initialZoom: 8.0,
          onTap: (_, __) {},
          interactionOptions: const InteractionOptions(
            flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.hackaton2025_6',
          ),
          MarkerLayer(
            markers: _markers,
          ),
        ],
      ),
    );
  }
} 