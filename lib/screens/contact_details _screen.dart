import 'package:ceesam_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactDetailsScreen extends StatefulWidget {
  const ContactDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  late TextEditingController _fullNameTextController;
  late TextEditingController _phoneNumberTextController;
  late TextEditingController _emailTextController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _fullNameTextController = TextEditingController();
    _phoneNumberTextController = TextEditingController();
    _emailTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fullNameTextController.dispose();
    _phoneNumberTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Address',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/svg_images/profile_icon.svg',
              height: 200,
              width: 200,
            ),
            const Text(
              'Fill in your contact details',
              style: TextStyle(
              fontSize: 18,
              // color: Colors.grey, //TODO: replace with hint text color
            ),),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CESAAMTextFormField(
                    textController: _fullNameTextController,
                    formFieldText: "Full Name",
                    formIcon: Icons.edit_note_outlined,
                  ),
                  const SizedBox(height: 20),
                  CESAAMTextFormField(
                    textController: _phoneNumberTextController,
                    formFieldText: 'Phone Number',
                    formIcon: Icons.phone_outlined,
                    textInputType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                  CESAAMTextFormField(
                    textController: _emailTextController,
                    formFieldText: "Email Address",
                    formIcon: Icons.email_outlined,
                    textInputType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CESAAMButton(
                buttonText: "SUBMIT",
                buttonFunction: () {
                  //TODO: Submit details to db
                }),
          ],
        ),
      ),
    );
  }
}
