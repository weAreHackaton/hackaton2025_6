import 'package:flutter/material.dart';
import 'package:hackaton2025_6/package.dart';

class HackatonApp extends StatelessWidget {
  const HackatonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackaton 2025 groep 6',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      home: const NavigationPage(),
    );
  }
}