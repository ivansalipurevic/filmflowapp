import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmflowapp/2_application/sign_up/sign_up_cubit.dart';
import 'package:filmflowapp/feuatures/signup_screen.dart';
import 'package:filmflowapp/notification/notification_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String signup = '/signup';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    const String apiKey = 'd361a354bd2a8a9e746baa02f5a5c454';

    return {
      signup: (context) => BlocProvider(
        create: (_) => SignUpCubit(apiKey: apiKey),
        child: const SignUpScreen(),
      ),
      home: (context) => const HomeScreen(),
    };
  }
}