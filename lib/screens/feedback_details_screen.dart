import 'package:ceesam_app/provider/feedback_screen_provider.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../utils/validators/field_validator.dart';
import '../widgets/widgets.dart';

const List<DropdownMenuItem<String>> feedbackItems = [
  DropdownMenuItem(value: 'Suggestion', child: Text('Suggestion')),
  DropdownMenuItem(value: 'Compliment', child: Text('Compliment')),
  DropdownMenuItem(value: 'Complaint', child: Text('Complaint')),
];

class FeedbackDetailsScreen extends StatefulWidget {
  const FeedbackDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackDetailsScreen> createState() => _FeedbackDetailsScreenState();
}

class _FeedbackDetailsScreenState extends State<FeedbackDetailsScreen> {
  late TextEditingController _descriptionTextController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double _rating = 1;

  @override
  void initState() {
    _descriptionTextController = TextEditingController();
    super.initState();
  }

  void clearTextField() => _descriptionTextController.clear();

  @override
  void dispose() {
    _descriptionTextController.dispose();
    super.dispose();
  }

  final _feedbackDropdown = EUNCCUDropdownFormField(
    dropdownItems: feedbackItems,
    labelText: 'Feedback Type',
    formFieldIcon: Icons.feedback_outlined,
  );

  @override
  Widget build(BuildContext context) {
    // final repository = Provider.of<FirebaseRepository>(context, listen: false);

    // Future<void> _sendFeedback() async {
    //   if (_formKey.currentState!.validate()) {
    //     final feedback = FeedbackDetails(
    //         type: _feedbackDropdown.currentDropDownValue,
    //         description: _descriptionTextController.text);
    //     await repository.submitFeedback(feedback);
    //   }
    // }
    return Consumer<FeedbackScreenProvider>(
      builder: (context, feedbackScreenProvider, _) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Feedback',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Image(
                  image:
                      AssetImage('assets/png_images/welcome_feedback_png.png'),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _feedbackDropdown,
                      const SizedBox(height: 20),
                      EUNCCUTextFormField(
                        textController: _descriptionTextController,
                        formFieldText: 'Give a brief description',
                        formIcon: Icons.description_outlined,
                        numberOfLines: 10,
                        fieldValidator: FieldValidator.textValidator,
                      ),
                      const SizedBox(height: 20),
                      buildFeedbackDescriptionWidgets(
                          feedbackScreenProvider.dropdownValue == 'Complaint'),
                    ],
                  ),
                ),
                EUNCCUFilledButton(
                  buttonText: "SUBMIT",
                  buttonFunction: () async {
                    // await _sendFeedback();
                    showDialog(
                      context: context,
                      builder: (_) => ReponseAlertDialog(
                          message:
                              'Your feedback has been submitted. Thank you.${Emojis.thumbsUp}'),
                    );
                    clearTextField();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //todo: implement provider to handle desired state changes
  Widget buildFeedbackDescriptionWidgets(bool isComplaint) {
    return isComplaint
        ? Column(
            children: [
              const Text(
                  'How would you rate the urgency in \n addressing your complaint?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(height: 10),
              Text(
                'Rating $_rating',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xFF1C623B), width: 0),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        direction: Axis.vertical,
                        itemCount: 4,
                        maxRating: 4.0,
                        minRating: 1.0,
                        initialRating: 1.0,
                        itemBuilder: (context, index) {
                          switch (index) {
                            case 0:
                              return const Icon(
                                Icons.sentiment_very_satisfied,
                                color: Colors.green,
                              );
                            case 1:
                              return const Icon(
                                Icons.sentiment_neutral,
                                color: Colors.yellow,
                              );
                            case 2:
                              return Icon(
                                Icons.sentiment_dissatisfied_outlined,
                                color: Colors.orange[700],
                              );
                            case 3:
                              return const Icon(
                                Icons.sentiment_very_dissatisfied_outlined,
                                color: Colors.red,
                              );
                            default:
                              return const Icon(
                                Icons.pinch_outlined,
                                color: Colors.green,
                              );
                          }
                        },
                        onRatingUpdate: (newRating) {
                          setState(() {
                            _rating = newRating;
                          });
                        },
                        updateOnDrag: true,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          RatingDescriptionText(
                              ratingTitle: '1. Minor',
                              ratingDescription: 'just a little tweak'),
                          RatingDescriptionText(
                            ratingTitle: '2. Significant',
                            ratingDescription: 'keenly look at it',
                          ),
                          RatingDescriptionText(
                            ratingTitle: '3. Major',
                            ratingDescription: 'as soon as possible',
                          ),
                          RatingDescriptionText(
                            ratingTitle: '4. Vital',
                            ratingDescription: 'Now!',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          )
        : const SizedBox(
            height: 20,
          );
  }
}

class RatingDescriptionText extends StatelessWidget {
  final String _ratingTitle;
  final String _ratingDescription;

  const RatingDescriptionText({
    Key? key,
    required String ratingTitle,
    required String ratingDescription,
  })  : _ratingTitle = ratingTitle,
        _ratingDescription = ratingDescription,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            _ratingTitle,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            '($_ratingDescription)',
            style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

//TODO: edit to match design
