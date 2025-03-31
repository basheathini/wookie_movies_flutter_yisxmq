import 'package:equatable/equatable.dart';

sealed class MovieCategoriesEvent extends Equatable {
  const MovieCategoriesEvent();

  @override
  List<Object> get props => [];
}

class LoadInitialMovies extends MovieCategoriesEvent {
  const LoadInitialMovies();

  @override
  List<Object> get props => [];
}
