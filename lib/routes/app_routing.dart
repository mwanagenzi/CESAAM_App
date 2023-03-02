import 'package:ceesam_app/provider/feedback_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/screens.dart';
import 'app_routes.dart';

Route<dynamic> generateAppRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.welcome:
      return MaterialPageRoute(builder: (context) => const WelcomeScreen());
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case AppRoutes.feedback:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => FeedbackScreenProvider(),
          child: const FeedbackDetailsScreen(),
        ),
      );
    case AppRoutes.suggestion:
      return MaterialPageRoute(builder: (context) => const SuggestionScreen());
    case AppRoutes.compliment:
      return MaterialPageRoute(builder: (context) => const ComplimentScreen());
    case AppRoutes.submissionStatus:
      return MaterialPageRoute(
          builder: (context) => const SubmissionStatusScreen());
    case AppRoutes.aboutUs:
      return MaterialPageRoute(builder: (context) => const AboutUsScreen());
    case AppRoutes.contactUs:
      return MaterialPageRoute(builder: (context) => const ContactUsScreen());
    case AppRoutes.developer:
      return MaterialPageRoute(builder: (context) => const DeveloperScreen());
    default:
      return MaterialPageRoute(builder: (context) => const WelcomeScreen());
  }
}
