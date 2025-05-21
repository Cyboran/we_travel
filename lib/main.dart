import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:we_travel/app.dart';
import 'package:we_travel/firebase_options.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  // Ensure that Firebase is initialized before running the app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app, starting with login screen
  runApp(const WeTravelApp());
}