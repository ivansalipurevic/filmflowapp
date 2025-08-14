import 'package:filmflowapp/discover/discover_screen.dart';
import 'package:filmflowapp/home/home_screen.dart';
import 'package:filmflowapp/watchlist/my_account_screen.dart';
import 'package:flutter/material.dart';

import 'package:filmflowapp/widgets/custom_button_nav.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;


  final List<Widget> _screens = const [
    HomeScreen(),        
    DiscoverScreen(),    
    MyProfileScreen(),   
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
