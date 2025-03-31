import 'package:wookie_movies_flutter_yisxmq/business/entities/movie.dart';
import 'package:dartz/dartz.dart';
import '../../shared/errors/api_exceptions.dart';

abstract class MovieRepository {
  Future<Either<AppException, List<Movie>>> getMovies();
  Future<Either<AppException, List<Movie>>> searchMovies(String query);
}
