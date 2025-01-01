class Movie {
  final int id;
  final String posterPath;
  final String title;
  final double voteAverage;
  final DateTime releaseDate;

  Movie({
    required this.id,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
  });

  String get fullPosterPath => 'https://image.tmdb.org/t/p/w500$posterPath';
}
