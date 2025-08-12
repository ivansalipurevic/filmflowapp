import 'package:flutter/material.dart';
import 'package:filmflowapp/themes/app_theme.dart';

class IMDbSignUpScreen extends StatefulWidget {
  const IMDbSignUpScreen({Key? key}) : super(key: key);

  @override
  State<IMDbSignUpScreen> createState() => _IMDbSignUpScreenState();
}

class _IMDbSignUpScreenState extends State<IMDbSignUpScreen> {
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
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Sign up',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(height: 20),
          _buildInputField(label: 'Username'),
          const SizedBox(height: 10),
          _buildInputField(label: 'Email'),
          const SizedBox(height: 10),
          _buildInputField(label: 'Password', obscure: true),
          const SizedBox(height: 10),
          _buildInputField(label: 'Confirm Password', obscure: true),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
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
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Material(
              color: AppColors.imdbYellow,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {},
                child: const SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Expanded(
                  child: Material(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {},
                      child: const SizedBox(
                        height: 45,
                        child: Center(
                          child: Text(
                            'Sign up with Google',
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                Expanded(
                  child: Material(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {},
                      child: const SizedBox(
                        height: 45,
                        child: Center(
                          child: Text(
                            'Sign up with Facebook',
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: const [
                Expanded(child: Divider(color: Colors.black45)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Already have an Account?'),
                ),
                Expanded(child: Divider(color: Colors.black45)),
              ],
            ),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Material(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.pop(context);
                },
                child: const SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
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

  Widget _buildInputField({required String label, bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon: obscure ? const Icon(Icons.visibility) : null,
        ),
      ),
    );
  }
}
