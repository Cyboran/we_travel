import 'package:flutter/material.dart';
import '../../models/trip.dart';
import '../../models/stop.dart';
import '../../models/transport.dart';
import '../../widgets/stop_card.dart';
import '../../widgets/transport_card.dart';
import '../../widgets/timeline_connector.dart';
import '../../services/trip_service.dart';

class TripScreen extends StatelessWidget {
  final Trip trip;

  const TripScreen({super.key, required this.trip});

  void _addStop(BuildContext context) {
    // TODO: Open add_stop_form.dart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trip.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'Share',
            onPressed: () {
              // TODO: Implement share functionality
            },
          ),
        ],
      ),
      body: StreamBuilder<List<dynamic>>( // dynamic = mix of Stop & TransportSegment
        stream: TripService().getTimelineForTrip(trip.id), // assumes ordered mix
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final timeline = snapshot.data ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: timeline.length + 1,
            itemBuilder: (context, index) {
              if (index == timeline.length) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Center(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text('Add Stop'),
                      onPressed: () => _addStop(context),
                    ),
                  ),
                );
              }

              final item = timeline[index];

              return TimelineConnector(
                isStop: item is Stop,
                icon: item is Transport ? _getTransportIcon(item) : null,
                isFirst: index == 0,
                isLast: index == timeline.length - 1,
                child: item is Stop
                    ? StopCard(stop: item)
                    : TransportCard(transport: item),
              );
            },
          );
        },
      ),
    );
  }

  IconData _getTransportIcon(Transport t) {
    switch (t.type) {
      case 'car': return Icons.directions_car;
      case 'train': return Icons.train;
      case 'plane': return Icons.flight;
      default: return Icons.directions;
    }
  }
}
