import 'package:hackaton2025_6/ophalingen/models/ophaling.dart';
import 'package:hackaton2025_6/profiel/models/user.dart';
import 'package:latlong2/latlong.dart';

class SampleOphalingen {
  static final List<Ophaling> ophalingen = [
    Ophaling(
      user: User(
        name: 'Bakker Klaas',
        email: 'contact@bakkerklaas.be',
        phoneNumber: '+32 123 45 67 89',
        location: const LatLng(51.0543, 3.7174), // Gent Centrum
      ),
      foodtypes: [FoodType.brood, FoodType.gebakjes],
      start: DateTime.now().add(const Duration(hours: 2)),
      end: DateTime.now().add(const Duration(hours: 4)),
      transportType: TransportType.fiets,
      needsRefrigeration: false,
      description: 'Zak met pistolets en enkele broden',
      location: const LatLng(51.0543, 3.7174), // Gent Centrum
      maxVolunteers: 2,
      currentVolunteers: 1,
      isRegular: true,
    ),
    Ophaling(
      user: User(
        name: 'Debbie',
        email: 'debbie1934@hotmail.be',
        phoneNumber: '+32 103 49 37 19',
        location: const LatLng(51.0535, 3.7150),
      ),
      foodtypes: [FoodType.bereid],
      start: DateTime.now().add(const Duration(hours: 2)),
      end: DateTime.now().add(const Duration(hours: 4)),
      transportType: TransportType.fiets,
      needsRefrigeration: false,
      description: 'Pot soep',
      location: const LatLng(51.0535, 3.7150),
      maxVolunteers: 1,
      currentVolunteers: 0,
      isRegular: false,
    ),
        Ophaling(
      user: User(
        name: 'Buurtcentrum Gentbrugge',
        email: 'buurtcentrum@gentbrugge.be',
        phoneNumber: '+32 123 43 67 19',
        location: const LatLng(51.0490, 3.7120),
      ),
      foodtypes: [FoodType.bereid, FoodType.gebakjes],
      start: DateTime.now().add(const Duration(hours: 2)),
      end: DateTime.now().add(const Duration(hours: 4)),
      transportType: TransportType.fiets,
      needsRefrigeration: false,
      description: 'Maaltijden en gebak',
      location: const LatLng(51.0490, 3.7120),
      maxVolunteers: 2,
      currentVolunteers: 0,
      isRegular: false,
    ),
    Ophaling(
      user: User(
        name: 'Aldi',
        email: 'contact@aldi.be',
        phoneNumber: '+32 123 45 67 89',
        location: const LatLng(51.0432, 3.7101), // Gent Zuid
      ),
      foodtypes: [FoodType.groenten, FoodType.fruit],
      start: DateTime.now().add(const Duration(hours: 5)),
      end: DateTime.now().add(const Duration(hours: 7)),
      transportType: TransportType.minibus,
      needsRefrigeration: false,
      description: 'Verse groenten en fruit',
      location: const LatLng(51.0432, 3.7101), // Gent Zuid
      maxVolunteers: 1,
      currentVolunteers: 0,
      isRegular: true,
    ),
    Ophaling(
      user: User(
        name: 'Carrefour',
        email: 'contact@carrefour.be',
        phoneNumber: '+32 123 45 67 89',
        location: const LatLng(51.0621, 3.7278), // Gent Noord
      ),
      foodtypes: [FoodType.vlees, FoodType.vis],
      start: DateTime.now().add(const Duration(hours: 8)),
      end: DateTime.now().add(const Duration(hours: 10)),
      transportType: TransportType.vrachtwagen,
      needsRefrigeration: true,
      description: 'Vers vlees en vis',
      location: const LatLng(51.0621, 3.7278), // Gent Noord
      maxVolunteers: 3,
      currentVolunteers: 2,
      isRegular: true,
    ),
    Ophaling(
      user: User(
        name: 'Alfonsus',
        email: 'Alfonsuske@hotmail.be',
        phoneNumber: '+32 133 45 58 09',
        location: const LatLng(51.0435, 3.7278),
      ),
      foodtypes: [FoodType.groenten],
      start: DateTime.now().add(const Duration(hours: 2)),
      end: DateTime.now().add(const Duration(hours: 4)),
      transportType: TransportType.fiets,
      needsRefrigeration: false,
      description: 'verse groenten uit de tuin',
      location: const LatLng(51.0435, 3.7278),
      maxVolunteers: 1,
      currentVolunteers: 0,
      isRegular: false,
    ),
    Ophaling(
      user: User(
        name: 'Delhaize',
        email: 'info@delhaize.be',
        phoneNumber: '+32 234 56 78 90',
        location: const LatLng(51.0389, 3.7302), // Gent West
      ),
      foodtypes: [FoodType.zuivel, FoodType.groenten],
      start: DateTime.now().add(const Duration(hours: 3)),
      end: DateTime.now().add(const Duration(hours: 5)),
      transportType: TransportType.minibus,
      needsRefrigeration: true,
      description: 'Melkproducten en verse sla',
      location: const LatLng(51.0389, 3.7302), // Gent West
      maxVolunteers: 2,
      currentVolunteers: 1,
      isRegular: true,
    ),
    Ophaling(
      user: User(
        name: 'Lidl',
        email: 'support@lidl.be',
        phoneNumber: '+32 345 67 89 01',
        location: const LatLng(51.0486, 3.6978), // Gent Oost
      ),
      foodtypes: [FoodType.fruit, FoodType.brood],
      start: DateTime.now().add(const Duration(hours: 6)),
      end: DateTime.now().add(const Duration(hours: 8)),
      transportType: TransportType.fiets,
      needsRefrigeration: false,
      description: 'Brood en fruit overschotten',
      location: const LatLng(51.0486, 3.6978), // Gent Oost
      maxVolunteers: 1,
      currentVolunteers: 0,
      isRegular: true,
    ),
    Ophaling(
      user: User(
        name: 'De Sterre resto',
        email: 'resto_sterre@ugent.be',
        phoneNumber: '+32 987 65 43 21',
        location: const LatLng(51.0225, 3.7101), // Gent Zuid-Oost
      ),
      foodtypes: [FoodType.bereid, FoodType.groenten],
      start: DateTime.now().add(const Duration(hours: 10)),
      end: DateTime.now().add(const Duration(hours: 12)),
      transportType: TransportType.vrachtwagen,
      needsRefrigeration: false,
      description: 'Overschot van soep en rauwkost',
      location: const LatLng(51.0225, 3.7101), // Gent Zuid-Oost
      maxVolunteers: 3,
      currentVolunteers: 2,
      isRegular: true,
    ),
    Ophaling(
      user: User(
        name: 'Panos',
        email: 'support@panos.be',
        phoneNumber: '+32 937 658 42 11',
        location: const LatLng(51.0678, 3.7101), // Gent Noord-Oost
      ),
      foodtypes: [FoodType.gebakjes],
      start: DateTime.now().add(const Duration(hours: 10)),
      end: DateTime.now().add(const Duration(hours: 12)),
      transportType: TransportType.vrachtwagen,
      needsRefrigeration: false,
      description: 'Overschot gebakjes',
      location: const LatLng(51.0678, 3.7101), // Gent Noord-Oost
      maxVolunteers: 2,
      currentVolunteers: 0,
      isRegular: true,
    ),
    Ophaling(
      user: User(
        name: 'Marjan',
        email: 'Marjan@hotmail.be',
        phoneNumber: '+32 127 45 21 14',
        location: const LatLng(51.0600, 3.7040),
      ),
      foodtypes: [FoodType.gebakjes],
      start: DateTime.now().add(const Duration(hours: 2)),
      end: DateTime.now().add(const Duration(hours: 4)),
      transportType: TransportType.fiets,
      needsRefrigeration: false,
      description: 'Taart overschot van babyborrel',
      location: const LatLng(51.0600, 3.7040),
      maxVolunteers: 1,
      currentVolunteers: 0,
      isRegular: false,
    ),
    Ophaling(
      user: User(
        name: 'BioPlanet',
        email: 'contact@bioplanet.be',
        phoneNumber: '+32 123 44 55 66',
        location: const LatLng(51.0422, 3.7402), // Gent Zuid-West
      ),
      foodtypes: [FoodType.groenten, FoodType.fruit, FoodType.zuivel],
      start: DateTime.now().add(const Duration(hours: 7)),
      end: DateTime.now().add(const Duration(hours: 9)),
      transportType: TransportType.minibus,
      needsRefrigeration: true,
      description: 'Biologische producten',
      location: const LatLng(51.0422, 3.7402), // Gent Zuid-West
      maxVolunteers: 3,
      currentVolunteers: 1,
      isRegular: true,
    ),
    Ophaling(
      user: User(
        name: 'Colruyt',
        email: 'service@colruyt.be',
        phoneNumber: '+32 222 33 44 55',
        location: const LatLng(51.0578, 3.6978), // Gent Noord-Oost
      ),
      foodtypes: [FoodType.vlees, FoodType.vis],
      start: DateTime.now().add(const Duration(hours: 4)),
      end: DateTime.now().add(const Duration(hours: 6)),
      transportType: TransportType.vrachtwagen,
      needsRefrigeration: true,
      description: 'Vlees en vis voor koeling',
      location: const LatLng(51.0578, 3.6978), // Gent Noord-Oost
      maxVolunteers: 2,
      currentVolunteers: 1,
      isRegular: true,
    ),
    Ophaling(
      user: User(
        name: 'Spar',
        email: 'spar@spar.be',
        phoneNumber: '+32 321 54 76 98',
        location: const LatLng(51.0478, 3.7278), // Gent Centrum-Oost
      ),
      foodtypes: [FoodType.groenten, FoodType.brood],
      start: DateTime.now().add(const Duration(hours: 12)),
      end: DateTime.now().add(const Duration(hours: 14)),
      transportType: TransportType.fiets,
      needsRefrigeration: false,
      description: 'Vers brood en groenten',
      location: const LatLng(51.0478, 3.7278), // Gent Centrum-Oost
      maxVolunteers: 2,
      currentVolunteers: 1,
      isRegular: true,
    ),
    Ophaling(
      user: User(
        name: 'Bloch',
        email: 'contact@bloch.be',
        phoneNumber: '+32 183 22 47 09',
        location: const LatLng(51.0333, 3.7001), // Gent Zuid-Oost
      ),
      foodtypes: [FoodType.brood, FoodType.gebakjes],
      start: DateTime.now().add(const Duration(hours: 2)),
      end: DateTime.now().add(const Duration(hours: 4)),
      transportType: TransportType.fiets,
      needsRefrigeration: false,
      description: 'Meerdere broden en enkele gebakken',
      location: const LatLng(51.0333, 3.7001), // Gent Zuid-Oost
      maxVolunteers: 2,
      currentVolunteers: 1,
      isRegular: true,
    ),
    Ophaling(
      user: User(
        name: 'UGent UZ',
        email: 'UZ@ugent.be',
        phoneNumber: '+32 182 63 23 27',
        location: const LatLng(51.0225, 3.7101), // Gent Zuid-Oost
      ),
      foodtypes: [FoodType.bereid, FoodType.groenten],
      start: DateTime.now().add(const Duration(hours: 10)),
      end: DateTime.now().add(const Duration(hours: 12)),
      transportType: TransportType.vrachtwagen,
      needsRefrigeration: false,
      description: 'Overschot van gerechten en rauwkost',
      location: const LatLng(51.0225, 3.7101), // Gent Zuid-Oost
      maxVolunteers: 3,
      currentVolunteers: 2,
      isRegular: true,
    ),
  ];
} 