import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wookie_movies_flutter_yisxmq/data/datasources/movie_remote_data_source.dart';
import 'package:wookie_movies_flutter_yisxmq/data/models/movie_model.dart';
import 'package:wookie_movies_flutter_yisxmq/shared/constants/api.dart';
import 'package:wookie_movies_flutter_yisxmq/shared/utils/api_client.dart';


//tests DataSource Layer (API Integration)

//mock ApiClient
class MockApiClient extends Mock implements ApiClient {}

void main() {
  late MockApiClient mockApiClient;
  late MovieRemoteDataSource remoteDataSource;

//create instances before each test in a test group
  setUp(() {
    mockApiClient = MockApiClient();
    remoteDataSource = MovieRemoteDataSource(apiClient: mockApiClient);
  });

  //create properly typed responses
  Map<String, dynamic> mockResponse(List<Map<String, dynamic>> movies) => {'movies': movies};

  group('getMovies', () {
    //test mock endpoint response and the endpoint to mock
    const endpoint = ApiConstants.moviesEndpoint;
    final mockMovies = [
      {
        'id': '123',
        'title': 'Spider-Man: Across the Spider-Verse',
        'overview': 'Traveling across the multiverse, Miles Morales meets a new team of Spider-People, made up of heroes from different dimensions. But when the heroes clash over how to deal with a new threat, Miles finds himself at a crossroads',
        'cast': ['Shameik Moore', 'Hailee Steinfeld'],
        'backdrop': '',
        'classification': 'PG-13',
        'director': ['Joaquim Dos Santos', 'Kemp Powers', 'Justin K. Thompson'],
        'genres': ['Family/Action'],
        'imdb_rating': 8.4,
        'poster': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7lwIPrJJySz-YBguA6CZYb5uGnHy2iAZEi0ZI3MtOGufwHLIx',
        'released_on': '2018-07-16',
        'slug': 'Spider-Man',
      } as Map<String, dynamic>,
      {
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
      } as Map<String, dynamic>,
    ];

    test('should return List<MovieModel> when successful', () async {
      //setting up a mock response
      when(() => mockApiClient.get(endpoint)).thenAnswer((_) async => mockResponse(mockMovies));
      //core execution, mock the call to get movies
      final result = await remoteDataSource.getMovies();
      //verify the expected results
      expect(result, isA<List<MovieModel>>());
      expect(result.length, 2);
      verify(() => mockApiClient.get(endpoint)).called(1);
    });
  });

  group('searchMovies', () {
    //test mock endpoint response and the endpoint to mock
    const query = 'action';
    final endpoint = ApiConstants.searchEndpoint(query);
    final mockMovies = [
      {
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
      } as Map<String, dynamic>,
    ];

    test('should return List<MovieModel> when successful', () async {
      //setting up a mock response
      when(() => mockApiClient.get(endpoint)).thenAnswer((_) async => mockResponse(mockMovies));
      //core execution, mock the search and get movies by query
      final result = await remoteDataSource.searchMovies(query);
      //verify the expected results
      expect(result, isA<List<MovieModel>>());
      expect(result.length, 1);
    });
  });
}
