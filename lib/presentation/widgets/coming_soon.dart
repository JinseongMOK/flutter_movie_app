import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/poster.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';

class ComingSoon extends StatelessWidget {
  final List<Movie> movies;

  const ComingSoon({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return poster(context, movie: movie);
        },
      ),
    );
  }
}
