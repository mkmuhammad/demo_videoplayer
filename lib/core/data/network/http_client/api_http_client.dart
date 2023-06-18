import 'dart:io';

abstract class ApiHttpClient {
  Future<Map<String, dynamic>> responseToJson(HttpClientResponse response);
  Uri buildUrlWithQueryParameters(String url, Map<String, String>? queryParameters);
}