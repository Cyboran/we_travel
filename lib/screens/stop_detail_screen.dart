import 'package:flutter/material.dart';

class StopDetailScreen extends StatelessWidget {
  const StopDetailScreen({super.key});

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
