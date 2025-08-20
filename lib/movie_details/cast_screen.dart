import 'package:filmflowapp/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CastScreen extends StatefulWidget {
  final int movieId;

  const CastScreen({super.key, required this.movieId});

  @override
  State<CastScreen> createState() => _CastScreenState();
}

class _CastScreenState extends State<CastScreen> {
  List cast = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCast();
  }

  Future<void> fetchCast() async {
    const token =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMzYxYTM1NGJkMmE4YTllNzQ2YmFhMDJmNWE1YzQ1NCIsIm5iZiI6MTc1NDY0MjQwMC42NTIsInN1YiI6IjY4OTViN2UwYzZlZmI5ODU5ODA3Y2E0OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FQ2fx30w-_MJjRZ7H7tOshzhkbfI5pKyIcDLSXZFEQc';

    final url = 'https://api.themoviedb.org/3/movie/${widget.movieId}/credits';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json;charset=utf-8',
        },
      );

      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          cast = data['cast'];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load cast');
      }
    } catch (e) {
      print('Error fetching cast: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cast',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 24,
          ),
        ),
        leading: const BackButton(),
        backgroundColor: AppColors.imdbYellow,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Wrap(
                spacing: 8,
                runSpacing: 12,
                children: cast.map((actor) {
                  final hasImage = actor['profile_path'] != null;
                  final imageUrl = hasImage
                      ? 'https://image.tmdb.org/t/p/w185${actor['profile_path']}'
                      : null;

                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 4 - 12,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: hasImage
                              ? Image.network(
                                  imageUrl!,
                                  fit: BoxFit.cover,
                                  height: 87,
                                  width: 82,
                                )
                              : Container(
                                  width: 82,

                                  height: 87,

                                  color: Colors.grey,
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.person,
                                    size: 32,
                                    color: Colors.white70,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: 82,
                          child: Text(
                            actor['name'] ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 10),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
      // GridView.builder(
      //     padding: const EdgeInsets.all(12),
      //     itemCount: cast.length,
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 4,
      //       crossAxisSpacing: 12,
      //       mainAxisSpacing: 12,
      //       childAspectRatio: 0.65,
      //     ),
      //     itemBuilder: (context, index) {
      //       final actor = cast[index];
      //       final imageUrl = actor['profile_path'] != null
      //           ? 'https://image.tmdb.org/t/p/w185${actor['profile_path']}'
      //           : 'https://via.placeholder.com/150';

      //       return Column(
      //         children: [
      //           ClipRRect(
      //             borderRadius: BorderRadius.circular(8),
      //             child: Image.network(
      //               imageUrl,
      //               width: 82,
      //               height: 87,
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //           const SizedBox(height: 6),
      //           Text(
      //             actor['name'] ?? '',
      //             textAlign: TextAlign.center,
      //             style: const TextStyle(fontSize: 12),
      //             maxLines: 2,
      //             overflow: TextOverflow.ellipsis,
      //           ),
      //         ],
      //       );
      // },
      // );
    );
  }
}
