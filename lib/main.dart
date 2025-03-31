import 'package:flutter/material.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/movie_categories/bloc/movies_categories_bloc.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/movie_categories/screens/home_screen.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/search/bloc/search_movie_bloc.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/search/screens/search_movies_screen.dart';
import 'injection_container.dart';

void main() async {
  await init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MovieCategoriesBloc>(
          create: (context) => getIt<MovieCategoriesBloc>(),
          child: const HomeScreen(),
        ),
        BlocProvider<SearchMovieBloc>(
          create: (context) => getIt<SearchMovieBloc>(),
          child: const SearchMoviesScreen(),
        ),
      ],
      child: const WookieMovies(),
    ),
  );
}