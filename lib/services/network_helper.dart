import 'dart:convert';
import 'dart:io';

import 'package:cesaam_feedback_app/models/feedback_details.dart';
import 'package:cesaam_feedback_app/utils/constants.dart';
import 'package:http/http.dart';

class NetworkHelper {
  static Future<Map<String, dynamic>> submitFeedback(
      FeedbackDetails feedbackDetails) async {
    try {
      final response = await post(
          Uri.parse("${AppConstants.BASE_URL}/api/feedback"),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(feedbackDetails.toJson()));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          "success": false,
          "message":
              "Error in uploading your feedback. Try again later or contact admin for support"
        };
      }
    } on HttpException catch (e) {
      //error dialog
      return <String, dynamic>{'message': "HTTP Exception ${e.message}"};
    } on SocketException {
      //error dialog
      return <String, dynamic>{'message': "Check your internet connection"};
    } on FormatException catch (e) {
      //error dialog
      return <String, dynamic>{'message': e.message};
    } catch (e) {
      return <String, dynamic>{
        'message': "Error in uploading your feedback. Contact admin for support"
      };
    }
  }
}
