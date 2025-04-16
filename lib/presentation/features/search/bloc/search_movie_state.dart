import 'package:equatable/equatable.dart';
import '../../../../business/entities/movie.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();
}

class SearchInitial extends SearchMovieState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchMovieState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchMovieState {
  final List<Movie> movies;

  const SearchLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class SearchError extends SearchMovieState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}


class SearchEmpty extends SearchMovieState {
  final String message;

  const SearchEmpty(this.message);

  @override
  List<Object> get props => [];
}
