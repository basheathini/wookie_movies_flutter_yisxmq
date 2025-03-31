import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wookie_movies_flutter_yisxmq/shared/constants/api.dart';
import '../errors/api_exceptions.dart';

class ApiClient {
  final http.Client client;

  ApiClient({required this.client});

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await client.get(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: {
          'Authorization': 'Bearer ${ApiConstants.bearerKey}',
          'Content-Type': 'application/json',
        },
      );
      return _handleResponse(response);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 404:
        throw const NotFoundException(message: 'Resource not found');
      case 500:
        throw const ServerException(message: 'Server error');
      default:
        throw const ServerException(message: 'Unexpected error occurred');
    }
  }
}