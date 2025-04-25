import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position? currentPosition;
  final MapController _mapController = MapController();
  final List<Marker> _markers = [];

  // Hardcoded locations with descriptions
  final List<Map<String, dynamic>> _locations = [
    {
      'position': const LatLng(51.2194, 4.4025),
      'title': 'Antwerp',
      'description': 'Major port city with historic architecture',
    },
    {
      'position': const LatLng(50.8503, 4.3517),
      'title': 'Brussels',
      'description': 'Capital of Belgium and EU',
    },
    {
      'position': const LatLng(51.0543, 3.7174),
      'title': 'Ghent',
      'description': 'Medieval city with canals',
    },
    {
      'position': const LatLng(50.8798, 4.7005),
      'title': 'Leuven',
      'description': 'University city with historic center',
    },
    {
      'position': const LatLng(51.2089, 3.2242),
      'title': 'Bruges',
      'description': 'Venice of the North',
    },
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
    for (int i = 0; i < _locations.length; i++) {
      final location = _locations[i];
      _markers.add(
        Marker(
          point: location['position'] as LatLng,
          width: 80,
          height: 80,
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(location['title'] as String),
                  content: Text(location['description'] as String),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
            child: const Icon(
              Icons.location_on,
              color: Colors.red,
              size: 40,
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
        title: const Text('Belgium Cities'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _locations[0]['position'] as LatLng,
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