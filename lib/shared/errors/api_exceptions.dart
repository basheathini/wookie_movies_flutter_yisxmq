class AppException implements Exception {
  final String message;
  const AppException({required this.message});
}

class ServerException extends AppException {
  const ServerException({required super.message});
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({required super.message});
}

class NotFoundException extends AppException {
  const NotFoundException({required super.message});
}
