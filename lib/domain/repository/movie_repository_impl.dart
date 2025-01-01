import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _dataSource;

  MovieRepositoryImpl(this._dataSource);

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final response = await _dataSource.fetchNowPlayingMovies();
    if (response == null) return null;

    return response.results
        .map((dto) => Movie(
              id: dto.id,
              posterPath: dto.posterPath ?? '',
              title: dto.title,
              voteAverage: dto.voteAverage.toDouble(),
              releaseDate: dto.releaseDate,
            ))
        .toList();
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() async {
    final response = await _dataSource.fetchPopularMovies();
    if (response == null) return null;

    return response.results
        .map((dto) => Movie(
              id: dto.id,
              posterPath: dto.posterPath ?? '',
              title: dto.title,
              voteAverage: dto.voteAverage.toDouble(),
              releaseDate: dto.releaseDate,
            ))
        .toList();
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() async {
    final response = await _dataSource.fetchTopRatedMovies();
    if (response == null) return null;

    return response.results
        .map((dto) => Movie(
              id: dto.id,
              posterPath: dto.posterPath ?? '',
              title: dto.title,
              voteAverage: dto.voteAverage.toDouble(),
              releaseDate: dto.releaseDate,
            ))
        .toList();
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() async {
    final response = await _dataSource.fetchUpcomingMovies();
    if (response == null) return null;

    return response.results
        .map((dto) => Movie(
              id: dto.id,
              posterPath: dto.posterPath ?? '',
              title: dto.title,
              voteAverage: dto.voteAverage.toDouble(),
              releaseDate: dto.releaseDate,
            ))
        .toList();
  }

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final response = await _dataSource.fetchMovieDetail(id);
    if (response == null) return null;

    return MovieDetail(
      id: response.id,
      title: response.title,
      overview: response.overview,
      posterPath: response.posterPath ?? '',
      voteCount: response.voteCount,
      releaseDate: response.releaseDate,
      runtime: response.runtime,
      voteAverage: response.voteAverage,
      genres: response.genres.map((genre) => genre.name).toList(),
      budget: response.budget,
      productionCompanyLogos: response.productionCompanies
          .map((company) => company.logoPath ?? '')
          .where((logo) => logo.isNotEmpty)
          .toList(),
      popularity: response.popularity,
      revenue: response.revenue,
      tagline: response.tagline,
      originalTitle: '',
    );
  }
}
