import 'package:cesaam_feedback_app/provider/feedback_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CESAAMDropdownFormField extends StatefulWidget {
  final List<DropdownMenuItem<String>> dropdownItems;
  final String labelText;
  final IconData formFieldIcon;
  late String dropdownValue = dropdownItems.first.value!;
  bool? isEnabled;

  CESAAMDropdownFormField({
    Key? key,
    required this.dropdownItems,
    required this.labelText,
    required this.formFieldIcon,
    this.isEnabled,
  }) : super(key: key);

  String get currentDropDownValue => dropdownValue;

  @override
  State<CESAAMDropdownFormField> createState() =>
      _CESAAMDropdownFormFieldState();
}

class _CESAAMDropdownFormFieldState extends State<CESAAMDropdownFormField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FeedbackScreenProvider>(
      builder: (context, feedbackScreenProvider, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: DropdownButtonFormField(
          dropdownColor: Colors.white,
          items: widget.dropdownItems,
          value: widget.dropdownValue,
          onChanged: (String? selectedValue) {
            setState(() {
              widget.dropdownValue = selectedValue!;
              feedbackScreenProvider.setDropdownValue(selectedValue);
            });
          },
          decoration: InputDecoration(
            enabled: widget.isEnabled ?? true,
            labelText: widget.labelText,
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            prefixIcon: Icon(
              widget.formFieldIcon,
              color: Colors.black,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
    );
  }
}
