import 'package:flutter/material.dart';
import 'package:hackaton2025_6/package.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => UserRepository()
        ),
        Provider(
          create: (context) => OphalingRepository()
        ),
      ],
      child: const HackatonApp(),
    ),
  );
}
