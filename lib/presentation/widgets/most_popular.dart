import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail_page.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage()),
          );
        },
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
}
