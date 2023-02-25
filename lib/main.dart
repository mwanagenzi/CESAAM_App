import 'package:ceesam_app/utils/routes/app_routing.dart';
import 'package:flutter/material.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        onGenerateRoute: generateAppRoutes,
        );
  }
}

// todo: app theming
// todo: include drop down menus to feedback screens
// todo: configure a drop down provider
// todo: refacor feedback screens to a single screen as well as home screen
// todo: configure the working hours card
// todo: write some mock data and define repositories
// todo: write some tests for various parts of the code (UI and logic)