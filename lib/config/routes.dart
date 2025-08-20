import 'package:filmflowapp/auth_service.dart';
import 'package:filmflowapp/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmflowapp/auth/cubit/auth_cubit.dart';
import 'package:filmflowapp/auth/signup_screen.dart';

import 'package:flutter/material.dart';

class Routes {
  static const String signup = '/signup';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes() {

    return {
      signup: (context) => BlocProvider(
        create: (_) => AuthCubit(AuthService()),
        child:  SignUpScreen(),
      ),
      home: (context) => const HomeScreen(),
    };
  }
}