class Movie {
  final int id;
  final String title;
  final String? posterPath;

  Movie({required this.title, this.posterPath, required this.id});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'] ?? 'No title',
      posterPath: json['poster_path'],
    );
  }
}
