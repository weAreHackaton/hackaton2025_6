import 'package:flutter/material.dart';
import 'package:hackaton2025_6/package.dart';

class DetailPage extends StatelessWidget {
  final Ophaling ophaling;

  const DetailPage({super.key, required this.ophaling});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Ophaling: $ophaling"));
  }
}