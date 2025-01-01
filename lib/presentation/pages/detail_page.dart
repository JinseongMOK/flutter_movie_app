import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/title_text.dart';
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
            child: Hero(
              tag: 'movie_${movie.id}',
              child: Image.network(
                movie.fullPosterPath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(movie.releaseDate.toString().split(' ')[0]),
                  ],
                ),
                const SizedBox(height: 8),
                Text(movie.originalTitle),
                Text('${movie.runtime}분'),
                Divider(),
                SizedBox(
                  height: 28,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movie.genres.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            movie.genres[index],
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Divider(),
                const SizedBox(height: 8),
                Text(movie.overview),
                Divider(),
                titleText('흥행정보'),
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildInfoContainer(
                        value: movie.voteAverage.toString(),
                        label: '평점',
                      ),
                      _buildInfoContainer(
                        value: movie.voteCount.toString(),
                        label: '평점투표수',
                      ),
                      _buildInfoContainer(
                        value: movie.popularity.toString(),
                        label: '인기점수',
                      ),
                      _buildInfoContainer(
                        value: '\$${(movie.budget)}',
                        label: '예산',
                      ),
                      _buildInfoContainer(
                        value: '\$${(movie.revenue)}',
                        label: '수익',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 60,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    itemCount: movie.productionCompanyLogos.length,
                    itemBuilder: (context, index) {
                      final logoPath = movie.productionCompanyLogos[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 21, vertical: 15),
                        color: Colors.white,
                        child: logoPath.isNotEmpty
                            ? Image.network(
                                'https://image.tmdb.org/t/p/w200$logoPath',
                                height: 40,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Text(
                                      '로고 없음',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  );
                                },
                              )
                            : const Center(
                                child: Text(
                                  '로고 없음',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoContainer({
    required String value,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
