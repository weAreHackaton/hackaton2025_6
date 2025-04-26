import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hackaton2025_6/package.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  String? _openMarkerId;

  @override
  Widget build(BuildContext context) {
    final ophalingen = context.read<OphalingRepository>().getTempOphalingen(); // Cache the list

    final points = ophalingen.map((o) => o.location).toList();
    final bounds = LatLngBounds.fromPoints(points);

    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCameraFit: CameraFit.bounds(
            bounds: bounds,
            padding: const EdgeInsets.all(75),
          ),
          onTap: (_, __) => setState(() => _openMarkerId = null),
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
            markers: ophalingen.map((ophaling) {
              final isOpen = _openMarkerId == ophaling.id;
              return Marker(
                point: ophaling.location,
                width: 160,
                height: 100,
                child: MyMarker(
                  key: ValueKey(ophaling.id), // Add key for better widget reuse
                  ophaling: ophaling,
                  isOpen: isOpen,
                  onTap: () => _handleMarkerTap(context, ophaling),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void _handleMarkerTap(BuildContext context, Ophaling ophaling) {
    setState(() {
      if (_openMarkerId == ophaling.id) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(ophaling: ophaling),
          ),
        );
      } else {
        _openMarkerId = ophaling.id;
      }
    });
  }
}