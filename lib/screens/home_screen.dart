import 'package:ceesam_app/utils/routes/app_routes.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

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
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              Navigator.pushNamed(context, value);
              //TODO:set how to navigate to each of the 3 screens here
            },
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: AppRoutes.aboutUs,
                child: Text('About Us'),
              ),
              const PopupMenuItem<String>(
                value: AppRoutes.contactUs,
                child: Text('Contact Us'),
              ),
              const PopupMenuItem<String>(
                value: AppRoutes.developer,
                child: Text('Developer'),
              )
            ],
          )
        ],
        centerTitle: true, //TODO: define in app theme
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _updatePosition,
            children: [
              HomeScreenTile(
                imgAssetFilePath: 'assets/png_images/welcome_feedback_png.png',
                tileDescription: 'Tile Description',
                tileTitle: 'TileTitle',
                tileButtonText: "Get Started",
              ),
              HomeScreenTile(
                imgAssetFilePath: 'assets/png_images/welcome_feedback_png.png',
                tileDescription: 'Tile Description',
                tileTitle: 'TileTitle',
                tileButtonText: "Visit Us",
              ),
              HomeScreenTile(
                imgAssetFilePath: 'assets/png_images/welcome_feedback_png.png',
                tileDescription: 'Tile Description',
                tileTitle: 'TileTitle',
                tileButtonText: 'Reach out',
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
              )),
        ],
      ),
    );
  }
}

class HomeScreenTile extends StatelessWidget {
  HomeScreenTile({
    required this.imgAssetFilePath,
    required this.tileTitle,
    required this.tileDescription,
    required this.tileButtonText,
  });
  String imgAssetFilePath;
  String tileTitle;
  String tileDescription;
  String tileButtonText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top:10.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Image(image: AssetImage(imgAssetFilePath)),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(tileTitle),
                    const SizedBox(height: 20),
                    Text(tileDescription),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => {},
                      child: Text(tileButtonText),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// child: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //   child: Center(
      //     child:

      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       mainAxisSize: MainAxisSize.max,
      //       children: const [
      //         HomeScreenTile(
      //           svgAssetFilePath: "assets/svg_images/idea-suggestion.svg",
      //           tileTitle: "Suggestion",
      //           tileDescription: "Tell us how we can serve you better",
      //           destinationRouteName: AppRoutes.suggestion,
      //         ), //TODO: Define screen tile title, description and image
      //         HomeScreenTile(
      //           svgAssetFilePath: "assets/svg_images/noun-thumbs-up.svg",
      //           tileTitle: "Compliment",
      //           tileDescription: "Positive remarks keep us going",
      //           destinationRouteName: AppRoutes.compliment,
      //         ),
      //       ],
      //     ),
      //     const SizedBox(height: 20),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: const [
      //         HomeScreenTile(
      //           svgAssetFilePath: "assets/svg_images/dissatisfied.svg",
      //           tileTitle: "Complaint",
      //           tileDescription: "Report any flaws that we can rectify",
      //           destinationRouteName: AppRoutes.complaint,
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      // ),
      // ),
      // ),