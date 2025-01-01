import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class GetMovieDetailUseCase {
  final MovieRepository _repository;

  GetMovieDetailUseCase(this._repository);

  Future<MovieDetail?> execute(int id) async {
    return await _repository.fetchMovieDetail(id);
  }
}
