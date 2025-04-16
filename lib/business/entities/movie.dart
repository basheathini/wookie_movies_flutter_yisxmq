class Movie {
  final String id;
  final String title;
  final String overview;
  final List<dynamic> cast;
  final String backdrop;
  final String classification;
  final List<String> director;
  final List<dynamic> genres;
  final double imdbRating;
  final String poster;
  final String releasedOn;
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
    required this.imdbRating,
    required this.poster,
    required this.releasedOn,
    required this.slug,
    this.year,
    this.length
  });
}