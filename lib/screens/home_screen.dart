import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../services/trip_service.dart';
import '../../models/trip.dart';
import '../../widgets/trip_card.dart';
import '../../widgets/profile_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TripService _tripService = TripService();
  String _searchQuery = '';

  void _addTrip() {
    // TODO: Navigate to trip creation screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add Trip tapped')),
    );
  }

  void _openTripDetail(String tripId) {
    Navigator.pushNamed(context, '/trip_detail', arguments: tripId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              height: 60,
            ),
            const SizedBox(width: 24),
            const Text('WeTravel',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.add, size: 36),
              style: IconButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: const CircleBorder(),
              ),
              onPressed: _addTrip,
              tooltip: 'Add Trip',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search trips...',
                prefixIcon: Icon(Icons.search),
              ),
              style: const TextStyle(fontSize: 22),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Trip>>(
              stream: _tripService.getTrips(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60.0),
                      child: Text(
                        'No trips found!\n\nPlease add a new trip using the + button in the top right.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  );
                }

                final trips = snapshot.data!
                    .where((trip) =>
                        !_searchQuery.trim().isNotEmpty ||
                        trip.title.toLowerCase().contains(_searchQuery))
                    .toList();

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: trips.length,
                  itemBuilder: (context, index) {
                    final trip = trips[index];
                    return TripCard(
                      trip: trip,
                      onTap: () => _openTripDetail(trip.id),
                    );
                  },
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: ProfileCard(),
          ),
        ],
      ),
    );
  }
}
