import 'package:flutter/material.dart';

class RadiusPicker extends StatefulWidget {
  final int minRadius;
  final int maxRadius;
  final ValueChanged<int> onChanged;

  const RadiusPicker({
    super.key,
    this.minRadius = 1,
    this.maxRadius = 100,
    required this.onChanged,
  });

  @override
  State<RadiusPicker> createState() => _RadiusPickerState();
}

class _RadiusPickerState extends State<RadiusPicker> {
  int radius = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          iconSize: 32,
          onPressed: () {
            setState(() {
              if (radius > widget.minRadius) {
                radius--;
                widget.onChanged(radius);
              }
            });
          },
        ),
        Text(
          '$radius km',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          iconSize: 32,
          onPressed: () {
            setState(() {
              if (radius < widget.maxRadius) {
                radius++;
                widget.onChanged(radius);
              }
            });
          },
        ),
      ],
    );
  }
}
