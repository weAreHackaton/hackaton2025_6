import 'package:hackaton2025_6/ophalingen/models/ophaling.dart';
import 'package:hackaton2025_6/profiel/models/user.dart';
import 'package:latlong2/latlong.dart';

class SampleOphalingen {
  static final List<Ophaling> ophalingen = [
    Ophaling(
      user: User(
        name: 'Bakker X',
        email: 'contact@bakkerx.be',
        phoneNumber: '+32 123 45 67 89',
        location: LatLng(51.0543, 3.7174),
      ),
      foodtypes: [FoodType.bread, FoodType.pastries],
      start: DateTime.now().add(const Duration(hours: 2)),
      end: DateTime.now().add(const Duration(hours: 4)),
      transportType: TransportType.cargoBike,
      needsRefrigeration: false,
      description: 'Verse broodjes en koffiekoeken',
      location: LatLng(51.2194, 4.4025),
      maxVolunteers: 2,
      currentVolunteers: 1,
    ),
    Ophaling(
      user: User(
        name: 'Aldi',
        email: 'contact@aldi.be',
        phoneNumber: '+32 123 45 67 89',
        location: LatLng(51.0543, 3.7174),
      ),
      foodtypes: [FoodType.vegetables, FoodType.fruits],
      start: DateTime.now().add(const Duration(hours: 5)),
      end: DateTime.now().add(const Duration(hours: 7)),
      transportType: TransportType.minivan,
      needsRefrigeration: false,
      description: 'Verse groenten en fruit',
      location: LatLng(50.8503, 4.3517),
      maxVolunteers: 1,
      currentVolunteers: 0,
    ),
    Ophaling(
      user: User(
        name: 'Carrefour',
        email: 'contact@carrefour.be',
        phoneNumber: '+32 123 45 67 89',
        location: LatLng(51.0543, 3.7174),
      ),
      foodtypes: [FoodType.meat, FoodType.fish],
      start: DateTime.now().add(const Duration(hours: 8)),
      end: DateTime.now().add(const Duration(hours: 10)),
      transportType: TransportType.truck,
      needsRefrigeration: true,
      description: 'Vers vlees en vis',
      location: LatLng(51.0543, 3.7174),
      maxVolunteers: 3,
      currentVolunteers: 2,
    ),
  ];
} 