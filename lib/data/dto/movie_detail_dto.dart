import 'dart:convert';

MovieDetailDto movieDetailDtoFromJson(String str) =>
    MovieDetailDto.fromJson(json.decode(str));

class MovieDetailDto {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String? posterPath;
  final int voteCount;
  final DateTime releaseDate;
  final int runtime;
  final double voteAverage;
  final List<Genre> genres;
  final int budget;
  final List<ProductionCompany> productionCompanies;
  final double popularity;
  final int revenue;

  MovieDetailDto({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    this.posterPath,
    required this.voteCount,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.genres,
    required this.budget,
    required this.productionCompanies,
    required this.popularity,
    required this.revenue,
  });

  factory MovieDetailDto.fromJson(Map<String, dynamic> json) => MovieDetailDto(
        id: json["id"],
        title: json["title"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        voteCount: json["vote_count"],
        releaseDate: DateTime.parse(json["release_date"]),
        runtime: json["runtime"],
        voteAverage: json["vote_average"]?.toDouble(),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        budget: json["budget"],
        productionCompanies: List<ProductionCompany>.from(
            json["production_companies"]
                .map((x) => ProductionCompany.fromJson(x))),
        popularity: json["popularity"]?.toDouble(),
        revenue: json["revenue"],
      );

  @override
  String toString() {
    return 'MovieDetailDto(id: $id, title: $title, originalTitle: $originalTitle)';
  }
}

class Genre {
  final String name;

  Genre({
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        name: json["name"],
      );
}

class ProductionCompany {
  final String? logoPath;

  ProductionCompany({
    this.logoPath,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      ProductionCompany(
        logoPath: json["logo_path"],
      );
}
