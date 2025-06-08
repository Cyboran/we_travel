import 'package:flutter/material.dart';
import 'package:we_travel/models/stop.dart';

class StopCard extends StatelessWidget {
  final Stop stop;

  const StopCard({super.key, required this.stop});

  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        title: Text(stop.name),
        subtitle: Text(stop.location),
      ),
    );
  }
}