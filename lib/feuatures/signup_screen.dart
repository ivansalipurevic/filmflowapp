import 'package:flutter/material.dart';
import 'package:filmflowapp/themes/app_theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class IMDbSignUpScreen extends StatefulWidget {
  const IMDbSignUpScreen({super.key});

  @override
  State<IMDbSignUpScreen> createState() => _IMDbSignUpScreenState();
}

class _IMDbSignUpScreenState extends State<IMDbSignUpScreen> {
  bool rememberMe = false;
  final String apiKey = '342455135665dbab055a0323ea3e9a77';

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
                onTap: signUpWithTMDb, 
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

  Future<String> createRequestToken() async {
    final response = await http.get(
      Uri.parse(
        'https://api.themoviedb.org/3/authentication/token/new?api_key=$apiKey',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['request_token'];
    } else {
      throw Exception('Failed to create request token');
    }
  }

  Future<void> signUpWithTMDb() async {
    try {
      final token = await createRequestToken();
      print('Request token: $token'); 

      final url = Uri.parse(
        'https://www.themoviedb.org/authenticate/$token/allow',
      );

      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('fail: $e')));
    }
  }
}
