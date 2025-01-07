import 'package:app_gemin_ai/pages/auth/login_page.dart';
import 'package:app_gemin_ai/pages/auth/signup_page.dart';
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
      default:
        throw 'Route  $routeName is not define';
    }
  }

  // define named Routes
  static const String login = '/';
  static const String signup = '/signup-login';
}
