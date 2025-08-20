import 'package:filmflowapp/auth/cubit/auth_cubit.dart';
import 'package:filmflowapp/auth_service.dart';
import 'package:filmflowapp/auth/login_screen.dart';

import 'package:filmflowapp/firebase_options.dart';

import 'package:filmflowapp/home/tabs/home_tab/cubit/home_cubit.dart';
import 'package:filmflowapp/home/tabs/home_tab/repository/home_repository.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(AuthService())),
        BlocProvider(create: (context) => HomeCubit(HomeRepository())..fetchMovies()),
      ],
      child: MaterialApp(
        title: 'IMDb Login',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF5C518)),
          useMaterial3: true,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
