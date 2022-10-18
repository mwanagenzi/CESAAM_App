import 'package:flutter/material.dart';

class CESAAMButton extends StatelessWidget {
  final String buttonText;
  final void Function() buttonFunction;

  const CESAAMButton({
    Key? key,
    required this.buttonText,
    required this.buttonFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ListTile(
        onTap: buttonFunction ,//TODO: Navigate to onboarding screen
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: Colors.white, width: 1.0)),
        tileColor: const Color(0xff1C623B), //TODO: Change to match theme colour
        title: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
