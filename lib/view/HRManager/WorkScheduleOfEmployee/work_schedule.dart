import 'package:flutter/material.dart';

class WorkSchedule extends StatefulWidget {
  const WorkSchedule({super.key});

  @override
  State<WorkSchedule> createState() => _WorkScheduleState();
}

class _WorkScheduleState extends State<WorkSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
      ),
      body: const Center(
        child: Text(
          'List Employee',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
