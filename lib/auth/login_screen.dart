import 'package:filmflowapp/auth_service.dart';
import 'package:filmflowapp/core/constants/app_text_styles.dart';
import 'package:filmflowapp/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:filmflowapp/themes/app_theme.dart';

import 'forgot_password.dart';
import 'signup_screen.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmflowapp/auth/cubit/auth_cubit.dart';
import 'package:filmflowapp/auth/cubit/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (AuthService().currentUser != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }

        if (state.isSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: AppColors.imdbYellow,
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    'IMDb',
                    style: TextStyle(
                      fontFamily: 'Impact',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text('Sign in', style: AppTextStyles.appBarTitle),
                const SizedBox(height: 20),

                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (val) {
                              setState(() {
                                rememberMe = val ?? false;
                              });
                            },
                          ),
                          const Text(
                            'Remember Me',
                            style: AppTextStyles.listTileTitle,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: AppColors.black,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Material(
                    color: AppColors.imdbYellow,
                    borderRadius: BorderRadius.circular(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: state.isLoading
                          ? null
                          : () {
                              final email = emailController.text.trim();
                              final password = passwordController.text.trim();

                              if (email.isEmpty || password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Email and Password cannot be empty!'),
                                  ),
                                );
                                return;
                              }

                              context
                                  .read<AuthCubit>()
                                  .loginWithEmailAndPassword(email, password);
                            },
                      child: SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: Center(
                          child: state.isLoading
                              ? const CircularProgressIndicator(
                                  color: AppColors.black,
                                )
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: const [
                      Expanded(child: Divider(color: AppColors.black)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'New to IMDb?',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: AppColors.black)),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Material(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      child: const SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Conditions of Use',
                        style: TextStyle(fontSize: 12, color: AppColors.grey),
                      ),
                      Text(
                        'Privacy Notice',
                        style: TextStyle(fontSize: 12, color: AppColors.grey),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
