import 'package:flutter/material.dart';
import 'package:we_travel/screens/gallery_screen.dart';
import 'package:we_travel/screens/auth/login_screen.dart';
import 'package:we_travel/screens/auth/register_screen.dart';
import 'package:we_travel/screens/auth/profile_screen.dart';
import 'package:we_travel/screens/home_screen.dart';
import 'package:we_travel/screens/trip_screen.dart';
import 'package:we_travel/screens/stop_detail_screen.dart';
import 'package:we_travel/screens/export_screen.dart';
import 'package:we_travel/screens/import_screen.dart';
import 'package:we_travel/screens/invite_screen.dart';
import 'package:we_travel/screens/settings_screen.dart';

class AppRouter {
  static const String initialRoute = '/login';

  static final Map<String, WidgetBuilder> routes = {
    '/login': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(),
    '/profile': (context) => const ProfileScreen(),
    '/home': (context) => const HomeScreen(),
    '/trip': (context) => const TripScreen(),
    '/stop': (context) => const StopDetailScreen(),
    '/gallery': (context) => const GalleryScreen(),
    '/export': (context) => const ExportScreen(),
    '/import': (context) => const ImportScreen(),
    '/invite': (context) => const InviteScreen(),
    '/settings': (context) => const SettingsScreen(),
  };
}
