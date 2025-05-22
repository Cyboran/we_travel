import 'package:flutter/material.dart';
import 'routes/app_router.dart';

class WeTravelApp extends StatelessWidget {
  const WeTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeTravel',
      debugShowCheckedModeBanner: false,

      // Default theme for the app
      // TODO: Update the theme to match the design
      // Light theme
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
      ),
      // Dark theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
      ),
      themeMode: ThemeMode.system, // TODO: Decide on a theme mode (ThemeProvider or ThemeMode.system)
      
      // Navigation using named routes 
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}
