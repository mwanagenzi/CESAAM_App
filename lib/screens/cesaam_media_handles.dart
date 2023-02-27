import 'package:ceesam_app/widgets/media_screen_tile.dart';
import 'package:flutter/material.dart';

class MediaHandlesScreen extends StatelessWidget {
  const MediaHandlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
          itemCount: mediaScreenItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 5 / 6,
              mainAxisSpacing: 3,
              crossAxisSpacing: 5),
          itemBuilder: (_, index) => MediaScreenTile(
            svgAssetFilePath: mediaScreenItems[index].svgAssetFilePath,
            tileTitle: mediaScreenItems[index].tileTitle,
            tileDescription: mediaScreenItems[index].tileDescription,
            webViewUrl: mediaScreenItems[index].webViewUrl,
          ),
        ),
      ),
    );
  }
}

const List<MediaScreenTile> mediaScreenItems = [
  MediaScreenTile(
    svgAssetFilePath: 'assets/svg_images/gallery.svg',
    tileTitle: 'Gallery',
    tileDescription: 'Slide through captured moments',
    webViewUrl: 'cesaam.egerton.ac.ke/news-media/gallery/photo-gallery',
  ),
  MediaScreenTile(
    svgAssetFilePath: 'assets/svg_images/twitter.svg',
    tileTitle: 'Twitter',
    tileDescription: 'Follow us for more info and latest trends',
    webViewUrl: 'twitter.com/CESAAM_EGERTON',
  ),
  MediaScreenTile(
    svgAssetFilePath: 'assets/svg_images/youtube-logo.svg',
    tileTitle: 'YouTube',
    tileDescription: 'Watch our sponsored projects and events',
    webViewUrl: 'www.youtube.com/channel/UCG90G51Xxe_hRf4-haZgfCA',
  ),
  MediaScreenTile(
    svgAssetFilePath: 'assets/svg_images/facebook-circled.svg',
    tileTitle: 'Facebook',
    tileDescription: 'Forms, Newsletters, Magazines and Reports',
    webViewUrl:
        'www.facebook.com/CESAAM-Egerton-University-2053828481612907/',
  ),
];
