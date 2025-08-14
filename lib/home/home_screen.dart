import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String apiKey = '342455135665dbab055a0323ea3e9a77';
  List movies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          movies = data['results'];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print('Error fetching movies: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        backgroundColor: Colors.redAccent,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : movies.isEmpty
              ? const Center(child: Text('No movies found'))
              : ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    final posterPath = movie['poster_path'];
                    final title = movie['title'] ?? 'No title';

                    return ListTile(
                      leading: posterPath != null
                          ? Image.network(
                              'https://image.tmdb.org/t/p/w200$posterPath',
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.movie),
                      title: Text(title),
                      subtitle: Text(
                          'Rating: ${movie['vote_average']?.toString() ?? 'N/A'}'),
                    );
                  },
                ),
    );
  }
}
