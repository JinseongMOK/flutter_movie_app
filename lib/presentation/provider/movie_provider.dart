import 'package:flutter_movie_app/domain/repository/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/domain/usecase/get_movie_detail_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/get_popular_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/get_upcoming_movies_usecase.dart';
import 'package:flutter_movie_app/presentation/viewmodel/detail_view_model.dart';
import 'package:flutter_movie_app/presentation/viewmodel/home_view_model.dart';

final movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  return MovieDataSourceImpl();
});

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dataSource = ref.watch(movieDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});

final getNowPlayingMoviesUseCaseProvider = Provider((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetNowPlayingMoviesUseCase(repository);
});

final getPopularMoviesUseCaseProvider = Provider((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetPopularMoviesUseCase(repository);
});

final getTopRatedMoviesUseCaseProvider = Provider((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetTopRatedMoviesUseCase(repository);
});

final getUpcomingMoviesUseCaseProvider = Provider((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetUpcomingMoviesUseCase(repository);
});

final getMovieDetailUseCaseProvider = Provider((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetMovieDetailUseCase(repository);
});

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  return HomeViewModel(
    getNowPlayingMoviesUseCase: ref.watch(getNowPlayingMoviesUseCaseProvider),
    getPopularMoviesUseCase: ref.watch(getPopularMoviesUseCaseProvider),
    getTopRatedMoviesUseCase: ref.watch(getTopRatedMoviesUseCaseProvider),
    getUpcomingMoviesUseCase: ref.watch(getUpcomingMoviesUseCaseProvider),
  );
});

final detailViewModelProvider =
    StateNotifierProvider.family<DetailViewModel, DetailState, int>((ref, id) {
  return DetailViewModel(
    getMovieDetailUseCase: ref.watch(getMovieDetailUseCaseProvider),
  )..fetchMovieDetail(id);
});
