import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Get the instance of FirebaseAuth
  // This is a singleton instance that allows us to interact with Firebase Authentication
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Call this method to login a user with email and password
  // It returns null if the login is successful, or an error message if it fails
  static Future<String?> loginWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Login failed';
    }
  }

  static Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return 'Login aborted';

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Call this method to logout the current user
  static Future<void> logout() async {
    await _auth.signOut();
  }

  // Call this method to register a new user with email and password
  // It returns null if the registration is successful, or an error message if it fails
  static Future<String?> registerWithEmail(String name, String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      await credential.user?.updateDisplayName(name);
      await credential.user?.reload();
      
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Registration failed';
    }
  }

  // Get the current user
  // This returns a User object if the user is logged in, or null if not
  static User? get currentUser => _auth.currentUser;
}
