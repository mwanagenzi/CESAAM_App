import 'package:ceesam_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/feedback_details.dart';
import '../services/network_helper.dart';
import '../theme/color_palette.dart';

class FeedbackResponseConsentDialog extends StatefulWidget {
  const FeedbackResponseConsentDialog(
      {super.key,
      required this.responseType,
      required this.description,
      required this.onClearTextFields});

  final String description;
  final String responseType;
  final void Function() onClearTextFields;

  @override
  State<FeedbackResponseConsentDialog> createState() =>
      _FeedbackResponseConsentDialogState();
}

class _FeedbackResponseConsentDialogState
    extends State<FeedbackResponseConsentDialog> {
  late TextEditingController _firstNameTextController;
  late TextEditingController _surnameTextController;
  late TextEditingController _emailTextController;
  final GlobalKey<FormState> _dialogFormKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    _firstNameTextController = TextEditingController();
    _surnameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    super.initState();
  }

  Future<Map<String, dynamic>> _sendConsentedFeedback(
      FeedbackDetails feedbackDetails) async {
    if (_dialogFormKey.currentState!.validate()) {
      try {
        var jsonMap = await NetworkHelper.submitFeedback(feedbackDetails);
        return <String, dynamic>{
          'success': jsonMap['success'],
          'message': jsonMap['message']
        };
      } catch (e) {
        debugPrint("Unknown Exception In Dialog: ${e.toString()}");
        return <String, dynamic>{
          'message':
              "Error in uploading your feedback. Contact admin for support"
        };
      }
    } else {
      return <String, dynamic>{
        'message': "Kindly check the format of your input data"
      };
    }
  }

  SnackBar _showFeedbackSnackBar(String message) {
    return SnackBar(
        backgroundColor: ColorPalette.primaryColor,
        elevation: 15.0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 20)
            .add(const EdgeInsets.only(bottom: 20)),
        content: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.white),
        ));
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
    return SingleChildScrollView(
      child: AlertDialog(
        title: const Text('Feedback Response Consent'),
        content: Form(
          key: _dialogFormKey,
          child: Column(
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
        ),
        actions: [
          _isLoading
              ? SpinKitFadingCircle(
                  color: ColorPalette.primaryColor,
                  size: 70,
                )
              : ElevatedButton(
                  onPressed: () async {
                    setState(() => _isLoading = true);

                    try {
                      var response = await _sendConsentedFeedback(
                        FeedbackDetails(
                            description: widget.description,
                            responseType: widget.responseType,
                            respondToFeedback: true,
                            firstName: _firstNameTextController.text,
                            surname: _surnameTextController.text,
                            email: _emailTextController.text),
                      );

                      if (response.containsKey('success') &&
                          response['success'] != null) {
                        setState(() => _isLoading = false);
                        ScaffoldMessenger.of(context).showSnackBar(
                            _showFeedbackSnackBar(response['message']));
                      } else if (!response.containsKey('success')) {
                        setState(() => _isLoading = false);
                        ScaffoldMessenger.of(context).showSnackBar(
                            _showFeedbackSnackBar(response['message']));
                      } else {
                        setState(() => _isLoading = false);
                        showDialog(
                          context: context,
                          builder: (_) =>
                              ReponseErrorDialog(message: response['message']),
                        );
                      }
                    } on Exception catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(_showFeedbackSnackBar(e.toString()));
                      debugPrint("Consent Dialog exception:  ${e.toString()}");
                    } finally {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('SUBMIT'),
                ),
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
        ],
      ),
    );
  }
}
