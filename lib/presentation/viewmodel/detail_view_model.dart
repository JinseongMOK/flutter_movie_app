import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/usecase/get_movie_detail_usecase.dart';

class DetailViewModel extends StateNotifier<DetailState> {
  final GetMovieDetailUseCase _getMovieDetailUseCase;

  DetailViewModel({
    required GetMovieDetailUseCase getMovieDetailUseCase,
  })  : _getMovieDetailUseCase = getMovieDetailUseCase,
        super(DetailState());

  Future<void> fetchMovieDetail(int id) async {
    state = state.copyWith(isLoading: true);

    final movieDetail = await _getMovieDetailUseCase.execute(id);

    state = state.copyWith(
      isLoading: false,
      movieDetail: movieDetail,
    );
  }
}

class DetailState {
  final bool isLoading;
  final MovieDetail? movieDetail;

  DetailState({
    this.isLoading = false,
    this.movieDetail,
  });

  DetailState copyWith({
    bool? isLoading,
    MovieDetail? movieDetail,
  }) {
    return DetailState(
      isLoading: isLoading ?? this.isLoading,
      movieDetail: movieDetail ?? this.movieDetail,
    );
  }
}
