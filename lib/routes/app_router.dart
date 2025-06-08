import 'package:flutter/material.dart';
import 'package:we_travel/models/trip.dart';
import 'package:we_travel/models/stop.dart';
import 'package:we_travel/screens/auth/auth_gate.dart';
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
  static const String initialRoute = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const AuthGate());

      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case '/trip':
        final trip = settings.arguments as Trip;
        return MaterialPageRoute(builder: (_) => TripScreen(trip: trip));

      case '/stop':
        final stop = settings.arguments as Stop;
        return MaterialPageRoute(builder: (_) => StopDetailScreen(stop: stop));

      case '/gallery':
        return MaterialPageRoute(builder: (_) => const GalleryScreen());

      case '/export':
        return MaterialPageRoute(builder: (_) => const ExportScreen());

      case '/import':
        return MaterialPageRoute(builder: (_) => const ImportScreen());

      case '/invite':
        return MaterialPageRoute(builder: (_) => const InviteScreen());

      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}
