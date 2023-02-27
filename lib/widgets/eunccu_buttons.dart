import 'package:flutter/material.dart';

class EUNCCUClearButton extends StatelessWidget {
  String buttonText;
  void Function() buttonFunction;

  EUNCCUClearButton({
    Key? key,
    required this.buttonText,
    required this.buttonFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ListTile(
        onTap: buttonFunction,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: Color(0xff2B8B23), width: 2.0)),
        tileColor: Colors.white, //TODO: Change to match theme colour
        title: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black), //TODO: define text style in theme
          ),
        ),
      ),
    );
  }
}

class EUNCCUFilledButton extends StatelessWidget {
  String buttonText;
  void Function() buttonFunction;

  EUNCCUFilledButton({
    Key? key,
    required this.buttonText,
    required this.buttonFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: ListTile(
        onTap: buttonFunction, //TODO: Navigate to onboarding screen
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: Colors.white)),
        tileColor: const Color(0xff2B8B23), //TODO: Change to match theme colour
        title: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
