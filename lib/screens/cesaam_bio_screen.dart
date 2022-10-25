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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: const [
          CESAAMBioListTile(),
          CESAAMBioListTile(),
          CESAAMBioListTile(),
        ],
      ),
    ));
  }
}

class CESAAMBioListTile extends StatelessWidget {
  const CESAAMBioListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: SvgPicture.asset('assets/svg_images/profile_icon.svg'),
        ),
        title: const Text(
          'Our Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: const Text(
          'Objectives and achievements',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: ColorPalette.primaryColor,
        ),
        onTap: () {
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
