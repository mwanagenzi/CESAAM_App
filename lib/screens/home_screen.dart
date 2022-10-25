import 'package:ceesam_app/utils/routes/app_routes.dart';
import 'package:ceesam_app/widgets/home_screen_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  HomeScreenTile(
                    svgAssetFilePath: "assets/svg_images/idea-suggestion.svg",
                    tileTitle: "Suggestion",
                    tileDescription: "Tell us how we can serve you better",
                    destinationRouteName: AppRoutes.suggestion,
                  ), //TODO: Define screen tile title, description and image
                  HomeScreenTile(
                    svgAssetFilePath: "assets/svg_images/noun-thumbs-up.svg",
                    tileTitle: "Compliment",
                    tileDescription: "Positive remarks keep us going",
                    destinationRouteName: AppRoutes.compliment,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  HomeScreenTile(
                    svgAssetFilePath: "assets/svg_images/dissatisfied.svg",
                    tileTitle: "Complaint",
                    tileDescription: "Report any flaws that we can rectify",
                    destinationRouteName: AppRoutes.complaint,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
