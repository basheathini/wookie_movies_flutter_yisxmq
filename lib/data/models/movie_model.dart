import '../../business/entities/movie.dart';

class MovieModel extends Movie {

  MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.cast,
    required super.backdrop,
    required super.classification,
    required super.director,
    required super.genres,
    required super.imdbRating,
    required super.poster,
    required super.releasedOn,
    required super.slug,
    super.year,
    super.length,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      overview: json['overview'] ?? "",
      cast: _parseArray(json['cast']),
      backdrop: json['backdrop'] ?? "",
      classification: json['classification'] ?? "",
      director: _parseArray(json['director']),
      genres: _parseArray(json['genres']),
      imdbRating: json['imdb_rating'] ?? "",
      poster: json['poster'] ?? "",
      releasedOn: json['released_on'] ?? "",
      slug: json['slug'] ?? "",
      year: json['year'] ?? "",
      length: json['length'] ?? "",
    );
  }

  Movie toEntity() => Movie(
        id: id,
        title: title,
        overview: overview,
        cast: cast,
        backdrop: title,
        classification: title,
        director: director,
        genres: genres,
        imdbRating: imdbRating,
        poster: poster,
        releasedOn: releasedOn,
        slug: slug,
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
