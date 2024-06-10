import 'dart:convert';
import 'dart:io';

import 'package:ceesam_app/models/feedback_details.dart';
import 'package:ceesam_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkHelper {
  static Future<Map<String, dynamic>> submitFeedback(
      FeedbackDetails feedbackDetails) async {
    try {
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
        debugPrint(
            "Response Body of failed call: ${jsonDecode(response.body)}");
        debugPrint("Response Body undecoded of failed call: ${response.body}");

        return {
          "success": false,
          "message":
              "Error in uploading your feedback. Try again later or contact admin for support"
        };
        // return jsonDecode(response.body);
      }
    } on HttpException catch (e) {
      //error dialog
      debugPrint("Socket Exception");
      return <String, dynamic>{'message': "HTTP Exception ${e.message}"};
    } on SocketException {
      //error dialog
      debugPrint("Socket Exception");
      return <String, dynamic>{'message': "Check your internet connection"};
    } on FormatException catch (e) {
      //error dialog
      debugPrint("Format Exception ${e.message}");
      return <String, dynamic>{'message': e.message};
    } catch (e) {
      debugPrint("Unknown Exception : ${e.toString()}");
      return <String, dynamic>{
        'message': "Error in uploading your feedback. Contact admin for support"
      };
    }
  }
}
