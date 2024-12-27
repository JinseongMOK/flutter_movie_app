import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/poster.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 12);
        },
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return poster(context);
        },
      ),
    );
  }
}
