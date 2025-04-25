import 'package:flutter/material.dart';

class OphalingenPage extends StatelessWidget {
  const OphalingenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the list
    final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ophalingen'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: ListTile(
              title: Text(items[index]),
              subtitle: Text('Details for ${items[index]}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle item tap
              },
            ),
          );
        },
      ),
    );
  }
}

