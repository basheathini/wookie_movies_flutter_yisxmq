import 'package:test/test.dart';
import 'package:wookie_movies_flutter_yisxmq/business/entities/movie.dart';
import 'package:wookie_movies_flutter_yisxmq/shared/utils/helper_functions.dart';

void main() {
  group('groupMoviesByCategory', () {

    test('Empty movie list returns empty map', () {
      final result = groupMoviesByCategory([]);
      expect(result, isEmpty);
    });

    test('Single movie with one genre', () {
      final movie = Movie(
        id: '1234',
        genres: ['Action'],
        title: 'Avengers',
        overview: '',
        cast: [],
        backdrop: '',
        classification: '',
        director: [],
        imdbRating: 0,
        poster: '',
        releasedOn: '',
        slug: '',
      );
      final result = groupMoviesByCategory([movie]);
      expect(result['Action'], hasLength(1));
      expect(result['Action']!.first, movie);
    });

    test('Movie with multiple genres appears in multiple categories', () {
      final movie = Movie(
        id: '12345',
        genres: ['Action', 'Comedy'],
        title: 'Doctor Strange',
        overview: '',
        cast: [],
        backdrop: '',
        classification: '',
        director: [],
        imdbRating: 0,
        poster: '',
        releasedOn: '',
        slug: '',
      );

      final result = groupMoviesByCategory([movie]);
      expect(result['Action'], hasLength(1));
      expect(result['Comedy'], hasLength(1));
      expect(result['Drama'], isNull);
    });

    test('Movies with overlapping genres', () {
      final movie1 = Movie(
        id: '123456',
        genres: ['Action'],
        title: 'Die hard',
        overview: '',
        cast: [],
        backdrop: '',
        classification: '',
        director: [],
        imdbRating: 0,
        poster: '',
        releasedOn: '',
        slug: '',
      );

      final movie2 = Movie(
        id: '1234567',
        genres: ['Action', 'Drama'],
        title: 'Lion king',
        overview: '',
        cast: [],
        backdrop: '',
        classification: '',
        director: [],
        imdbRating: 0,
        poster: '',
        releasedOn: '',
        slug: '',
      );

      final result = groupMoviesByCategory([movie1, movie2]);
      expect(result['Action'], hasLength(2));
      expect(result['Drama'], hasLength(1));
    });

    test('Movie with empty genres list is not added to map', () {
      final movie = Movie(
        id: '12345678',
        genres: [],
        title: 'Movie 1',
        overview: '',
        cast: [],
        backdrop: '',
        classification: '',
        director: [],
        imdbRating: 0,
        poster: '',
        releasedOn: '',
        slug: '',
      );

      final result = groupMoviesByCategory([movie]);
      expect(result, isEmpty);
    });
  });

  group('formatMovieOverview', () {
    final movieWithAllFields = Movie(
      id: '134232',
      year: '2020',
      length: '2h 30m',
      director: ['Director 1', 'Director 2'],
      title: '',
      overview: '',
      cast: [],
      backdrop: '',
      classification: '',
      genres: [],
      imdbRating: 0,
      poster: '',
      releasedOn: '',
      slug: '',
    );

    test('Null movie returns all unknown fields', () {
      final result = formatMovieOverview(null);
      expect(result, 'Release year unknown | Duration unknown | Director unknown');
    });

    test('Complete movie data formats correctly', () {
      final result = formatMovieOverview(movieWithAllFields);
      expect(result, '2020 | 2h 30m | Director 1, Director 2');
    });

  });
}