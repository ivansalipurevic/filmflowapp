import 'package:filmflowapp/home/tabs/home_tab/models/movie.dart';
import 'package:filmflowapp/home/tabs/home_tab/cubit/home_cubit.dart';
import 'package:filmflowapp/movie_details/cubit/movie_details_cubit.dart';
import 'package:filmflowapp/movie_details/movie_details_screen.dart';
import 'package:filmflowapp/movie_details/repository/movie_details_repository.dart';
import 'package:filmflowapp/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IMDb',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Impact',
          ),
        ),
        backgroundColor: AppColors.imdbYellow,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSection(
                  'Most Watched Trailers',
                  state.popularMovies,
                  state.topRatedMovies,
                ),
                buildSection(
                  'Top Rated Movies',
                  state.topRatedMovies,
                  state.topRatedMovies,
                ),
                buildSection(
                  'Most Upcoming Movies',
                  state.upcomingMovies,
                  state.topRatedMovies,
                ),
                const SizedBox(height: 13),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildSection(
    String title,
    List<Movie> movies,
    List<Movie> recommendedMovies,
  ) {
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
                  color: Colors.amber[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (_) =>
                            MovieDetailsCubit(MovieDetailsRepository()),
                        child: MovieDetailsScreen(
                          movieId: movie.id,
                          recommendedMovies: recommendedMovies,
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
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
                                height: 160,
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
