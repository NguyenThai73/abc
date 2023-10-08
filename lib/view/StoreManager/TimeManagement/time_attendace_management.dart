import 'package:flutter/material.dart';

class TimeManagement extends StatefulWidget {
  const TimeManagement({super.key});

  @override
  State<TimeManagement> createState() => _TimeManagementState();
}

class _TimeManagementState extends State<TimeManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
      ),
      body: const Center(
        child: Text(
          'Time Management',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
