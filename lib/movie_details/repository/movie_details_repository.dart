import 'dart:convert';
import 'package:filmflowapp/movie_details/models/movie_details.dart';
import 'package:http/http.dart' as http;

class MovieDetailsRepository {
  Future<MovieDetails?> fetchMovieDetails(int movieId) async {
    final url = 'https://api.themoviedb.org/3/movie/$movieId?language=en-US';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMzYxYTM1NGJkMmE4YTllNzQ2YmFhMDJmNWE1YzQ1NCIsIm5iZiI6MTc1NDY0MjQwMC42NTIsInN1YiI6IjY4OTViN2UwYzZlZmI5ODU5ODA3Y2E0OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FQ2fx30w-_MJjRZ7H7tOshzhkbfI5pKyIcDLSXZFEQc',
          'Content-Type': 'application/json;charset=utf-8',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return MovieDetails.fromJson(data);
      } else {
        print('Failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetchMovieDetails: $e');
    }

    return null;
  }
}
