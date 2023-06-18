class ServerException implements Exception {
  String? message;
  int? statusCode;
  ServerException({this.message, this.statusCode});
}

class ApiException implements Exception {
  String? message;
  int? statusCode;
  ApiException({this.message, this.statusCode});
}
