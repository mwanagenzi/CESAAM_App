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
      //TODO: set action o navigate to relevant screen
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
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Column(
          //     children: [
          //       const SizedBox(height: 20),
          //       Text(
          //         tileTitle,
          //         style: _tileTitleStyle,
          //       ),
          //       const SizedBox(height: 20),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 40),
          //         child: Text(
          //           tileDescription,
          //           style: _tileDescriptionStyle,
          //           textAlign: TextAlign.center,
          //         ),
          //       ),
          //       const SizedBox(height: 20),
          //     ],
          //   ),
          // )
        ],
      ),
      // Container(
      //   padding: const EdgeInsets.all(10),
      //   width: 150,
      //   decoration: BoxDecoration(
      //     color: const Color(0xFFD6D4D4), //TODO: Color Palette home screen
      //     //todo: tile theme color
      //     borderRadius: BorderRadius.circular(15),
      //     border: Border.all(
      //       color: const Color(0xFF2B8B23), //todo: add to theme
      //       width: 2,
      //     ),
      //   ),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       SvgPicture.asset(
      //         svgAssetFilePath,
      //         height: 75,
      //         width: 75,
      //       ),
      //       Text(
      //         tileTitle,
      //         style: tileTitleStyle,
      //       ),
      //       const Divider(
      //         color: Color(0xFFE27926), //TODO: App Theme Secondary color
      //         thickness: 2,
      //       ),
      //       Text(
      //         tileDescription,
      //         textAlign: TextAlign.center,
      //         style: tileDescriptionStyle,
      //         softWrap: true,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
