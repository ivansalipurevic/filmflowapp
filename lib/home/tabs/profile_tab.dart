import 'package:filmflowapp/movie_details/cast_screen.dart';
import 'package:filmflowapp/rating/rating_screen.dart';
import 'package:filmflowapp/rating/cubit/rating_cubit.dart';
import 'package:flutter/material.dart';
import 'package:filmflowapp/themes/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTab extends StatefulWidget {
  final int movieId;

  const ProfileTab({super.key, required this.movieId});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final List<String> filters = ['Rating', 'Guide', 'Awards', 'Cast'];
  int selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(filters.length, (index) {
                return ChoiceChip(
                  label: Text(filters[index]),
                  selected: selectedFilter == index,
                  selectedColor: AppColors.grey,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: selectedFilter == index
                        ? Colors.white
                        : AppColors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  onSelected: (bool selected) {
                    setState(() {
                      selectedFilter = index;
                    });

                    if (filters[index] == 'Cast') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CastScreen(movieId: widget.movieId),
                        ),
                      );
                    } else if (filters[index] == 'Rating') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (_) => RatingCubit(),
                            child: RatingScreen(movieId: widget.movieId),
                          ),
                        ),
                      );
                    }
                  },
                  showCheckmark: false,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
