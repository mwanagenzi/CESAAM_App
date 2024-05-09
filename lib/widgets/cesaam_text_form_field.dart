import 'package:flutter/material.dart';

class CESAAMTextFormField extends StatelessWidget {
  const CESAAMTextFormField({super.key, 
    required TextEditingController textController,
    required String formFieldText,
    required IconData formIcon,
    TextInputType? textInputType,
    int? maxNumberOfLines,
  })  : _textController = textController,
        _formFieldText = formFieldText,
        _formIcon = formIcon,
        _textInputType = textInputType,
        _maxNumberOfLines = maxNumberOfLines;

  final TextEditingController _textController;
  final String _formFieldText;
  final IconData _formIcon;
  final TextInputType? _textInputType;
  final int? _maxNumberOfLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        keyboardType: _textInputType ?? TextInputType.text,
        maxLines: _maxNumberOfLines ?? 1,
        controller: _textController,
        cursorColor: Colors.black,
        // validator: _emailValidator, //TODO: set individual validators
        decoration: InputDecoration(
          labelText: _formFieldText,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          prefixIcon: Icon(
            _formIcon,
            color: Colors.black,
          ),
          // focusColor: const Color(0xFF2B8B23), //TODO: change in app theme
          focusColor: const Color(0xFF1C623B), //TODO: App theme
          hintText: _formFieldText,
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
