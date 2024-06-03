import 'dart:convert';

import 'package:ceesam_app/models/feedback_details.dart';
import 'package:ceesam_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkHelper {
  static Future<Map<String, dynamic>> submitFeedback(
      FeedbackDetails feedback) async {
    final response = await post(
        Uri.parse("${AppConstants.BASE_URL}/api/feedback"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(feedback.toJson()));

    debugPrint("Response details: $response");

    if (response.statusCode == 200) {
      debugPrint("Response details: ${response.body}");
      return jsonDecode(response.body);
    } else {
      debugPrint("Response details: ${response.body}");
      return jsonDecode(response.body);
    }
  }
}
