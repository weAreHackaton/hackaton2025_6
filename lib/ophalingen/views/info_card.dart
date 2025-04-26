import 'package:flutter/material.dart';
import 'package:hackaton2025_6/package.dart';
import 'package:latlong2/latlong.dart';

class info_card extends StatelessWidget {
    final String address;
    final String description;
    final List<FoodType> tags;
    final LatLng userLocation;

    const info_card({
        super.key,
        required this.address,
        required this.description,
        required this.userLocation,
        this.tags = const [],
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
                                        address,
                                        style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                ),
                                Text(
                                    getDistanceFormatted(tempUser.location, userLocation),
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Colors.grey[600],
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 8),
                        Text(description),
                        const SizedBox(height: 8),
                        if (tags.isNotEmpty)
                            Wrap(
                                spacing: 8,
                                runSpacing: -8,
                                children: tags.map((foodType) => FoodTypeChip(foodType: foodType)).toList(),
                            ),
                    ],
                ),
            ),
        );
    }
}
