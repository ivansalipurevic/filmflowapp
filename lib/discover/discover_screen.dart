import 'package:filmflowapp/widgets/custom_button_nav.dart';
import 'package:flutter/material.dart';
import 'package:filmflowapp/themes/app_theme.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Container(
            color: AppColors.imdbYellow,
            padding: const EdgeInsets.only(top: 50, bottom: 20, left: 16), 
            width: double.infinity,
            alignment: Alignment.topLeft, 
            child: const Text(
              'Discover',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: AppColors.black,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Discover Content goes here',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
