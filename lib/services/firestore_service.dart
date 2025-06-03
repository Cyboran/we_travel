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
}
