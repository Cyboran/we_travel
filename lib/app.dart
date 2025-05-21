import 'package:flutter/material.dart';
import 'routes/app_router.dart';

class WeTravelApp extends StatelessWidget {
  const WeTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeTravel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
      ),
      themeMode: ThemeMode.system, // or use a ThemeProvider later
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}
