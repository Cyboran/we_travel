import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      // Listen to the authentication state changes
      stream: FirebaseAuth.instance.authStateChanges(),
      // Snapshot of the authentication state to check if the user is logged in or not
      builder: (context, snapshot) {
        // Check if the connection is still waiting and show a loading indicator if so
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Check if the connection is done and for the user
        // Schedule navigation AFTER the build method is complete
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Check if the user is logged in
          if (snapshot.hasData && snapshot.data != null) {
            // If there's a user, navigate to the home screen
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            // If there's no user, navigate to the login screen
            Navigator.pushReplacementNamed(context, '/login');
          }
        });

        // If the connection is done and there's no user, show an empty widget
        // Prevents build errors
        return const SizedBox.shrink();
      },
    );
  }
}
