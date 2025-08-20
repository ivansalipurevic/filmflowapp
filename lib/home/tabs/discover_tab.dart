import 'package:filmflowapp/home/tabs/home_tab/cubit/home_cubit.dart';
import 'package:filmflowapp/home/tabs/home_tab/models/movie.dart';
import 'package:filmflowapp/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverTab extends StatefulWidget {
  const DiscoverTab({super.key});

  @override
  State<DiscoverTab> createState() => _DiscoverTabState();
}

class _DiscoverTabState extends State<DiscoverTab> {
  final List<String> filters = ['Videos', 'TV Shows', 'Streamings', 'News'];
  int selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Discover',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: AppColors.imdbYellow,
      ),
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
                  selectedColor: AppColors.imdbYellow,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: selectedFilter == index
                        ? Colors.white
                        : AppColors.imdbYellow,
                    fontWeight: FontWeight.bold,
                  ),
                  onSelected: (bool selected) {
                    setState(() {
                      selectedFilter = index;
                    });
                  },
                  showCheckmark: false,
                );
              }),
            ),
          ),

          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.error != null) {
                  return Center(child: Text('Error: ${state.error}'));
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      buildSection(
                        'Most Watched Trailers',
                        state.popularMovies,
                      ),
                      buildSection('Top Rated Movies', state.topRatedMovies),
                      buildSection(
                        'Most Upcoming Movies',
                        state.upcomingMovies,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSection(String title, List<Movie> movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                'See More',
                style: TextStyle(
                  color: AppColors.imdbYellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Container(
                width: 120,
                margin: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: movie.posterPath != null
                          ? Image.network(
                              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                              height: 140,
                              width: 120,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              height: 140,
                              width: 120,
                              color: Colors.grey,
                              child: const Icon(Icons.movie, size: 70),
                            ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      movie.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
