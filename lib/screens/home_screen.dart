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
                  ), //TODO: Define screen tile title, description and image
                  HomeScreenTile(
                    svgAssetFilePath: "assets/svg_images/noun-thumbs-up.svg",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  HomeScreenTile(
                    svgAssetFilePath: "assets/svg_images/dissatisfied.svg",
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
