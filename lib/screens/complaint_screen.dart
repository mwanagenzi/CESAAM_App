import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/widgets.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  late TextEditingController _complaintTextController;
  final GlobalKey<FormState> _complaintFormFieldKey = GlobalKey<FormState>();

  @override
  void initState() {
    _complaintTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Complaint',
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
                'assets/svg_images/Thumb-down.svg',
                color: Colors.green, //TODO: experiment with theme color
                height: 150,
                width: 150,
              ), //TODO: try to search for svg implementation from rada app
              const SizedBox(height: 20),
              Form(
                key: _complaintFormFieldKey,
                child: FeedbackFormField(
                  suggestionTextController: _complaintTextController,
                  formFieldText: 'Brief Description of your complaint',
                  formIcon: Icons.edit_outlined,
                ),
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
    _complaintTextController.dispose();
    super.dispose();
  }
}

//TODO: edit to match design
