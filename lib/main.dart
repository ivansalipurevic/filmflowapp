import 'package:filmflowapp/2_application/sign_up/sign_up_cubit.dart';
import 'package:filmflowapp/discover/discover_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmflowapp/feuatures/signup_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        apiKey: 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMzYxYTM1NGJkMmE4YTllNzQ2YmFhMDJmNWE1YzQ1NCIsIm5iZiI6MTc1NDY0MjQwMC42NTIsInN1YiI6IjY4OTViN2UwYzZlZmI5ODU5ODA3Y2E0OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FQ2fx30w-_MJjRZ7H7tOshzhkbfI5pKyIcDLSXZFEQc', 
      ),
      child: MaterialApp(
        title: 'IMDb Login',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF5C518)),
          useMaterial3: true,
        ),
        home: const DiscoverScreen(),
      ),
    );
  }
}
