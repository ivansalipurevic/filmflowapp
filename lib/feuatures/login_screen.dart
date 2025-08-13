import 'package:flutter/material.dart';
import 'package:filmflowapp/themes/app_theme.dart';
import 'forgot_password.dart';
import 'signup_screen.dart';

class IMDbLoginScreen extends StatefulWidget {
  const IMDbLoginScreen({super.key});

  @override
  State<IMDbLoginScreen> createState() => _IMDbLoginScreenState();
}

class _IMDbLoginScreenState extends State<IMDbLoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
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
          const Text(
            'Sign in',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
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
                    const Text('Remember Me'),
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
                    style: TextStyle(color: AppColors.black),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Zamena ElevatedButton -> Material + InkWell (Login)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Material(
              color: AppColors.imdbYellow,
              borderRadius: BorderRadius.circular(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () {},
                child: const SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
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
                Expanded(child: Divider(color: Colors.black)),
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
                      builder: (context) => const IMDbSignUpScreen(),
                    ),
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
    );
  }
}
