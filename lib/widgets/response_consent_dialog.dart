import 'package:flutter/material.dart';

import '../screens/contact_details _screen.dart';

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
