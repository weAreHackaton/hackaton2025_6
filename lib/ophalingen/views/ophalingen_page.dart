import 'package:flutter/material.dart';
import 'package:hackaton2025_6/package.dart';
import 'package:provider/provider.dart';

class OphalingenPage extends StatefulWidget {
  const OphalingenPage({super.key});

  @override
  State<OphalingenPage> createState() => _OphalingenPageState();
}

class _OphalingenPageState extends State<OphalingenPage> {
  late List<Ophaling> _ophalingen;

  @override
  void initState() {
    super.initState();
    _loadOphalingen();
  }

  void _loadOphalingen() {
    final ophalingen = context.read<OphalingRepository>().getTempOphalingen();
    setState(() {
      _ophalingen = ophalingen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beschikbare ophalingen'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _loadOphalingen();
        },
        child: ListView.builder(
          itemCount: _ophalingen.length,
          itemBuilder: (context, index) {
            final ophaling = _ophalingen[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(ophaling: ophaling),
                  ),
                );
              },
              child: info_card(
                ophaling: ophaling,
              ),
            );
          },
        ),
      ),
    );
  }
}