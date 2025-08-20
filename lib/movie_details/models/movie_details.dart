class MovieDetails {
  final String? title;
  final String? overview;
  final String? posterPath;

  MovieDetails({
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      title: json['title'] ?? 'No title',
      overview: json['overview'] ?? 'No overview available',
      posterPath: json['poster_path'] ?? '',
    );
  }
}
