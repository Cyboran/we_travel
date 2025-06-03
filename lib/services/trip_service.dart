import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:we_travel/services/firestore_service.dart';
import '../models/trip.dart';

class TripService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirestoreService _firestoreService = FirestoreService();

  /// Gets the currently logged in user's UID
  String get _userId => _firestoreService.getCurrentUserId();

  /// Returns a stream of trips for the current user (excluding archived ones by default)
  Stream<List<Trip>> getTrips({bool includeArchived = false}) {
    final query = _db
        .collection('users')
        .doc(_userId)
        .collection('trips')
        .where('isArchived', isEqualTo: includeArchived ? null : false)
        .orderBy('startDate');

    return query.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Trip.fromMap(doc.data(), doc.id)).toList());
  }

  /// Adds a new trip to the current user's trip collection
  Future<void> addTrip(Trip trip) async {
    final tripMap = trip.toMap();
    tripMap['isArchived'] ??= false; // Ensure field exists
    await _db
        .collection('users')
        .doc(_userId)
        .collection('trips')
        .add(tripMap);
  }

  /// Updates an existing trip for the current user
  Future<void> updateTrip(Trip trip) async {
    await _db
        .collection('users')
        .doc(_userId)
        .collection('trips')
        .doc(trip.id)
        .update(trip.toMap());
  }

  /// Deletes a trip by ID for the current user
  Future<void> deleteTrip(String tripId) async {
    await _db
        .collection('users')
        .doc(_userId)
        .collection('trips')
        .doc(tripId)
        .delete();
  }

  /// Archives a trip by setting `isArchived: true`
  Future<void> archiveTrip(String tripId) async {
    await _db
        .collection('users')
        .doc(_userId)
        .collection('trips')
        .doc(tripId)
        .update({'isArchived': true});
  }

  /// Un-archives a trip by setting `isArchived: false`
  Future<void> unarchiveTrip(String tripId) async {
    await _db
        .collection('users')
        .doc(_userId)
        .collection('trips')
        .doc(tripId)
        .update({'isArchived': false});
  }
}
