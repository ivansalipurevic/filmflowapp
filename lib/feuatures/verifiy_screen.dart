import 'package:flutter/material.dart';
import 'package:filmflowapp/themes/app_theme.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Verify email address',
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'To verify your email, We have sent a one Time Password \n'
                    '(OTP) to abc123@gmail.com',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter OTP here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Continue Button using Material + InkWell
                  Material(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {},
                      child: const SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Resend OTP'),
                  ),

                  const SizedBox(height: 48),

                  Row(
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
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
