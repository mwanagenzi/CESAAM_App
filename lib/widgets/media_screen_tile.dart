import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/web_view_screen.dart';

const TextStyle _tileTitleStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 22);
//TODO: define screen title text in theme settings
const TextStyle _tileDescriptionStyle = TextStyle(fontSize: 16);
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
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => WebViewScreen(
            webViewTitle: tileTitle,
            webViewUrl: webViewUrl,
          ),
        ),
      ),
      child: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            child: Column(
              children: [
                SvgPicture.asset(
                  svgAssetFilePath,
                  height: 75,
                  width: 75,
                ),
                const SizedBox(height: 20),
                Text(
                  tileTitle,
                  style: _tileTitleStyle,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    tileDescription,
                    style: _tileDescriptionStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
