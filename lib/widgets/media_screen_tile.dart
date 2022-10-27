import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/web_view_screen.dart';

const TextStyle tileTitleStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
//TODO: define screen title text in theme settings
const TextStyle tileDescriptionStyle = TextStyle(fontSize: 16);
//TODO: define screen title description in app theme

class MediaScreenTile extends StatelessWidget {
  final String svgAssetFilePath;
  final String tileTitle;
  final String tileDescription;
  final String webViewUrl;
  const MediaScreenTile({
    Key? key,
    required this.svgAssetFilePath,
    required this.tileTitle,
    required this.tileDescription,
    required this.webViewUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WebViewScreen(
              webViewTitle: tileTitle,
              webViewUrl: webViewUrl,
            ),
          ),
        );
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
              svgAssetFilePath,
              height: 75,
              width: 75,
            ),
            Text(
              tileTitle,
              style: tileTitleStyle,
            ),
            const Divider(
              color: Color(0xFFE27926), //TODO: App Theme Secondary color
              thickness: 2,
            ),
            Text(
              tileDescription,
              textAlign: TextAlign.center,
              style: tileDescriptionStyle,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
