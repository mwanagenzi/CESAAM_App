import 'package:cesaam_feedback_app/routes/app_routes.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../widgets/home_screen_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();
  final _totalDots = 3;
  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(int position) {
    setState(() => _currentPosition = _validPosition(position.toDouble()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _updatePosition,
            children: [
              HomeScreenTile(
                imgAssetFilePath: 'assets/png_images/welcome_feedback_png.png',
                tileTitle: 'Feedback',
                tileDescription:
                    "We'd like to know your opinions to serve you better",
                tileButtonText: "Get Started",
                destinationRouteName: AppRoutes.feedback,
              ),
              HomeScreenTile(
                imgAssetFilePath: 'assets/png_images/information.png',
                tileTitle: 'Who We Are',
                tileDescription:
                    'Glance at our profile, achievements and what we have in store for you',
                tileButtonText: "Visit Us",
                destinationRouteName: AppRoutes.aboutUs,
              ),
              HomeScreenTile(
                imgAssetFilePath: 'assets/png_images/telephone.png',
                tileTitle: 'Talk To Us',
                tileDescription: 'Ways to reach out to us and get assisted',
                tileButtonText: 'Contact Us',
                destinationRouteName: AppRoutes.contactUs,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DotsIndicator(
              dotsCount: _totalDots,
              position: _currentPosition,
              onTap: (double page) {
                setState(() {
                  _pageController.animateToPage(page.toInt(),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
