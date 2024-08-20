import 'package:flutter/material.dart';

class ReponseErrorDialog extends StatelessWidget {
  String message;

  ReponseErrorDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Error!",
      ),
      content: Text(
        message,
        softWrap: true,
        textAlign: TextAlign.start,
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
