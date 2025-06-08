import 'package:flutter/material.dart';
import 'package:we_travel/models/stop.dart';

class StopDetailScreen extends StatelessWidget {
  final Stop stop;

  const StopDetailScreen({super.key, required this.stop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stop Details'),
      ),
      body: const Center(
        child: Text('Stop Detail Screen'),
      ),
    );
  }
}
