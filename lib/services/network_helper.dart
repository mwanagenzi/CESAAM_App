import 'dart:convert';

import 'package:ceesam_app/models/feedback_details.dart';
import 'package:ceesam_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkHelper {
  static Future<Map<String, dynamic>> submitFeedback(
      FeedbackDetails feedbackDetails) async {
    debugPrint("Feedback details : ${feedbackDetails.toJson()}");
    final response = await post(
        Uri.parse("${AppConstants.BASE_URL}/api/feedback"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(feedbackDetails.toJson()));

    debugPrint("Response details before status code: $response");
    debugPrint("Response code before status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      debugPrint("Response Body: ${jsonDecode(response.body)}");
      debugPrint("Response Body undecoded: ${response.body}");
      return jsonDecode(response.body);
    } else {
      debugPrint("Status code  of failed call: ${response.statusCode}");
      debugPrint("Response Body of failed call: ${jsonDecode(response.body)}");
      debugPrint("Response Body undecoded of failed call: ${response.body}");
      return jsonDecode(response.body);
    }
  }
}
