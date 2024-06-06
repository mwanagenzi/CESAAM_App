import 'package:flutter/material.dart';

class ReponseAlertDialog extends StatelessWidget {
  String message;
  ReponseAlertDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        message,
        softWrap: true,
        textAlign: TextAlign.justify,
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
