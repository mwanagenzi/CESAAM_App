import 'package:ceesam_app/provider/feedback_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EUNCCUDropdownFormField extends StatefulWidget {
  final List<DropdownMenuItem<String>> dropdownItems;
  final String labelText;
  final IconData formFieldIcon;
  late String dropdownValue = dropdownItems.first.value!;
  bool? isEnabled;

  EUNCCUDropdownFormField({
    Key? key,
    required this.dropdownItems,
    required this.labelText,
    required this.formFieldIcon,
    this.isEnabled,
  }) : super(key: key);

  String get currentDropDownValue => dropdownValue;

  @override
  State<EUNCCUDropdownFormField> createState() =>
      _EUNCCUDropdownFormFieldState();
}

class _EUNCCUDropdownFormFieldState extends State<EUNCCUDropdownFormField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FeedbackScreenProvider>(
      builder: (context, feedbackScreenProvider, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: DropdownButtonFormField(
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
            labelStyle: Theme.of(context).textTheme.bodyText2,
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
