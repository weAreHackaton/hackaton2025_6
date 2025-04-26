import 'package:flutter/material.dart';
import 'package:hackaton2025_6/package.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    Provider(
      create: (context) => UserRepository(), // Provide UserRepository
      child: const HackatonApp(), // Now HackatonApp and its children can access it
    ),
  );
}
