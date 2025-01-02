import 'package:cesaam_feedback_app/theme/color_palette.dart';
import 'package:flutter/material.dart';

import '../screens/contact_details_screen.dart';

class ResponseConsentDialog extends StatelessWidget {
  const ResponseConsentDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Response Consent'),
      content: const Text(
        'Would you like us to share our response with you?',
        softWrap: true,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            //TODO:Navigate to Personal Details screen
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ContactDetailsScreen()));
          },
          child: const Text(
            'Yes',
          ),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'No',
          ),
        ),
      ],
    ); //TODO:If user taps no, upload feedback details to db
  }
}

SnackBar showSubmissionStatus(BuildContext context, String content) {
  return SnackBar(
    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
    shape: RoundedRectangleBorder(
      // side: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(10),
    ),
    duration: const Duration(seconds: 3),
    elevation: 2,
    behavior: SnackBarBehavior.floating,
    content: Text(content),
    backgroundColor: ColorPalette.primaryColor,
  );

  //todo: across all 3 feedback screens, associate the snackbar appropriately
  //todo: uncomment the line below upon further integration
  // return content.contains('Error')
  //     ? SnackBar(
  //         margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
  //         shape: RoundedRectangleBorder(
  //           side: const BorderSide(color: Colors.red),
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         duration: const Duration(seconds: 3),
  //         elevation: 2,
  //         behavior: SnackBarBehavior.floating,
  //         content: Text(content),
  //       )
  //     : SnackBar(
  //         margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         backgroundColor: ColorPalette.primaryColor,
  //         duration: const Duration(seconds: 3),
  //         elevation: 2,
  //         behavior: SnackBarBehavior.floating,
  //         content: Text(content),
  //       );
}
