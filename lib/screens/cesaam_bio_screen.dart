import 'package:ceesam_app/screens/web_view_screen.dart';
import 'package:ceesam_app/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CESAAMBioScreen extends StatelessWidget {
  const CESAAMBioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.separated(
        itemCount: bioScreenItems.length,
        itemBuilder: (context, index) => bioScreenItems[index],
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      ),
    ));
  }
}

class CESAAMBioListTile extends StatelessWidget {
  final String _tileIconAssetPath;
  final String _tileTitle;
  final String _tileSubtitle;
  final String _tileWebViewUrl;
  const CESAAMBioListTile({
    required String tileIconAssetPath,
    required String tileTitle,
    required String tileSubtitle,
    required String tileWebViewUrl,
    Key? key,
  })  : _tileIconAssetPath = tileIconAssetPath,
        _tileTitle = tileTitle,
        _tileSubtitle = tileSubtitle,
        _tileWebViewUrl = tileWebViewUrl,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(
                      webViewTitle: _tileTitle,
                      webViewUrl: _tileWebViewUrl,
                    )),
          );
          //todo: open webview with relevant link
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: ColorPalette.primaryColor, width: 2.0),
        ),
      ),
    );
  }
}

const List<CESAAMBioListTile> bioScreenItems = [
  CESAAMBioListTile(
    tileIconAssetPath: 'assets/svg_images/profile_icon.svg',
    tileTitle: 'Our Profile',
    tileSubtitle: 'Objectives & Achievements',
    tileWebViewUrl:
        'https://cesaam.egerton.ac.ke/about-us/about-cesaam/our-profile',
  ),
  CESAAMBioListTile(
    tileIconAssetPath: 'assets/svg_images/Shake-hand.svg',
    tileTitle: 'Our Partners',
    tileSubtitle: 'Collaborators & Sponsors',
    tileWebViewUrl:
        'https://cesaam.egerton.ac.ke/about-us/about-cesaam/partners', //todo: what's up with this url?
  ),
  CESAAMBioListTile(
    tileIconAssetPath: 'assets/svg_images/noun-briefcase-5255752.svg',
    tileTitle: 'Our Services',
    tileSubtitle: 'Activities & Collaborations',
    tileWebViewUrl:
        'https://cesaam.egerton.ac.ke/about-us/about-cesaam/services',
  ),
];
