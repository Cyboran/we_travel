import 'package:cloud_firestore/cloud_firestore.dart';

class Trip {
  String id;
  String title;
  String description;
  DateTime startDate;
  DateTime endDate;

  Trip({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  factory Trip.fromMap(Map<String, dynamic> data, String id) {
    return Trip(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
