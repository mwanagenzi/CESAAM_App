import 'package:ceesam_app/screens/welcome_screen.dart';

import 'widgets/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CESAAMApp());
}

class CESAAMApp extends StatelessWidget {
  const CESAAMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue, //TODO: Define the CESAAM Theme colors
      ),
      routes: {
        '/': (context) => const WelcomeScreen(),
      },
    );
  }
}
