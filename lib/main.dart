import 'package:filmflowapp/discover/discover_screen.dart';
import 'package:filmflowapp/feuatures/login_screen.dart';
import 'package:filmflowapp/feuatures/reset_password.dart';
import 'package:filmflowapp/home/home_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMDb Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF5C518)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
