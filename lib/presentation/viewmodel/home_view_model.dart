import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/get_popular_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/get_upcoming_movies_usecase.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  final GetNowPlayingMoviesUseCase _getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;
  final GetUpcomingMoviesUseCase _getUpcomingMoviesUseCase;

  HomeViewModel({
    required GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase,
    required GetPopularMoviesUseCase getPopularMoviesUseCase,
    required GetTopRatedMoviesUseCase getTopRatedMoviesUseCase,
    required GetUpcomingMoviesUseCase getUpcomingMoviesUseCase,
  })  : _getNowPlayingMoviesUseCase = getNowPlayingMoviesUseCase,
        _getPopularMoviesUseCase = getPopularMoviesUseCase,
        _getTopRatedMoviesUseCase = getTopRatedMoviesUseCase,
        _getUpcomingMoviesUseCase = getUpcomingMoviesUseCase,
        super(HomeState());

  Future<void> fetchAllMovies() async {
    state = state.copyWith(isLoading: true);

    final nowPlayingMovies = await _getNowPlayingMoviesUseCase.execute();
    final popularMovies = await _getPopularMoviesUseCase.execute();
    final topRatedMovies = await _getTopRatedMoviesUseCase.execute();
    final upcomingMovies = await _getUpcomingMoviesUseCase.execute();

    state = state.copyWith(
      isLoading: false,
      nowPlayingMovies: nowPlayingMovies,
      popularMovies: popularMovies,
      topRatedMovies: topRatedMovies,
      upcomingMovies: upcomingMovies,
    );
  }
}

class HomeState {
  final bool isLoading;
  final List<Movie>? nowPlayingMovies;
  final List<Movie>? popularMovies;
  final List<Movie>? topRatedMovies;
  final List<Movie>? upcomingMovies;

  HomeState({
    this.isLoading = false,
    this.nowPlayingMovies,
    this.popularMovies,
    this.topRatedMovies,
    this.upcomingMovies,
  });

  HomeState copyWith({
    bool? isLoading,
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upcomingMovies,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
    );
  }
}
