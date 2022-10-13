import 'package:flutter/material.dart';

import 'screens/screens.dart';

void main() {
  runApp(const CESAAMApp());
}

class CESAAMApp extends StatelessWidget {
  const CESAAMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green, //TODO: Define the CESAAM Theme colors
      ),
      home: const HomeScreen(),
      routes: {
        // '/': (context) => const WelcomeScreen(),
        // '/home': (context) => const HomeScreen(),
      },
    );
  }
}
