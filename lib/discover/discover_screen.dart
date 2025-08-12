import 'package:flutter/material.dart';
import 'package:filmflowapp/themes/app_theme.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: AppColors.imdbYellow,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Browser',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
