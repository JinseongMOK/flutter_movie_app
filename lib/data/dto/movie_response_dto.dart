import 'dart:convert';

MovieResponseDto movieResponseDtoFromJson(String str) =>
    MovieResponseDto.fromJson(json.decode(str));

class MovieResponseDto {
  final int page;
  final List<MovieDto> results;

  MovieResponseDto({
    required this.page,
    required this.results,
  });

  factory MovieResponseDto.fromJson(Map<String, dynamic> json) =>
      MovieResponseDto(
        page: json["page"],
        results: List<MovieDto>.from(
            json["results"].map((x) => MovieDto.fromJson(x))),
      );
}

class MovieDto {
  final int id;
  final String? posterPath;
  final DateTime releaseDate;
  final String title;
  final double voteAverage;

  MovieDto({
    required this.id,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) => MovieDto(
        id: json["id"],
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        voteAverage: json["vote_average"]?.toDouble(),
      );
}
