import 'package:ceesam_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuggestionScreen extends StatefulWidget {
  const SuggestionScreen({Key? key}) : super(key: key);

  @override
  State<SuggestionScreen> createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  late TextEditingController _suggestionTextController;
  GlobalKey<FormState> _suggestionFormFieldKey = GlobalKey<FormState>();

  @override
  void initState() {
    _suggestionTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Suggestion',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true, //TODO: define in app theme
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(maxRadius: 100,
              child: SvgPicture.asset(
                'assets/svg_images/information 1.svg',
                fit: BoxFit.fill,
              ),
            ), //TODO: try to search for svg implementation from rada app
            FeedbackFormField(
              suggestionTextController: _suggestionTextController,
              formFieldText: 'Brief Description',
              formIcon: Icons.edit_outlined,
            ),
            CESAAMButton(
              buttonText: 'Continue',
              buttonFunction: () {}, //TODO; pop up the response consent dialog
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _suggestionTextController.dispose();
    super.dispose();
  }
}

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
    return TextFormField(
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
          // borderSide: BorderSide(
          //     color: Colors.green, width: 3, style: BorderStyle.solid),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
