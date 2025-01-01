import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/poster.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';

class HighestRating extends StatelessWidget {
  final List<Movie> movies;

  const HighestRating({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 12);
        },
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return poster(context, movie: movies[index]);
        },
      ),
    );
  }
}
