import 'package:filmflowapp/home/tabs/home_tab/models/movie.dart';
import 'package:filmflowapp/movie_details/cubit/movie_details_cubit.dart';
import 'package:filmflowapp/movie_details/cubit/movie_details_state.dart';
import 'package:filmflowapp/movie_details/repository/movie_details_repository.dart';
import 'package:filmflowapp/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;
  final List<Movie> recommendedMovies;

  const MovieDetailsScreen({
    super.key,
    required this.movieId,
    required this.recommendedMovies,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailsCubit>().fetchMovieDetails(widget.movieId);
  }

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
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailsError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is MovieDetailsLoaded) {
            final movie = state.movieDetails;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      width: double.infinity,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 16),

                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      movie.title ?? 'No title available',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      movie.overview ?? 'No overview available.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Top 10 Movies for You',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.recommendedMovies.length,
                      itemBuilder: (context, index) {
                        final recommendedMovie = widget.recommendedMovies[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                  create: (_) => MovieDetailsCubit(MovieDetailsRepository()),
                                  child: MovieDetailsScreen(
                                    movieId: recommendedMovie.id,
                                    recommendedMovies: widget.recommendedMovies,
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
                                  child: recommendedMovie.posterPath != null
                                      ? Image.network(
                                          'https://image.tmdb.org/t/p/w500${recommendedMovie.posterPath}',
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
                                  recommendedMovie.title,
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

                  const SizedBox(height: 24),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
