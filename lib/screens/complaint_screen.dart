import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                child: CESAAMTextFormField(
                  textController: _complaintTextController,
                  formFieldText: "Brief Description",
                  formIcon: Icons.edit_outlined,
                ),
              ),
              const SizedBox(height: 20),
              RatingBar.builder(
                itemCount: 4,
                maxRating: 4,
                minRating: 1,
                initialRating: 1,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return const Icon(
                          Icons.pinch_outlined,
                          color: Colors.green,
                        );
                      case 1:
                        return const Icon(
                          Icons.quickreply_rounded,
                          color: Colors.yellow,
                        );
                      case 2:
                        return Icon(
                          Icons.bolt_sharp,
                          color: Colors.orange[700],
                        );
                      case 3:
                        return const Icon(
                          Icons.priority_high,
                          color: Colors.red,
                        );
                      default:
                      return const Icon(
                          Icons.pinch_outlined,
                          color: Colors.green,
                        );
                    }
                  },
                  onRatingUpdate: (newRating) => print(newRating)),
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
