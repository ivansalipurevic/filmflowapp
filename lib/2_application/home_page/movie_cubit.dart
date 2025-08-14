import 'package:filmflowapp/2_application/home_page/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  final String apiKey = 'd361a354bd2a8a9e746baa02f5a5c454';

  Future<void> fetchMovies() async {
    emit(MovieLoading());
    final url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        emit(MovieLoaded(data['results']));
      } else {
        emit(MovieError('Failed to load movies'));
      }
    } catch (e) {
      emit(MovieError('Error fetching movies: $e'));
    }
  }
}
