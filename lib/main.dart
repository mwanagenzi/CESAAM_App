import 'package:ceesam_app/screens/location_screen.dart';
import 'package:ceesam_app/utils/routes/app_routing.dart';
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green, //TODO: Define the CESAAM Theme colors
        ),
        home: const LocationTab()
        // onGenerateRoute: generateAppRoutes,
        );
  }
}

// todo: app theming
// todo: include drop down menus to feedback screens
// todo: configure a drop down provider
// todo: refacor feedback screens to a single screen as well as home screen
// todo: youtube viewer package for flutter
// todo: welcome screen splash timer (remove continue button)
// todo: configure the working hours card
// todo: write some mock data and define repositories