import 'package:filmflowapp/movie_details/cubit/movie_details_state.dart';
import 'package:filmflowapp/movie_details/repository/movie_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsRepository repository;
  MovieDetailsCubit(this.repository) : super(MovieDetailsInitial());

  final String apiKey = 'd361a354bd2a8a9e746baa02f5a5c454';

  Future<void> fetchMovieDetails(int movieId) async {
    emit(MovieDetailsLoading());

    try {
      final result = await repository.fetchMovieDetails(movieId);
      if (result == null) {
        emit(MovieDetailsError('Error fetching movies: '));
      } else {
        emit(MovieDetailsLoaded(result));
      }
    } catch (e) {
      emit(MovieDetailsError('Error fetching movies: $e'));
    }
  }
}
