import 'package:flutter/material.dart';
import 'package:hackaton2025_6/package.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class info_card extends StatelessWidget {
    final Ophaling ophaling;

    const info_card({
        super.key,
        required this.ophaling,
    });

    String getDistanceFormatted(LatLng location1, LatLng location2) {
        final Distance distance = Distance();
        final double distanceInMeters = distance.as(LengthUnit.Meter, location1, location2);
        if (distanceInMeters < 1000) {
            return '${distanceInMeters.toStringAsFixed(0)} m';
        } else {
            final double distanceInKm = distanceInMeters / 1000;
            return '${distanceInKm.toStringAsFixed(1)} km';
        }
    }

    @override
    Widget build(BuildContext context) {
        User tempUser = context.read<UserRepository>().getTempUser();

        return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Expanded(
                                    child: Text(
                                        ophaling.user.name,
                                        style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                ),
                                Text(
                                    getDistanceFormatted(tempUser.location, ophaling.location),
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Colors.grey[600],
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 8),
                        Text('${ophaling.description}'),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${DateFormat('HH:mm').format(ophaling.start)} - ${DateFormat('HH:mm').format(ophaling.end)}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${ophaling.currentVolunteers}/${ophaling.maxVolunteers}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        if (ophaling.foodtypes.isNotEmpty)
                            Wrap(
                                spacing: 8,
                                runSpacing: -8,
                                children: ophaling.foodtypes.map((foodType) => FoodTypeChip(foodType: foodType)).toList(),
                            ),
                    ],
                ),
            ),
        );
    }
}
