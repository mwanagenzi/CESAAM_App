import 'package:ceesam_app/widgets/cesaam_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubmissionStatusScreen extends StatelessWidget {
  const SubmissionStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Response Status',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: 
      //   Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     mainAxisSize: MainAxisSize.max,
      //     children: [
      //       SvgPicture.asset(
      //         'assets/svg_images/Button-circle-checked.svg',
      //         height: 100, //TODO:specify this as a global variable
      //         width: 100, //TODO:specify this as a global variable
      //         color: Colors.green,
      //       ),
      //       const Text(
      //         "Great! Your response has been\n submitted succesfully",
      //         style: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold,
      //         ),
      //         textAlign: TextAlign.center,
      //       ),
      //       CESAAMButton(
      //           buttonText: "Submit Another Response", buttonFunction: () {
      //             //TODO:Navigate to the home screen
      //           }),
      //           CESAAMButton(buttonText: "Exit", buttonFunction: (){
      //             //TODO:Navigate to home screen or onboarding screen
      //           })
      //     ],
      // ),
      Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/svg_images/Button-circle-warning.svg',
              height: 100, //TODO:specify this as a global variable
              width: 100, //TODO:specify this as a global variable
            color: Colors.red, //search for a better red color e.g luminous red
            ),
            const Text(
              "Aww no!\nWe encontered an error!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            CESAAMButton(
                buttonText: "Retry", buttonFunction: () {
                  //TODO:Navigate to the home screen
                }),
                CESAAMButton(buttonText: "Exit", buttonFunction: (){
                  //TODO:Navigate to home screen or onboarding screen
                })
          ],
      ),

    );
  }
}
//TODO: Think of modelling this as a dialog or snackbar for all the feedback screens