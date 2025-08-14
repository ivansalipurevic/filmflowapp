import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmflowapp/2_application/sign_up/sign_up_cubit.dart';
import 'package:filmflowapp/2_application/sign_up/sign_up_state.dart';
import 'package:filmflowapp/themes/app_theme.dart';
import 'package:filmflowapp/core/constants/app_text_styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
        if (state.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Request sent! Check your browser.')),
          );
        }
      },
      child: Scaffold(
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
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Sign up', style: AppTextStyles.appBarTitle),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: const [
                    Text('Remember Me', style: AppTextStyles.listTileTitle),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return Material(
                      color: AppColors.imdbYellow,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: state.isLoading
                            ? null
                            : () => context.read<SignUpCubit>().signUpWithTMDb(),
                        child: SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: Center(
                            child: state.isLoading
                                ? const CircularProgressIndicator(
                                    color: AppColors.black,
                                  )
                                : const Text(
                                    'Create Account',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Conditions of Use',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'Privacy Notice',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
