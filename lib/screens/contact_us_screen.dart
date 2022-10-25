import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/color_palette.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Our Contacts',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true, //TODO: define in app theme
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CESAAMContactListTile(
                tileIconAssetPath: 'assets/svg_images/profile_icon.svg',
                tileTitle: 'Our Profile',
                tileSubtitle: 'Objectives & Achievements',
              ),
              CESAAMContactListTile(
                tileIconAssetPath: 'assets/svg_images/Shake-hand.svg',
                tileTitle: 'Our Partners',
                tileSubtitle: 'Collaborators & Sponsors',
              ),
              CESAAMContactListTile(
                tileIconAssetPath:
                    'assets/svg_images/noun-briefcase-5255752.svg',
                tileTitle: 'Our Services',
                tileSubtitle: 'Acitivities & Areas of Collaboration',
              ),
            ]),
      ),
    );
  }
}

class CESAAMContactListTile extends StatelessWidget {
  final String _tileIconAssetPath;
  final String _tileTitle;
  final String _tileSubtitle;
  // final String _tileWebViewUrl;
  const CESAAMContactListTile({
    required String tileIconAssetPath,
    required String tileTitle,
    required String tileSubtitle,
    // required String tileWebViewUrl,
    Key? key,
  })  : _tileIconAssetPath = tileIconAssetPath,
        _tileTitle = tileTitle,
        _tileSubtitle = tileSubtitle,
        // _tileWebViewUrl = tileWebViewUrl,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: SvgPicture.asset(_tileIconAssetPath),
        ),
        title: Text(
          _tileTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          _tileSubtitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: ColorPalette.primaryColor,
        ),
        onTap: () {
          //todo: open url launcher for specific action
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: ColorPalette.primaryColor, width: 2.0),
        ),
      ),
    );
  }
}
