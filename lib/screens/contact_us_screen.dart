import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
              CESAAMContactListTile(
                tileIcon: Icons.call_rounded,
                tileTitle: 'Phone Number',
                tileSubtitle: 'Tap to call or SMS',
              ),
              CESAAMContactListTile(
                tileIcon: Icons.email_outlined,
                tileTitle: 'Email us',
                tileSubtitle:
                    'Tap to send us an email', //todo: seek a better description
              ),
              CESAAMContactListTile(
                tileIcon: Icons.pin_drop_outlined,
                tileTitle: 'Physical Address',
                tileSubtitle: 'Tap to open Google Maps',
              ),
              CESAAMContactListTile(
                tileIcon: Icons.access_time,
                tileTitle: 'Working hours',
                tileSubtitle: 'Weekdays : 8:00am to 5:00pm',
              ),
            ]),
      ),
    );
  }
}

class CESAAMContactListTile extends StatelessWidget {
  final IconData tileIcon;
  final String tileTitle;
  final String tileSubtitle;

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  static const String _phoneNumber = '+254700822859';
  static const String _emailAddress = 'cesaam@egerton.ac.ke';

  const CESAAMContactListTile({
    required this.tileIcon,
    required this.tileTitle,
    required this.tileSubtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        leading: Icon(
          tileIcon,
          size: 35,
          color: Colors.black,
        ),
        title: Text(
          tileTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          tileSubtitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: ColorPalette.primaryColor,
        ),
        onTap: () async {
          switch (tileTitle) {
            case 'Phone Number':
              showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: ColorPalette.primaryColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await launchUrl(
                                      Uri(scheme: 'tel', path: _phoneNumber),
                                    );
                                  },
                                  child: Icon(
                                    Icons.phone,
                                    color: ColorPalette.primaryColor,
                                    size: 50.0,
                                  ),
                                ),
                                Text(
                                  'Phone',
                                  style: Theme.of(context).textTheme.headline6,
                                )
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await launchUrl(
                                      Uri(
                                        scheme: 'sms',
                                        path: _phoneNumber,
                                        queryParameters: <String, String>{
                                          'body': Uri.encodeComponent(
                                              'Type your message here'),
                                        },
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.sms_outlined,
                                    color: ColorPalette.primaryColor,
                                    size: 50.0,
                                  ),
                                ),
                                Text(
                                  'SMS',
                                  style: Theme.of(context).textTheme.headline6,
                                )
                              ],
                            ),
                          ],
                        ),
                      ));
              break;
            case 'Email us':
              await launchUrl(Uri(
                scheme: 'mailto',
                path: _emailAddress,
                query: encodeQueryParameters(<String, String>{
                  'subject': 'CESAAM Help',
                  'body': 'Include your message here.'
                }),
              ));

              break;
            case 'Physical Address':
              //todo: open google maps
              break;
            case 'Working hours':
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Working Hours'),
                  content: const Text(
                    'We look forward to seeing you on weekdays from 8am to 5pm',
                    softWrap: true,
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );

              break;
            default:
          }
          //todo: open url launcher for specific action
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: ColorPalette.primaryColor, width: 1.0),
        ),
      ),
    );
  }
}
