// import 'package:emojis/emojis.dart';
// import 'package:eunccu_app/controller/firebase_repository.dart';
// import 'package:eunccu_app/models/feedback_details.dart';
// import 'package:eunccu_app/utils/validators/field_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';

// import 'widgets/widgets.dart';

// const List<DropdownMenuItem<String>> feedbackItems = [
//   DropdownMenuItem(value: 'Suggestion', child: Text('Suggestion')),
//   DropdownMenuItem(value: 'Compliment', child: Text('Compliment')),
//   DropdownMenuItem(value: 'Complaint', child: Text('Complaint')),
// ];

// class FeedbackDetailsScreen extends StatefulWidget {
//   const FeedbackDetailsScreen({Key? key}) : super(key: key);

//   @override
//   State<FeedbackDetailsScreen> createState() => _FeedbackDetailsScreenState();
// }

// class _FeedbackDetailsScreenState extends State<FeedbackDetailsScreen> {
//   late TextEditingController _descriptionTextController;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     _descriptionTextController = TextEditingController();
//     super.initState();
//   }

//   void clearTextField() => _descriptionTextController.clear();

//   @override
//   void dispose() {
//     _descriptionTextController.dispose();
//     super.dispose();
//   }

//   final _feedbackDropdown = EUNCCUDropdownFormField(
//     dropdownItems: feedbackItems,
//     labelText: 'Feedback Type',
//     formFieldIcon: Icons.feedback_outlined,
//   );

//   @override
//   Widget build(BuildContext context) {
//     final repository = Provider.of<FirebaseRepository>(context, listen: false);

//     Future<void> _sendFeedback() async {
//       if (_formKey.currentState!.validate()) {
//         final feedback = FeedbackDetails(
//             type: _feedbackDropdown.currentDropDownValue,
//             description: _descriptionTextController.text);
//         await repository.submitFeedback(feedback);
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Feedback',
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             SvgPicture.asset(
//               'assets/svg_images/feedback_icon.svg',
//               color: Colors.black,
//               height: 200,
//               width: 200,
//             ),
//             Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   _feedbackDropdown,
//                   const SizedBox(height: 20),
//                   EUNCCUTextFormField(
//                     textController: _descriptionTextController,
//                     formFieldText: 'Give a brief description',
//                     formIcon: Icons.description_outlined,
//                     numberOfLines: 10,
//                     fieldValidator: FieldValidator.textValidator,
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//             EUNCCUFilledButton(
//               buttonText: "SUBMIT",
//               buttonFunction: () async {
//                 await _sendFeedback();
//                 showDialog(
//                   context: context,
//                   builder: (_) => ReponseAlertDialog(
//                       message:
//                           'Your feedback has been submitted. Thank you.${Emojis.thumbsUp}'),
//                 );
//                 clearTextField();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


