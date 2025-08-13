import 'package:filmflowapp/feuatures/signup_screen.dart';
import 'package:filmflowapp/notification/notification_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String signup = '/signup';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      signup: (context) => const IMDbSignUpScreen(),
      home: (context) => const HomeScreen(),
    };
  }
}
