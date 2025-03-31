import 'package:dartz/dartz.dart';
import '../../business/entities/movie.dart';
import '../../business/repositories/movie_repository.dart';
import '../../shared/errors/api_exceptions.dart';
import '../datasources/movie_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<AppException, List<Movie>>> getMovies() async {
    try {
      final movieModels = await remoteDataSource.getMovies();
      final movies = movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(AppException(
        message: e.message,
      ));
    } on FormatException catch (e) {
      return Left(AppException(message: e.message));
    }
  }

  @override
  Future<Either<AppException, List<Movie>>> searchMovies(String query) async {
    try {
      final movieModels = await remoteDataSource.searchMovies(query);
      final movies = movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(AppException(
        message: e.message,
      ));
    } on NotFoundException catch (e) {
      return Left(AppException(message: e.message));
    } on FormatException catch (e) {
      return Left(AppException(message: e.message));
    }
  }
}
