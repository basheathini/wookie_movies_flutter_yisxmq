import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wookie_movies_flutter_yisxmq/business/entities/movie.dart';
import 'package:wookie_movies_flutter_yisxmq/data/datasources/movie_remote_data_source.dart';
import 'package:wookie_movies_flutter_yisxmq/data/models/movie_model.dart';
import 'package:wookie_movies_flutter_yisxmq/data/repositories/movie_repository_impl.dart';
import 'package:wookie_movies_flutter_yisxmq/shared/errors/api_exceptions.dart';

//tests Repository Layer (Business Logic) and mocks MovieRemoteDataSource

class MockMovieRemoteDataSource extends Mock implements MovieRemoteDataSource {}

void main() {
  //create mock data source, real repository instance and movie test data
  late MockMovieRemoteDataSource mockRemoteDataSource;
  late MovieRepositoryImpl repository;
  final mockMovies = [
    MovieModel(
      id: '1234',
      title: 'Spider-Man: Across the Spider-Verse',
      overview: 'Traveling across the multiverse, Miles Morales meets a new team of Spider-People, made up of heroes from different dimensions. But when the heroes clash over how to deal with a new threat, Miles finds himself at a crossroads',
      cast: ['Shameik Moore', 'Hailee Steinfeld'],
      backdrop: '',
      classification: 'PG-13',
      director: ['Joaquim Dos Santos', 'Kemp Powers', 'Justin K. Thompson'],
      genres: ['Family/Action'],
      imdbRating: 8.4,
      poster: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7lwIPrJJySz-YBguA6CZYb5uGnHy2iAZEi0ZI3MtOGufwHLIx',
      releasedOn: '2018-07-16',
      slug: 'Spider-Man'),
    MovieModel(
      id: '1235',
      title: 'Spider-Man: Far From Home',
      overview: 'Peter Parker, the beloved superhero Spider-Man, faces four destructive elemental monsters while on holiday in Europe. Soon, he receives help from Mysterio, a fellow hero with mysterious origins.',
      cast: ['Tom Holland', 'Samuel L. Jackson', 'Jake Gyllenhaal'],
      backdrop: '',
      classification: 'PG-13',
      director: ['Jon Watts'],
      genres: ['Family/Action'],
      imdbRating: 7.4,
      poster: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7lwIPrJJySz-YBguA6CZYb5uGnHy2iAZEi0ZI3MtOGufwHLIx',
      releasedOn: '2019-07-02',
      slug: 'Spider-Man',
    ),
  ];

  setUp(() {
    mockRemoteDataSource = MockMovieRemoteDataSource();
    repository = MovieRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('getMovies', () {
    test('should return Right with movies when data source succeeds', () async {
      //mock return sample movies
      when(() => mockRemoteDataSource.getMovies())
          .thenAnswer((_) async => mockMovies);
      //call real repository method (getMovies)
      final result = await repository.getMovies();
      //verify results
      expect(result, isA<Right<AppException, List<Movie>>>());
      result.fold((l) => fail('Expected Right, got Left'), (r) {
          expect(r.length, 2);
          expect(r[0].id, '1234');
          expect(r[1].title, 'Spider-Man: Far From Home');
        },
      );
      verify(() => mockRemoteDataSource.getMovies()).called(1);
    });

    test('should return Left with AppException on ServerException', () async {
      //mock server error (ServerException)
      const exception = ServerException(message: 'Server error');
      when(() => mockRemoteDataSource.getMovies()).thenThrow(exception);
      //call real repository method (getMovies)
      final result = await repository.getMovies();
      //verify results
      expect(result, isA<Left<AppException, List<Movie>>>());
      result.fold(
            (l) => expect(l.message, 'Server error'),
            (r) => fail('Expected Left, got Right'),
      );
    });

    test('should return Left with AppException on FormatException', () async {
      //mock invalid json
      const exception = FormatException('Invalid JSON');
      when(() => mockRemoteDataSource.getMovies()).thenThrow(exception);
      //call real repository method (getMovies)
      final result = await repository.getMovies();
      //verify results
      expect(result, isA<Left<AppException, List<Movie>>>());
      result.fold((l) => expect(l.message, 'Invalid JSON'),
            (r) => fail('Expected Left, got Right'),
      );
    });
  });

  group('searchMovies', () {
    const query = 'action';
    test('should return Right with movies when data source succeeds', () async {
      //mock return for a searched movies
      when(() => mockRemoteDataSource.searchMovies(query)).thenAnswer((_) async => mockMovies);
      //call real repository method (searchMovies)
      final result = await repository.searchMovies(query);
      //verify results
      expect(result, isA<Right<AppException, List<Movie>>>());
      result.fold(
            (l) => fail('Expected Right, got Left'),
            (r) => expect(r.length, 2),
      );
      verify(() => mockRemoteDataSource.searchMovies(query)).called(1);
    });

    test('should handle ServerException', () async {
      //mock server error (ServerException)
      const exception = ServerException(message: 'Search failed');
      when(() => mockRemoteDataSource.searchMovies(query)).thenThrow(exception);
      //call real repository method (searchMovies)
      final result = await repository.searchMovies(query);
      //verify results
      result.fold((l) => expect(l.message, 'Search failed'),
            (r) => fail('Expected Left, got Right'),
      );
    });

    test('should handle NotFoundException', () async {
      //mock error (NotFoundException)
      const exception = NotFoundException(message: 'Not found');
      when(() => mockRemoteDataSource.searchMovies(query)).thenThrow(exception);
      //call real repository method (searchMovies)
      final result = await repository.searchMovies(query);
      //verify results
      result.fold(
            (l) => expect(l.message, 'Not found'),
            (r) => fail('Expected Left, got Right'),
      );
    });

    test('should pass correct query parameter to data source', () async {
      //mock search query
      const testQuery = 'Spider-man';
      when(() => mockRemoteDataSource.searchMovies(testQuery)).thenAnswer((_) async => []);
      //call real repository method (searchMovies)
      await repository.searchMovies(testQuery);
      //verify results
      verify(() => mockRemoteDataSource.searchMovies(testQuery)).called(1);
    });
  });
}