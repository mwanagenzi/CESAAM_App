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
      home: const ContactDetailsScreen(),
      routes: {
        // '/': (context) => const WelcomeScreen(),
        // '/home': (context) => const HomeScreen(),
        // '/home/suggestion':(context) => const SuggestionScreen(),
        // '/home/compliment':(context) => const ComplimentScreen(),
        // '/home/complaint':(context) => const ComplaintScreen(),
        // '/home/personal_details':(context) => const ContactDetailsScreen(),
        // 'home/submission_status':(context) => const SubmissionStatusScreen(),
      },
    );
  }
}
