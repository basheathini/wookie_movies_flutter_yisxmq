import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/search/bloc/search_movie_event.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/search/bloc/search_movie_state.dart';
import '../../../../business/usecases/search_movie.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;
  Timer? _debounceTimer;

  SearchMovieBloc({required this.searchMovies}) : super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onSearchQueryChanged(
      SearchQueryChanged event,
      Emitter<SearchMovieState> emit,
      ) async {
    _debounceTimer?.cancel();

    if (event.query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    final completer = Completer<void>();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      try {
        emit(SearchLoading());
        final result = await searchMovies(event.query);
        if (emit.isDone) return;
        result.fold((failure) => emit(SearchError(failure.message)), (movies) => movies.isEmpty ? emit(const SearchEmpty()) : emit(SearchLoaded(movies)),
        );
      } catch (e) {
        if (!emit.isDone) emit(SearchError(e.toString()));
      } finally {
        completer.complete();
      }
    });
    await completer.future;
  }

  void _onClearSearch(ClearSearch event, Emitter<SearchMovieState> emit) {
    _debounceTimer?.cancel();
    emit(SearchInitial());
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}