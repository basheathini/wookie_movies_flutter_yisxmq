import 'package:dartz/dartz.dart';
import '../../shared/errors/api_exceptions.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMovies {
  final MovieRepository repository;

  GetMovies(this.repository);

  Future<Either<AppException, List<Movie>>> call() async {
    return await repository.getMovies();
  }
}
