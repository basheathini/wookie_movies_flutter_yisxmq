import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/movie_categories/bloc/movie_categories_event.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/movie_categories/bloc/movies_categories_state.dart';
import '../../../../business/usecases/get_movies.dart';

class MovieCategoriesBloc extends Bloc<MovieCategoriesEvent, MoviesCategoriesState> {
  final GetMovies getMovies;

  MovieCategoriesBloc({required this.getMovies}) : super(const MovieCategoriesLoading()) {
    on<LoadInitialMovies>((event, emit) async {
      emit(const MovieCategoriesLoading());
      final result = await getMovies();
      result.fold(
        (failure) => emit(MovieCategoriesError(failure.message)),
        (movies) => emit(MovieCategoriesLoaded(movies)),
      );
    });
  }
}
