class Movie {
  final String id;
  final String title;
  final String overview;
  final List<dynamic> cast;
  final String backdrop;
  final String classification;
  final List<String> director;
  final List<dynamic> genres;
  final double imdb_rating;
  final String poster;
  final String released_on;
  final String slug;
  final String? year;
  final String? length;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.cast,
    required this.backdrop,
    required this.classification,
    required this.director,
    required this.genres,
    required this.imdb_rating,
    required this.poster,
    required this.released_on,
    required this.slug,
    this.year,
    this.length
  });
}