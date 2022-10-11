import 'package:ceesam_app/widgets/cesaam_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            CircleAvatar(
              radius: 125,
              backgroundColor: Colors.white,
              child: Image.asset('assets/png_images/welcome_feedback_png.png'),
            ),
            const Spacer(),
            const Text(
              'CESAAM Customer Review',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'For Quality Assurance, we would\n appreciate your feedback',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const Spacer(),
            CESAAMButton(
              buttonText: 'Continue',
              buttonFunction: () {}, //TODO: navigate to onboarding screen
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
