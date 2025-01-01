import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/poster.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';

class Popular extends StatelessWidget {
  final List<Movie> movies;

  const Popular({super.key, required this.movies});

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
          return Stack(
            children: [
              Row(
                children: [
                  const SizedBox(width: 30),
                  poster(context, movie: movie),
                ],
              ),
              Positioned(
                bottom: -25,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: -10,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
