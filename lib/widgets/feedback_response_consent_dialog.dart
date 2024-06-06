import 'package:ceesam_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/feedback_details.dart';
import '../services/network_helper.dart';

class FeedbackResponseConsentDialog extends StatefulWidget {
  const FeedbackResponseConsentDialog(
      {super.key, required this.responseType, required this.description});

  final String description;
  final String responseType;

  @override
  State<FeedbackResponseConsentDialog> createState() =>
      _FeedbackResponseConsentDialogState();
}

class _FeedbackResponseConsentDialogState
    extends State<FeedbackResponseConsentDialog> {
  late TextEditingController _firstNameTextController;
  late TextEditingController _surnameTextController;
  late TextEditingController _emailTextController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _firstNameTextController = TextEditingController();
    _surnameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _surnameTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Feedback Response Consent'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Kindly share your name and email address',
            softWrap: true,
          ),
          const SizedBox(height: 10),
          CESAAMTextFormField(
              textController: _firstNameTextController,
              formFieldText: "First Name",
              formIcon: Icons.person),
          const SizedBox(height: 10),
          CESAAMTextFormField(
              textController: _surnameTextController,
              formFieldText: "Surname",
              formIcon: Icons.person),
          const SizedBox(height: 10),
          CESAAMTextFormField(
              textController: _emailTextController,
              formFieldText: "Email Address",
              formIcon: Icons.email_outlined),
          const SizedBox(height: 10),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            //todo: send feedback here
            //todo: show response alert dialog
            //todo: pop until
            await NetworkHelper.submitFeedback(FeedbackDetails(
                description: widget.description,
                responseType: widget.responseType,
                respondToFeedback: true,
                firstName: _firstNameTextController.text,
                surname: _surnameTextController.text,
                email: _emailTextController.text));
          },
          child: const Text('SUBMIT'),
        ),
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('CANCEL'),
        ),
      ],
    );
  }
}
