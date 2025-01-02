import 'package:cesaam_feedback_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuggestionScreen extends StatefulWidget {
  const SuggestionScreen({Key? key}) : super(key: key);

  @override
  State<SuggestionScreen> createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  late TextEditingController _suggestionTextController;
  final GlobalKey<FormState> _suggestionFormFieldKey = GlobalKey<FormState>();

  @override
  void initState() {
    _suggestionTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Suggestion',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true, //TODO: define in app theme
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 20),
            SvgPicture.asset(
              'assets/svg_images/Document-edit.svg',
              color: Colors.green, //TODO: experiment with theme color
              height: 150,
              width: 150,
            ), //TODO: try to search for svg implementation from rada app
            const SizedBox(height: 20),
            Form(
              key: _suggestionFormFieldKey,
              child: CESAAMTextFormField(
                textController: _suggestionTextController,
                formFieldText: 'Brief Description',
                formIcon: Icons.edit_outlined,
                maxNumberOfLines: 10,
              ),
            ),
            const SizedBox(height: 20),
            CESAAMButton(
              buttonText: 'Continue',
              buttonFunction: () async {
                await showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => const ResponseConsentDialog());
                showSubmissionStatus(context, 'Submission Status message');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _suggestionTextController.dispose();
    super.dispose();
  }
}
