import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/title_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: titleText('가장 인기있는'),
    );
  }
}
