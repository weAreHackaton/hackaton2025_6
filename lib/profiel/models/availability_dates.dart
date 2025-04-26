import 'package:day_picker/day_picker.dart';
import 'package:flutter/material.dart'; // for TimeOfDay

class DayTime {
  final DayInWeek day;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  const DayTime({
    required this.day,
    required this.startTime,
    required this.endTime,
  });

  @override
  String toString() {
    final start = _formatTime(startTime);
    final end = _formatTime(endTime);
    return '$day $start - $end';
  }

  String _formatTime(TimeOfDay time) {
    final hourStr = time.hour.toString().padLeft(2, '0');
    final minuteStr = time.minute.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr';
  }
}

extension StringExtension on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}
