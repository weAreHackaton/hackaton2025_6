import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hackaton2025_6/ophalingen/models/ophaling.dart';
import 'package:hackaton2025_6/profiel/models/user.dart';
import 'package:intl/intl.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position? currentPosition;
  final MapController _mapController = MapController();
  final List<Marker> _markers = [];

  // Hardcoded Ophaling objects
  final List<Ophaling> _ophalingen = [
    Ophaling(
      user: User(
        name: 'John Doe',
        email: 'john@example.com',
        phoneNumber: '+32 123 45 67 89',
      ),
      foodtypes: [FoodType.vegetables, FoodType.fruits],
      start: DateTime.now().add(const Duration(hours: 2)),
      end: DateTime.now().add(const Duration(hours: 4)),
      description: 'Fresh vegetables and fruits from local market',
    ),
    Ophaling(
      user: User(
        name: 'Jane Smith',
        email: 'jane@example.com',
        phoneNumber: '+32 123 45 67 89',
      ),
      foodtypes: [FoodType.bread, FoodType.pastries],
      start: DateTime.now().add(const Duration(hours: 5)),
      end: DateTime.now().add(const Duration(hours: 7)),
      description: 'Bakery items from downtown bakery',
    ),
    Ophaling(
      user: User(
        name: 'Mike Johnson',
        email: 'mike@example.com',
        phoneNumber: '+32 123 45 67 89',
      ),
      foodtypes: [FoodType.meat, FoodType.fish],
      start: DateTime.now().add(const Duration(hours: 8)),
      end: DateTime.now().add(const Duration(hours: 10)),
      description: 'Fresh meat and fish from seafood market',
    ),
  ];

  // Hardcoded locations for the Ophalingen
  final List<LatLng> _locations = [
    const LatLng(51.2194, 4.4025), // Antwerp
    const LatLng(50.8503, 4.3517), // Brussels
    const LatLng(51.0543, 3.7174), // Ghent
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _addMarkers();
  }

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      currentPosition = position;
      _mapController.move(
        LatLng(position.latitude, position.longitude),
        13.0,
      );
    });
  }

  void _addMarkers() {
    for (int i = 0; i < _ophalingen.length; i++) {
      final ophaling = _ophalingen[i];
      final location = _locations[i];
      
      _markers.add(
        Marker(
          point: location,
          width: 120,
          height: 80,
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(ophaling.user.name),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description: ${ophaling.description}'),
                      const SizedBox(height: 8),
                      Text('Food Types: ${ophaling.foodtypes.map((e) => e.name).join(', ')}'),
                      const SizedBox(height: 8),
                      Text('Start: ${DateFormat('HH:mm').format(ophaling.start)}'),
                      Text('End: ${DateFormat('HH:mm').format(ophaling.end)}'),
                      const SizedBox(height: 8),
                      Text('Phone: ${ophaling.user.phoneNumber}'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
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
        title: const Text('Food Collections'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _locations[0],
          initialZoom: 8.0,
          onTap: (_, __) {},
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
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        child: const Icon(Icons.my_location),
      ),
    );
  }
} 