import 'package:cesaam_feedback_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.popAndPushNamed(context, AppRoutes.home),
    );

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
            const SpinKitFadingCircle(
              color: Colors.green,
              size: 70,
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
//TODO; set a timer to show this screen on app start to replace the "Continue" button
