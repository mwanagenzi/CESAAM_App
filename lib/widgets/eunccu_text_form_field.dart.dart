import 'package:flutter/material.dart';

class EUNCCUTextFormField extends StatelessWidget {
  EUNCCUTextFormField({
    required TextEditingController textController,
    required String formFieldText,
    required IconData formIcon,
    TextInputType? textInputType,
    int? numberOfLines,
    String? Function(String?)? fieldValidator,
  })  : _textController = textController,
        _formFieldText = formFieldText,
        _formIcon = formIcon,
        _textInputType = textInputType,
        _fieldValidator = fieldValidator,
        _numberOfLines = numberOfLines;

  final TextEditingController _textController;
  final String _formFieldText;
  final IconData _formIcon;
  final TextInputType? _textInputType;
  final int? _numberOfLines;
  final String? Function(String?)? _fieldValidator;//todo: make function required for all form fields

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        keyboardType: _textInputType ?? TextInputType.text,
        maxLines: _numberOfLines ?? 1,
        controller: _textController,
        cursorColor: Colors.black,
        validator: _fieldValidator, //TODO: set individual validators
        decoration: InputDecoration(
          labelText: _formFieldText,
          labelStyle: Theme.of(context).textTheme.labelMedium,
          prefixIcon: Icon(
            _formIcon,
            color: Colors.black,
          ),
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
