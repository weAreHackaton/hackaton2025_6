import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hackaton2025_6/package.dart';

class MyMarker extends StatelessWidget {
  final Ophaling ophaling;
  final bool isOpen;
  final VoidCallback onTap;

  const MyMarker({
    super.key,
    required this.ophaling,
    required this.isOpen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isOpen ? _OpenedMarkerContent(ophaling: ophaling) : _ClosedMarker(),
    );
  }
}

class _OpenedMarkerContent extends StatelessWidget {
  final Ophaling ophaling;

  const _OpenedMarkerContent({required this.ophaling});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(51),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ophaling.user.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.grey,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '${DateFormat('HH:mm').format(ophaling.start)} - ${DateFormat('HH:mm').format(ophaling.end)}',
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              ophaling.description,
              style: const TextStyle(fontSize: 10),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${ophaling.currentVolunteers}/${ophaling.maxVolunteers}',
             style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class _ClosedMarker extends StatelessWidget {
  const _ClosedMarker();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.location_pin,
      color: Colors.red,
      size: 40,
    );
  }
}