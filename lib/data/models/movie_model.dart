import '../../business/entities/movie.dart';

class MovieModel {
  final String id;
  final String? title;
  final String? overview;
  final List<dynamic>? cast;
  final String? backdrop;
  final String? classification;
  final List<String>? director;
  final List<dynamic>? genres;
  final double? imdb_rating;
  final String? poster;
  final String? released_on;
  final String? slug;
  final String? year;
  final String? length;

  MovieModel({
    required this.id,
    this.title,
    this.overview,
    this.cast,
    this.backdrop,
    this.classification,
    this.director,
    this.genres,
    this.imdb_rating,
    this.poster,
    this.released_on,
    this.slug,
    this.year,
    this.length,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      cast: _parseArray(json['cast']),
      backdrop: json['backdrop'],
      classification: json['classification'],
      director: _parseArray(json['director']),
      genres: _parseArray(json['genres']),
      imdb_rating: json['imdb_rating'],
      poster: json['poster'],
      released_on: json['released_on'],
      slug: json['slug'],
      year: json['year'],
      length: json['length'],
    );
  }

  Movie toEntity() => Movie(
        id: id,
        title: title ?? '',
        overview: overview ?? '',
        cast: cast ?? [],
        backdrop: title ?? '',
        classification: title ?? '',
        director: director ?? [],
        genres: genres ?? [],
        imdb_rating: imdb_rating ?? 0.0,
        poster: poster ?? '',
        released_on: released_on ?? '',
        slug: slug ?? '',
        year: year ?? '',
        length: length ?? '',
      );

  static List<String> _parseArray(dynamic array) {
    if (array is List) {
      return array.map((g) => g.toString()).toList();
    }
    return [];
  }
}
