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
            children: const [
              CESAAMContactListTile(),
              CESAAMContactListTile(),
              CESAAMContactListTile(),
              CESAAMContactListTile(),
            ]),
      ),
    );
  }
}

class CESAAMContactListTile extends StatelessWidget {
  const CESAAMContactListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
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
