import 'package:app_gemin_ai/pages/auth/login_page.dart';
import 'package:app_gemin_ai/pages/auth/signup_page.dart';
import 'package:app_gemin_ai/singleton/startup/on_boarding.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) =>
          makeRoute(context: context, routeName: settings.name!, arguments: settings.arguments),
    );
  }

  static makeRoute({
    required BuildContext context,
    required String routeName,
    Object? arguments,
  }) {
    switch (routeName) {
      case login:
        return const LoginPage();
      case signup:
        return const SignupPage();
      case onBoading:
        return const Onboarding();
      default:
        throw 'Route  $routeName is not define';
    }
  }

  // define named Routes
  static const String login = '/';
  static const String signup = '/signup-login';
  static const String onBoading = '/on_boading';
}
