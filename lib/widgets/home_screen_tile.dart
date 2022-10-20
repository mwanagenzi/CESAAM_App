import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const TextStyle _tileTitleStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
//TODO: define screen title text in theme settings
const TextStyle _tileDescriptionStyle = TextStyle(fontSize: 16);
//TODO: define screen title description in app theme

class HomeScreenTile extends StatelessWidget {
  final String _svgAssetFilePath;
  final String _tileTitle;
  final String _tileDescription;
  final String _destinationRouteName;
  const HomeScreenTile({
    Key? key,
    required String svgAssetFilePath,
    required String tileTitle,
    required String tileDescription,
    required String destinationRouteName,
  })  : _svgAssetFilePath = svgAssetFilePath,
        _tileTitle = tileTitle,
        _tileDescription = tileDescription,
        _destinationRouteName = destinationRouteName,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, _destinationRouteName);
      }, //TODO: set action o navigate to relevant screen
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
            Text(
              _tileTitle,
              style: _tileTitleStyle,
            ),
            const Divider(
              color: Color(0xFFE27926), //TODO: App Theme Secondary color
              thickness: 2,
            ),
            Text(
              _tileDescription,
              textAlign: TextAlign.center,
              style: _tileDescriptionStyle,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
