import 'package:equatable/equatable.dart';

abstract class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();
}

class SearchQueryChanged extends SearchMovieEvent {
  final String query;
  const SearchQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}

class ClearSearch extends SearchMovieEvent {
  const ClearSearch();

  @override
  List<Object> get props => [];
}
