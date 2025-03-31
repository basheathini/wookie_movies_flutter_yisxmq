import 'package:flutter_test/flutter_test.dart';
import 'package:wookie_movies_flutter_yisxmq/data/models/movie_model.dart';

//tests Movie Model

void main() {
  group('MovieModel', () {
    final mockJson = {
      'id': '1234',
      'title': 'Avengers: Endgame',
      'overview': 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos actions and restore balance to the universe.',
      'cast': ['Robert Downey Jr.', 'Chris Evans', 'Mark Ruffalo'],
      'backdrop': '',
      'classification': 'PG-13',
      'director': ['Anthony Russo', 'Joe Russo'],
      'genres': ['Family/Action'],
      'imdb_rating': 8.4,
      'poster': 'https://images.thedirect.com/media/article_full/scott-lang-ant-man-quantumania-avengers-endgame-mcu-marvel_5lf2djq.jpg?imgeng=/cmpr_60/w_1280',
      'released_on': '2019-07-16',
      'slug': 'Avengers',
    };

    group('fromJson', () {
      test('should handle missing optional fields', () {
        final incompleteJson = Map<String, dynamic>.from(mockJson)
          ..remove('title')
          ..remove('overview')
          ..remove('cast')
          ..remove('classification')
          ..remove('director')
          ..remove('genres')
          ..remove('imdb_rating')
          ..remove('released_on')
          ..remove('slug')
          ..remove('year')
          ..remove('length');

        final movie = MovieModel.fromJson(incompleteJson);
        expect(movie.title, isNull);
        expect(movie.overview, isNull);
        expect(movie.cast, []);
        expect(movie.classification, isNull);
        expect(movie.director, []);
        expect(movie.genres, []);
        expect(movie.imdb_rating, isNull);
        expect(movie.released_on, isNull);
        expect(movie.slug, isNull);
        expect(movie.year, isNull);
        expect(movie.length, isNull);
      });

      test('should handle non-list director value', () {
        final modifiedJson = Map<String, dynamic>.from(mockJson)
          ..['director'] = 'Single Director';

        final movie = MovieModel.fromJson(modifiedJson);
        expect(movie.director, isEmpty);
      });
    });

    group('toEntity', () {
      test('should convert to entity with defaults for null values', () {
        final model = MovieModel(id: '123456');
        final entity = model.toEntity();

        expect(entity.id, '123456');
        expect(entity.title, '');
        expect(entity.overview, '');
        expect(entity.cast, []);
        expect(entity.backdrop, '');
        expect(entity.classification, '');
        expect(entity.director, []);
        expect(entity.genres, []);
        expect(entity.imdb_rating, 0.0);
        expect(entity.poster, '');
        expect(entity.released_on, '');
        expect(entity.slug, '');
        expect(entity.year, '');
        expect(entity.length, '');
      });

      test('should preserve non-null values in entity', () {
        final model = MovieModel.fromJson(mockJson);
        final entity = model.toEntity();

        expect(entity.title, 'Avengers: Endgame');
        expect(entity.overview, 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos actions and restore balance to the universe.');
        expect(entity.cast, hasLength(3));
        expect(entity.director, hasLength(2));
        expect(entity.imdb_rating, 8.4);
      });
    });
  });
}