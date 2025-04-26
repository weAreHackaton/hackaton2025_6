import 'package:flutter/material.dart';
import 'package:day_picker/day_picker.dart'; 
import 'package:hackaton2025_6/profiel/models/availability_dates.dart';
import 'package:hackaton2025_6/profiel/models/user.dart';
import 'package:hackaton2025_6/profiel/widgets/counter.dart';

class ProfielPage extends StatefulWidget {
  const ProfielPage({super.key});

  @override
  State<ProfielPage> createState() => _ProfielPageState();
}

class _ProfielPageState extends State<ProfielPage> {
  final GlobalKey<SelectWeekDaysState> customWidgetKey = GlobalKey();

  final List<DayInWeek> _days = [
    DayInWeek("Zo", dayKey: "zondag"),
    DayInWeek("Ma", dayKey: "maandag"),
    DayInWeek("Di", dayKey: "dinsdag"),
    DayInWeek("Wo", dayKey: "woensdag"),
    DayInWeek("Do", dayKey: "donderdag"),
    DayInWeek("Vr", dayKey: "vrijdag"),
    DayInWeek("Za", dayKey: "zaterdag"),
  ];

  TimeOfDay? startTime;
  TimeOfDay? endTime;
  List<DayTime> selectedDayTimes = [];
  int radius = 5;

  final TextEditingController _startTimeController = TextEditingController(
    text: "Not selected",
  );
  final TextEditingController _endTimeController = TextEditingController(
    text: "Not selected",
  );

  @override
  void dispose() {
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return TimeOfDay.fromDateTime(dt).format(context);
  }

  Future<void> _openDayTimePicker(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Available Days and Times"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SelectWeekDays(
                key: customWidgetKey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                days: _days,
                border: false,
                boxDecoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onSelect: (values) {},
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      startTime = picked;
                      _startTimeController.text = _formatTimeOfDay(picked);
                    });
                  }
                },
                child: const Text("Select Start Time"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _startTimeController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "Start Time",
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      endTime = picked;
                      _endTimeController.text = _formatTimeOfDay(picked);
                    });
                  }
                },
                child: const Text("Select End Time"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _endTimeController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "End Time",
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
              RadiusPicker(
                minRadius: 1,
                maxRadius: 50,
                onChanged: (newRadius) {
                  radius = newRadius;
                },
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // cancel
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final selectedDays =
                    _days.where((day) => day.isSelected).toList();
                if (selectedDays.isNotEmpty &&
                    startTime != null &&
                    endTime != null) {
                  setState(() {
                    for (var day in selectedDays) {
                      selectedDayTimes.add(
                        DayTime(
                          day: day,
                          startTime: startTime!,
                          endTime: endTime!,
                        ),
                      );
                    }
                  });
                  Navigator.pop(context);
                } else {
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profiel')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 8,
                  bottom: 16,
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person, size: 40),
                    ),
                    Text(
                      tempUser.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(tempUser.email, style: TextStyle(fontSize: 20)),
                    Text(tempUser.phoneNumber, style: TextStyle(fontSize: 20)),
                    Text(
                      "${tempUser.location.latitude}° N, ${tempUser.location.longitude}° W",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _openDayTimePicker(context);
                      },
                      child: const Text("Select Available Dates"),
                    ),
                    ...selectedDayTimes.map((dt) {
                      final day = dt.day.dayKey.capitalize();
                      final start = _formatTimeOfDay(dt.startTime);
                      final end = _formatTimeOfDay(dt.endTime);
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        elevation: 3,
                        child: ListTile(
                          leading: const Icon(Icons.calendar_today),
                          title: Text('$day: $start - $end'),
                          subtitle: Text('Straal: $radius km'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.redAccent),
                            onPressed: () {
                              setState(() {
                                selectedDayTimes.remove(dt);
                              });
                            },
                          ),
                        ),
                      );
                    }).toList(),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
