import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/widgets.dart';

class ComplimentScreen extends StatefulWidget {
  const ComplimentScreen({Key? key}) : super(key: key);

  @override
  State<ComplimentScreen> createState() => _ComplimentScreenState();
}

class _ComplimentScreenState extends State<ComplimentScreen> {
  late TextEditingController _complimentTextController;
  final GlobalKey<FormState> _complimentFormFieldKey = GlobalKey<FormState>();

  @override
  void initState() {
    _complimentTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Compliment',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true, //TODO: define in app theme
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.125),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(
                'assets/svg_images/Thumb-up.svg',
                color: Colors.green, //TODO: experiment with theme color
                height: 150,
                width: 150,
              ), //TODO: try to search for svg implementation from rada app
              const SizedBox(height: 20),
              Form(
                key: _complimentFormFieldKey,
                  child: CESAAMTextFormField(
                    textController: _complimentTextController,
                    formFieldText: 'Brief Description',
                    formIcon: Icons.edit_outlined,
                    numberOfLines: 7,
                  )
                
                // FeedbackFormField(
                //   suggestionTextController: _complimentTextController,
                //   formFieldText: 'Brief Description of your compliment',
                //   formIcon: Icons.edit_outlined,
                // ),
              ),
              const SizedBox(height: 20),
              CESAAMButton(
                buttonText: 'Continue',
                buttonFunction:
                    () {}, //TODO; pop up the response consent dialog
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _complimentTextController.dispose();
    super.dispose();
  }
}
