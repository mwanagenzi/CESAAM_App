import 'package:ceesam_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MediaHandlesScreen extends StatelessWidget {
  const MediaHandlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 4,
            (context, index) => const Padding(
              padding: EdgeInsets.all(10),
              child: HomeScreenTile(
                  svgAssetFilePath: 'assets/svg_images/Globe.svg',
                  tileTitle: 'Media',
                  tileDescription: 'Tile Description',
                  destinationRouteName: ''),
            ),
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              mainAxisSpacing: 2.5,
              crossAxisSpacing: 2),
        )
      ],
    )
        // Column(
        //   children: [
        //     HomeScreenTile(
        //         svgAssetFilePath: 'svgasset',
        //         tileTitle: 'Twitter',
        //         tileDescription: 'Follow us for more info',
        //         destinationRouteName:
        //             AppRoutes.WebView), //todo: set appropriate webview link
        //     HomeScreenTile(
        //         svgAssetFilePath: 'svgasset',
        //         tileTitle: 'Twitter',
        //         tileDescription: 'Follow us for more info',
        //         destinationRouteName:
        //             AppRoutes.WebView), //todo: set appropriate webview link
        //     HomeScreenTile(
        //         svgAssetFilePath: 'svgasset',
        //         tileTitle: 'Twitter',
        //         tileDescription: 'Follow us for more info',
        //         destinationRouteName:
        //             AppRoutes.WebView), //todo: set appropriate webview link
        //     HomeScreenTile(
        //         svgAssetFilePath: 'svgasset',
        //         tileTitle: 'Twitter',
        //         tileDescription: 'Follow us for more info',
        //         destinationRouteName:
        //             AppRoutes.WebView), //todo: set appropriate webview link
        //   ],
        // ),
        );
  }
}
