import 'package:flutter/material.dart';
import 'package:hackaton2025_6/package.dart';

class DetailPage extends StatelessWidget {
  final Ophaling ophaling;

  const DetailPage({super.key, required this.ophaling});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('Ophaling'),
      ),
      body: Center(child: Text(ophaling.toString()))
    );
  }
}