import 'package:flutter/material.dart';
import 'package:we_travel/models/transport.dart';

class TransportCard extends StatelessWidget {
  final Transport transport;
  
  const TransportCard({super.key, required this.transport});

  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        title: Text(transport.type),
      ),
    );
  }
}