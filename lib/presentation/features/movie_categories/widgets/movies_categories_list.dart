import 'package:flutter/cupertino.dart';
import '../../../../business/entities/movie.dart';
import '../../../widgets/movie_card.dart';

class MovieCategoriesList extends StatelessWidget {
  final Map<String, List<Movie>> groupedMovies;

  const MovieCategoriesList({super.key, required this.groupedMovies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 5),
      itemCount: groupedMovies.length,
      itemBuilder: (context, categoryIndex) {
        final category = groupedMovies.keys.elementAt(categoryIndex);
        final moviesInCategory = groupedMovies[category] ?? [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                category,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            moviesInCategory.isEmpty ? const SizedBox() : SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                itemCount: moviesInCategory.length,
                itemBuilder: (context, movieIndex) {
                  final movie = moviesInCategory[movieIndex];
                  return Container(
                    width: 140,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    child: MovieCard(movie: movie),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
