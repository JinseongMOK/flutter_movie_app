import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail_page.dart';

Widget poster(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailPage()),
      );
    },
    child: SizedBox(
      width: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://picsum.photos/200/300',
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
