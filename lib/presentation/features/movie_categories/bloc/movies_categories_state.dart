import 'package:equatable/equatable.dart';
import 'package:wookie_movies_flutter_yisxmq/business/entities/movie.dart';

sealed class MoviesCategoriesState extends Equatable {

  const MoviesCategoriesState();

  @override
  List<Object> get props => [];
}

class MovieCategoriesLoading extends MoviesCategoriesState {
  const MovieCategoriesLoading();
}

class MovieCategoriesLoaded extends MoviesCategoriesState {
  final List<Movie> movies;
  const MovieCategoriesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieCategoriesError extends MoviesCategoriesState {
  final String message;
  const MovieCategoriesError(this.message);

  @override
  List<Object> get props => [message];
}
