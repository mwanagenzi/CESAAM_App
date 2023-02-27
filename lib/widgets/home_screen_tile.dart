import 'package:flutter/material.dart';

const TextStyle _tileTitleStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 22);
//TODO: define screen title text in theme settings
const TextStyle _tileDescriptionStyle = TextStyle(fontSize: 17);
//TODO: define screen title description in app theme

class HomeScreenTile extends StatelessWidget {
  HomeScreenTile({
    super.key,
    required this.imgAssetFilePath,
    required this.tileTitle,
    required this.tileDescription,
    required this.tileButtonText,
    required this.destinationRouteName,
  });
  String imgAssetFilePath;
  String tileTitle;
  String tileDescription;
  String tileButtonText;
  String destinationRouteName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image(image: AssetImage(imgAssetFilePath)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  tileTitle,
                  style: _tileTitleStyle,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    tileDescription,
                    style: _tileDescriptionStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, destinationRouteName),
                  child: Text(tileButtonText),
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }

  // final String _svgAssetFilePath;
  // final String _tileTitle;
  // final String _tileDescription;
  // final String _destinationRouteName;
  // const HomeScreenTile({
  //   Key? key,
  //   required String svgAssetFilePath,
  //   required String tileTitle,
  //   required String tileDescription,
  //   required String destinationRouteName,
  // })  : _svgAssetFilePath = svgAssetFilePath,
  //       _tileTitle = tileTitle,
  //       _tileDescription = tileDescription,
  //       _destinationRouteName = destinationRouteName,
  //       super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.pushNamed(context, _destinationRouteName);
  //     }, //TODO: set action o navigate to relevant screen
  //     child: Container(
  //       padding: const EdgeInsets.all(10),
  //       width: 150,
  //       decoration: BoxDecoration(
  //         color: const Color(0xFFD6D4D4), //TODO: Color Palette home screen
  //         //todo: tile theme color
  //         borderRadius: BorderRadius.circular(15),
  //         border: Border.all(
  //           color: const Color(0xFF2B8B23),
  //           width: 2,
  //         ),
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           SvgPicture.asset(
  //             _svgAssetFilePath,
  //             height: 75,
  //             width: 75,
  //           ),
  //           Text(
  //             _tileTitle,
  //             style: _tileTitleStyle,
  //           ),
  //           const Divider(
  //             color: Color(0xFFE27926), //TODO: App Theme Secondary color
  //             thickness: 2,
  //           ),
  //           Text(
  //             _tileDescription,
  //             textAlign: TextAlign.center,
  //             style: _tileDescriptionStyle,
  //             softWrap: true,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
