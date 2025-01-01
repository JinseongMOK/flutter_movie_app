import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';

class MostPopular extends StatelessWidget {
  final List<Movie> movies;

  const MostPopular({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    final mostPopularMovie = movies.first;

    return Container(
      height: 500,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          mostPopularMovie.fullPosterPath,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
