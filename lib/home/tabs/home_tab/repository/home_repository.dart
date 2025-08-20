import 'dart:convert';


import 'package:filmflowapp/home/tabs/home_tab/models/movie.dart';
import 'package:http/http.dart' as http;

class HomeRepository{
  final String apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMzYxYTM1NGJkMmE4YTllNzQ2YmFhMDJmNWE1YzQ1NCIsIm5iZiI6MTc1NDY0MjQwMC42NTIsInN1YiI6IjY4OTViN2UwYzZlZmI5ODU5ODA3Y2E0OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FQ2fx30w-_MJjRZ7H7tOshzhkbfI5pKyIcDLSXZFEQc';
      Future<List<Movie>> getMovies(String type) async {
    final url =
        'https://api.themoviedb.org/3/movie/$type?language=en-US&page=2';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $apiKey'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList();
    } else {
      throw Exception('Failed to load $type movies');
    }
  }
}