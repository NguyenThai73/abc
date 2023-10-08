import 'package:flutter/material.dart';

class OvertimeManagement extends StatefulWidget {
  const OvertimeManagement({super.key});

  @override
  State<OvertimeManagement> createState() => _OvertimeManagementState();
}

class _OvertimeManagementState extends State<OvertimeManagement> {
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
