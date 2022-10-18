import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenTile extends StatelessWidget {
  final String _svgAssetFilePath;
  const HomeScreenTile({
    Key? key,
    required String svgAssetFilePath, 
  })  : _svgAssetFilePath = svgAssetFilePath,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, //TODO: set action o navigate to relevant screen
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 150,
        decoration: BoxDecoration(
          color: const Color(0xFFD6D4D4), //TODO: Color Palette home screen
          //todo: tile theme color
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xFF2B8B23),
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              _svgAssetFilePath,
              height: 75,
              width: 75,
            ),
            const Text(
              'Screen Title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20, //TODO: define screen title text in theme settings
              ),
            ),
            const Divider(
              color: Color(0xffCA0506), //TODO: App Theme Secondary coloR
              thickness: 2,
            ),
            const Text(
              "Screen Description Goes Here \n Lot's of text here",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize:
                    16, //TODO: define screen title description in app theme
              ),
            ),
          ],
        ),
      ),
    );
  }
}