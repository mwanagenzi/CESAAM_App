import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/widgets.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  late TextEditingController _complaintTextController;
  final GlobalKey<FormState> _complaintFormFieldKey = GlobalKey<FormState>();
  double _rating = 1;

  @override
  void initState() {
    _complaintTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Complaint',
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
          children: [
            const SizedBox(height: 20),
            SvgPicture.asset(
              'assets/svg_images/Thumb-down.svg',
              color: Colors.green, //TODO: experiment with theme color
              height: 150,
              width: 150,
            ), //TODO: try to search for svg implementation from rada app
            const SizedBox(height: 20),
            Form(
              key: _complaintFormFieldKey,
              child: CESAAMTextFormField(
                textController: _complaintTextController,
                formFieldText: "Brief description",
                formIcon: Icons.edit_outlined,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'How would you rate the urgency in \n addressing your complaint?',
              textAlign: TextAlign.center,
              style:TextStyle(
                fontSize: 18,
                  fontWeight: FontWeight.w400,
              )
            ),
            const SizedBox(height: 10),
            Text(
              'Rating $_rating',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
            ),),
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
                      children: const[
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
            ), //TODO:capture this data to upload to db
            const SizedBox(height: 20),
            CESAAMButton(
              buttonText: 'Continue',
              buttonFunction:
                  () {}, //TODO; pop up the response consent dialog
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _complaintTextController.dispose();
    super.dispose();
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
