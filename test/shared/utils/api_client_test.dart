import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:wookie_movies_flutter_yisxmq/shared/constants/api.dart';
import 'package:wookie_movies_flutter_yisxmq/shared/errors/api_exceptions.dart';
import 'package:wookie_movies_flutter_yisxmq/shared/utils/api_client.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late ApiClient apiClient;
  const baseUrl = ApiConstants.baseUrl;
  const endpoint = '/movies';
  final expectedUri = Uri.parse('$baseUrl$endpoint');
  const headers = {
    'Authorization': 'Bearer ${ApiConstants.bearerKey}',
    'Content-Type': 'application/json',
  };

  setUp(() {
    registerFallbackValue(Uri());
  });

  setUp(() {
    mockHttpClient = MockHttpClient();
    apiClient = ApiClient(client: mockHttpClient);
  });

  group('get', () {
    test('should make GET request with correct parameters', () async {
      //mock Get endpoint
      when(() => mockHttpClient.get(
        any<Uri>(),
        headers: any<Map<String, String>?>(named: 'headers'),
      )).thenAnswer((_) async => http.Response('{}', 200));

      //call real apiClient
      await apiClient.get(endpoint);

      //verify results
      verify(() => mockHttpClient.get(
        expectedUri,
        headers: headers,
      )).called(1);
    });

    test('should return decoded JSON when response is 200', () async {
      //mock success response
      const responseBody = '{"data": "success"}';
      when(() => mockHttpClient.get(
        any<Uri>(),
        headers: any<Map<String, String>?>(named: 'headers'),
      )).thenAnswer((_) async => http.Response(responseBody, 200));

      //call real apiClient
      final result = await apiClient.get(endpoint);
      //verify results
      expect(result, {'data': 'success'});
    });

    test('should throw ServerException on 500 response', () async {
      //mock ServerException response
      when(() => mockHttpClient.get(
        any<Uri>(),
        headers: any<Map<String, String>?>(named: 'headers'),
      )).thenAnswer((_) async => http.Response('Server error', 500));

      //call real apiClient & verify results
      expect(() => apiClient.get(endpoint), throwsA(isA<ServerException>()));
    });

    test('should throw ServerException on other status codes', () async {
      //mock ServerException response
      when(() => mockHttpClient.get(
        any<Uri>(),
        headers: any<Map<String, String>?>(named: 'headers'),
      )).thenAnswer((_) async => http.Response('Unauthorized', 401));

      //call real apiClient & verify results
      expect(() => apiClient.get(endpoint), throwsA(isA<ServerException>()));
    });

    test('should throw ServerException on invalid JSON response', () async {
      //mock invalid json response
      when(() => mockHttpClient.get(
        any<Uri>(),
        headers: any<Map<String, String>?>(named: 'headers'),
      )).thenAnswer((_) async => http.Response('invalid json', 200));

      //call real apiClient & verify results
      expect(() => apiClient.get(endpoint), throwsA(isA<ServerException>()));
    });

    test('should throw ServerException on network error', () async {
      //mock ServerException json response
      when(() => mockHttpClient.get(
        any<Uri>(),
        headers: any<Map<String, String>?>(named: 'headers'),
      )).thenThrow(const SocketException('No Internet'));
      //call real apiClient & verify results
      expect(
            () => apiClient.get(endpoint),
        throwsA(isA<ServerException>().having(
              (e) => e.message,
          'message',
          contains('SocketException: No Internet'),
        )),
      );
    });
  });
}