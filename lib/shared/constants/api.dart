class ApiConstants {
  static const String baseUrl = 'https://wookie.codesubmit.io';
  static const String moviesEndpoint = '/movies';
  static String searchEndpoint(String query) => '/movies?q=$query';
  static const String bearerKey = 'Wookie2021';
}