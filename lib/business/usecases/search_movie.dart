import 'package:dartz/dartz.dart';
import 'package:wookie_movies_flutter_yisxmq/shared/errors/api_exceptions.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<AppException, List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
