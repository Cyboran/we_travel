import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Returns the current user's UID or throws an exception if not logged in
  String getCurrentUserId() {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in.');
    }
    return user.uid;
  }

  /// Returns the current user's display name or a default value if not set
  String getCurrentUserDisplayName() {
    final user = _auth.currentUser;
    return user?.displayName ?? 'Traveler';
  }

  /// Returns the current user's email or a default value if not set
  String getCurrentUserEmail() {
    final user = _auth.currentUser;
    return user?.email ?? 'No email';
  }
}
