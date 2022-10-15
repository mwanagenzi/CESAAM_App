import 'package:flutter/material.dart';

class FeedbackFormField extends StatelessWidget {
  const FeedbackFormField(
      {Key? key,
      required TextEditingController suggestionTextController,
      required String formFieldText,
      required IconData formIcon})
      : _suggestionTextController = suggestionTextController,
        _formIcon = formIcon,
        _formFieldText = formFieldText,
        super(key: key);

  final TextEditingController _suggestionTextController;
  final String _formFieldText;
  final IconData _formIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        minLines: 1,
        maxLines: 7,
        controller: _suggestionTextController,
        cursorColor: Colors.black,
        // validator: _emailValidator, //TODO: set individual validators
        decoration: InputDecoration(
          labelText: 'Description',
          labelStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.black),
          prefixIcon: Icon(
            _formIcon,
            color: Colors.black,
          ),
          // focusColor: const Color(0xFF2B8B23), //TODO: change in app theme
          focusColor: const Color(0xFF2B8B23), //TODO: App theme
          hintText: _formFieldText,
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
