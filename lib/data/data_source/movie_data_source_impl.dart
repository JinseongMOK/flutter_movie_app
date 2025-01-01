import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final Dio _dio;

  MovieDataSourceImpl()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://api.themoviedb.org/3',
            headers: {
              'Authorization': 'Bearer ${dotenv.env['TMDB_API_KEY']}',
            },
          ),
        );

  @override
  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    try {
      final response = await _dio.get(
        '/movie/now_playing',
        queryParameters: {
          'language': 'ko-KR',
          'page': 1,
        },
      );
      return MovieResponseDto.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchPopularMovies() async {
    try {
      final response = await _dio.get(
        '/movie/popular',
        queryParameters: {
          'language': 'ko-KR',
          'page': 1,
        },
      );
      return MovieResponseDto.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() async {
    try {
      final response = await _dio.get(
        '/movie/top_rated',
        queryParameters: {
          'language': 'ko-KR',
          'page': 1,
        },
      );
      return MovieResponseDto.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() async {
    try {
      final response = await _dio.get(
        '/movie/upcoming',
        queryParameters: {
          'language': 'ko-KR',
          'page': 1,
        },
      );
      return MovieResponseDto.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    try {
      final response = await _dio.get(
        '/movie/$id',
        queryParameters: {
          'language': 'ko-KR',
        },
      );
      print('Movie Detail Response: ${response.data}');
      return MovieDetailDto.fromJson(response.data);
    } catch (e) {
      print('Error fetching movie detail: $e');
      return null;
    }
  }
}
