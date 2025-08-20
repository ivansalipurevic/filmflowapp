import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingInitial());

  Future<void> fetchReviews(int movieId) async {
    emit(RatingLoading());

    const token =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMzYxYTM1NGJkMmE4YTllNzQ2YmFhMDJmNWE1YzQ1NCIsIm5iZiI6MTc1NDY0MjQwMC42NTIsInN1YiI6IjY4OTViN2UwYzZlZmI5ODU5ODA3Y2E0OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FQ2fx30w-_MJjRZ7H7tOshzhkbfI5pKyIcDLSXZFEQc';

    final url = 'https://api.themoviedb.org/3/movie/$movieId/reviews';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json;charset=utf-8',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['results'] as List<dynamic>;

        final reviews = results.map<Map<String, dynamic>>((review) {
          return {
            'author': review['author'] ?? 'Unknown',
            'content': review['content'] ?? '',
          };
        }).toList();

        emit(RatingLoaded(reviews));
      } else {
        emit(RatingError('Failed to load reviews: ${response.statusCode}'));
      }
    } catch (e) {
      emit(RatingError('Error fetching reviews: $e'));
    }
  }
}
