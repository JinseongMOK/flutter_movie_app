class Movie {
  final int id;
  final String posterPath;

  Movie({
    required this.id,
    required this.posterPath,
  });

  String get fullPosterPath => 'https://image.tmdb.org/t/p/w500$posterPath';
}
