import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/title_text.dart';
import 'package:flutter_movie_app/presentation/widgets/coming_soon.dart';
import 'package:flutter_movie_app/presentation/widgets/highest_rating.dart';
import 'package:flutter_movie_app/presentation/widgets/most_popular.dart';
import 'package:flutter_movie_app/presentation/widgets/now_playing.dart';
import 'package:flutter_movie_app/presentation/widgets/popular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            titleText('가장 인기있는'),
            MostPopular(),
            titleText('현재 상영중'),
            NowPlaying(),
            titleText('인기순'),
            Popular(),
            titleText('평점 높은순'),
            HighestRating(),
            titleText('개봉예정'),
            ComingSoon(),
          ],
        ),
      ),
    );
  }
}
