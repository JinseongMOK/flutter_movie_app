class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final int voteCount;
  final DateTime releaseDate;
  final int runtime;
  final double voteAverage;
  final List<String> genres;
  final int budget;
  final List<String> productionCompanyLogos;
  final double popularity;
  final int revenue;
  final String tagline;

  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteCount,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.genres,
    required this.budget,
    required this.productionCompanyLogos,
    required this.popularity,
    required this.revenue,
    required this.tagline,
  });

  String get fullPosterPath => 'https://image.tmdb.org/t/p/w500$posterPath';
}
