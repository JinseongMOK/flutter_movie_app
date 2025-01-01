import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/presentation/provider/movie_provider.dart';

class DetailPage extends ConsumerWidget {
  final int movieId;

  const DetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailViewModelProvider(movieId));

    if (state.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final movie = state.movieDetail;
    if (movie == null) {
      return const Scaffold(
        body: Center(child: Text('영화 정보를 불러올 수 없습니다.')),
      );
    }

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 550,
            child: Image.network(
              movie.fullPosterPath,
              width: double.infinity,
              height: 550,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(movie.overview),
                const SizedBox(height: 16),
                Text('평점: ${movie.voteAverage}'),
                Text('개봉일: ${movie.releaseDate.toString().split(' ')[0]}'),
                Text('러닝타임: ${movie.runtime}분'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
