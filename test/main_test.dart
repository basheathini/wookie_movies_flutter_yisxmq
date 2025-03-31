import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/movie_categories/bloc/movies_categories_bloc.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/movie_categories/bloc/movies_categories_state.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/movie_categories/screens/home_screen.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/search/bloc/search_movie_bloc.dart';
import 'package:wookie_movies_flutter_yisxmq/presentation/features/search/bloc/search_movie_state.dart';

class MockMovieCategoriesBloc extends Mock implements MovieCategoriesBloc {}
class MockSearchMovieBloc extends Mock implements SearchMovieBloc {}

void main() {
  late MockMovieCategoriesBloc mockCategoriesBloc;
  late MockSearchMovieBloc mockSearchBloc;

  setUp(() {
    mockCategoriesBloc = MockMovieCategoriesBloc();
    mockSearchBloc = MockSearchMovieBloc();

    //initialize mock states
    when(() => mockCategoriesBloc.state).thenReturn(const MovieCategoriesLoading());
    when(() => mockSearchBloc.state).thenReturn(SearchInitial());

    //setup streams
    when(() => mockCategoriesBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockSearchBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  testWidgets('HomeScreen should render with providers', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: mockCategoriesBloc),
          BlocProvider.value(value: mockSearchBloc),
        ],
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}