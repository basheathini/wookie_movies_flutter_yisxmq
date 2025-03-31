import '../../business/entities/movie.dart';

Map<String, List<Movie>> groupMoviesByCategory(List<Movie> movies) {
  final Map<String, List<Movie>> groupedMovies = {};
  for (final movie in movies) {
    for (final genre in movie.genres) {
      if (!groupedMovies.containsKey(genre)) {
        groupedMovies[genre] = [];
      }
      groupedMovies[genre]!.add(movie);
    }
  }
  return groupedMovies;
}

String formatMovieOverview(Movie? movie) {
  String? year = (movie?.year != null && movie!.year!.isNotEmpty) ? movie.year : 'Release year unknown';
  String? length = (movie?.length != null && movie!.length!.isNotEmpty) ? movie.length : 'Duration unknown';
  String directors = (movie?.director != null && movie!.director.isNotEmpty) ? movie.director.join(', ') : 'Director unknown';
  return '$year | $length | $directors';
}