import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:wookie_movies_flutter_yisxmq/presentation/features/movie_categories/bloc/movies_categories_bloc.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/search/bloc/search_movie_bloc.dart';
import 'package:wookie_movies_flutter_yisxmq/shared/utils/api_client.dart';
import 'business/repositories/movie_repository.dart';
import 'business/usecases/get_movies.dart';
import 'business/usecases/search_movie.dart';
import 'data/datasources/movie_data_source.dart';
import 'data/repositories/movie_repository_impl.dart';

//inject app dependencies making sure that resources are setup on app launch and are available for usage

final getIt = GetIt.instance;

Future<void> init() async {

  //BLoCs
  getIt.registerFactory(() => MovieCategoriesBloc(getMovies: getIt()));
  getIt.registerFactory(() => SearchMovieBloc(searchMovies: getIt()));

  //Use Cases
  getIt.registerLazySingleton(() => GetMovies(getIt()));
  getIt.registerLazySingleton(() => SearchMovies(getIt()));

  //Repository
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
        remoteDataSource: getIt(),
      ));

  //Data Sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSource(apiClient: getIt<ApiClient>()),
  );

  //Dependencies
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  //Api
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(client: getIt()));
}
