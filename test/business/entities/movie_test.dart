import 'package:test/test.dart';
import 'package:wookie_movies_flutter_yisxmq/business/entities/movie.dart';

//tests Movie entity (fields)

void main() {
  group('Movie entity', () {
    final testMovie = Movie(
      id: '123',
      title: 'Spider-Man: Across the Spider-Verse',
      overview: 'Traveling across the multiverse, Miles Morales meets a new team of Spider-People, made up of heroes from different dimensions. But when the heroes clash over how to deal with a new threat, Miles finds himself at a crossroads',
      cast: ['Shameik Moore', 'Hailee Steinfeld'],
      backdrop: '',
      classification: 'PG-13',
      director: ['Joaquim Dos Santos', 'Kemp Powers', 'Justin K. Thompson'],
      genres: ['Family/Action'],
      imdb_rating: 8.4,
      poster: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7lwIPrJJySz-YBguA6CZYb5uGnHy2iAZEi0ZI3MtOGufwHLIx',
      released_on: '2018-07-16',
      slug: 'Spider-Man',
    );

    test('Initialises required fields', () {
      expect(testMovie.id, '123');
      expect(testMovie.title, 'Spider-Man: Across the Spider-Verse');
      expect(testMovie.overview, 'Traveling across the multiverse, Miles Morales meets a new team of Spider-People, made up of heroes from different dimensions. But when the heroes clash over how to deal with a new threat, Miles finds himself at a crossroads');
      expect(testMovie.cast, ['Shameik Moore', 'Hailee Steinfeld']);
      expect(testMovie.backdrop, '');
      expect(testMovie.classification, 'PG-13');
      expect(testMovie.genres, ['Family/Action']);
      expect(testMovie.imdb_rating, 8.4);
      expect(testMovie.poster, 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7lwIPrJJySz-YBguA6CZYb5uGnHy2iAZEi0ZI3MtOGufwHLIx');
      expect(testMovie.released_on, '2018-07-16');
      expect(testMovie.slug, 'Spider-Man');
    });

    test('Nullable fields default to null', () {
      expect(testMovie.year, isNull);
      expect(testMovie.length, isNull);
    });
  });
}