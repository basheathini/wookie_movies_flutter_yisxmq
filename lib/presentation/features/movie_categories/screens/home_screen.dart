import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wookie_movies_flutter_yisxmq/shared/theme/colors.dart';
import 'package:wookie_movies_flutter_yisxmq/shared/theme/styles.dart';
import '../../../../shared/utils/helper_functions.dart';
import '../../../widgets/home_screen_loader.dart';
import '../../../widgets/search_text_box.dart';
import '../bloc/movie_categories_event.dart';
import '../bloc/movies_categories_bloc.dart';
import '../bloc/movies_categories_state.dart';
import '../widgets/movies_categories_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MovieCategoriesBloc>().add(const LoadInitialMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text('Wookie movies', style: TextStyles.text),
        centerTitle: false,
      ),
      backgroundColor: white,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: SearchTextBox(title: 'Search movies', height: 50),
          ),
          Expanded(
            child: BlocListener<MovieCategoriesBloc, MoviesCategoriesState>(
              listener: (context, state) {
                if (state is MovieCategoriesError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message), duration: const Duration(seconds: 5),),
                  );
                }
              },
              child: BlocBuilder<MovieCategoriesBloc, MoviesCategoriesState>(
                builder: (context, state) {
                  if (state is MovieCategoriesLoading) {
                    return const HomeScreenLoader();
                  }
                  if (state is MovieCategoriesLoaded) {
                    final groupedMovies = groupMoviesByCategory(state.movies);
                    return groupedMovies.isEmpty ? const SizedBox() : MovieCategoriesList(groupedMovies: groupedMovies);
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
