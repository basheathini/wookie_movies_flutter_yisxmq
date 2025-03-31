import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/movie_detailed_screen/screens/detailed_movie_screen.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/search/bloc/search_movie_bloc.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/search/bloc/search_movie_state.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/styles.dart';
import '../bloc/search_movie_event.dart';

class SearchMoviesScreen extends StatelessWidget {
  const SearchMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search movie...',
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search),
          ),
          onChanged: (query) => context.read<SearchMovieBloc>().add(
              SearchQueryChanged(query)),
        ),
      ),
      body: BlocBuilder<SearchMovieBloc, SearchMovieState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const Center(child: SizedBox(
              width: 15, height: 15,
                child: CircularProgressIndicator()));
          }
          if (state is SearchError) {
            return Center(child: Text(state.message));
          }
          if(state is SearchEmpty) {
            return Center(child: Text('Ops...No movie found', style: TextStyles.text.copyWith(fontSize: 16)));
          }
          if (state is SearchLoaded) {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl: movie.poster,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(color: black)),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                    title: Text(movie.title),
                    subtitle: Text(movie.released_on),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailedMovieScreen(movie: movie),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}