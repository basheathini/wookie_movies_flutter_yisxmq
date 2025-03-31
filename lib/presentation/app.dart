import 'package:flutter/material.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/movie_categories/screens/home_screen.dart';

class WookieMovies extends StatelessWidget {
  const WookieMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
