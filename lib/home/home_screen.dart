import 'package:filmflowapp/home/tabs/browser_tab.dart';
import 'package:filmflowapp/home/tabs/discover_tab.dart';
import 'package:filmflowapp/home/tabs/home_tab/home_tab.dart';
import 'package:filmflowapp/home/tabs/profile_tab.dart';
import 'package:filmflowapp/home/tabs/home_tab/cubit/home_cubit.dart';

import 'package:filmflowapp/widgets/custom_button_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: IndexedStack(
                children: [
                  HomeTab(),
                  BrowserTab(),
                  DiscoverTab(),

                  ProfileTab(movieId: 175),
                ],
                index: _selectedIndex,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
