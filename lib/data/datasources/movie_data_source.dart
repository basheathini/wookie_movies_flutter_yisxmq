import '../../shared/constants/api.dart';
import '../../shared/utils/api_client.dart';
import '../models/movie_model.dart';

class MovieRemoteDataSource {
  final ApiClient apiClient;

  MovieRemoteDataSource({required this.apiClient});

  Future<List<MovieModel>> getMovies() async {
    final response = await apiClient.get(ApiConstants.moviesEndpoint);
    return (response['movies'] as List)
        .map((json) => MovieModel.fromJson(json)).toList();
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await apiClient.get(ApiConstants.searchEndpoint(query));
    return (response['movies'] as List)
        .map((json) => MovieModel.fromJson(json)).toList();
  }
}
