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
        body: feedbackDetails.toJson());

    debugPrint("Response details before status code: $response");

    if (response.statusCode == 200) {
      debugPrint("Response Body undecoded: ${response.body}");
      debugPrint("Response Body: ${jsonDecode(response.body)}");
      return jsonDecode(response.body);
    } else {
      debugPrint("Response Body undecoded: ${response.body}");
      debugPrint("Response Body: ${jsonDecode(response.body)}");
      return jsonDecode(response.body);
    }
  }
}
