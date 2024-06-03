import 'package:ceesam_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FeedbackResponseConsentDialog extends StatefulWidget {
  const FeedbackResponseConsentDialog({super.key});

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
          onPressed: () => Navigator.pop(context),
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
