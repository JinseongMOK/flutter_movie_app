import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/widgets/coming_soon.dart';
import 'package:flutter_movie_app/presentation/widgets/highest_rating.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/core/title_text.dart';
import 'package:flutter_movie_app/presentation/provider/movie_provider.dart';
import 'package:flutter_movie_app/presentation/widgets/most_popular.dart';
import 'package:flutter_movie_app/presentation/widgets/popular.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(homeViewModelProvider.notifier).fetchAllMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            children: [
              titleText('가장 인기있는'),
              if (state.nowPlayingMovies != null)
                MostPopular(movies: state.nowPlayingMovies!),
              titleText('인기순'),
              if (state.popularMovies != null)
                Popular(movies: state.popularMovies!),
              titleText('평점 높은순'),
              if (state.topRatedMovies != null)
                HighestRating(movies: state.topRatedMovies!),
              titleText('개봉예정'),
              if (state.upcomingMovies != null)
                ComingSoon(movies: state.upcomingMovies!),
            ],
          ),
        ),
      ),
    );
  }
}
