import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/pages/detail_page.dart';

Widget poster(BuildContext context, {required Movie movie}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(movieId: movie.id),
        ),
      );
    },
    child: SizedBox(
      width: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          movie.fullPosterPath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey,
              child: const Center(
                child: Text('이미지 로드 실패'),
              ),
            );
          },
        ),
      ),
    ),
  );
}
