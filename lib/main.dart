import 'package:flutter/material.dart';

void main() {
  runApp(const CESAAMApp());
}

class CESAAMApp extends StatelessWidget {
  const CESAAMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CESAAM App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(title: 'CESAAM App'),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[800],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}
