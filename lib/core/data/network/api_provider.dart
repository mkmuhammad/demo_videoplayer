import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../../error/exceptions.dart';
import 'http_client/api_http_client_impl.dart';
import 'http_client/api_http_methods.dart';

class ApiProvider extends ApiHttpClientImpl implements ApiHttpMethods {
  static final ApiProvider _instance = ApiProvider._internal();
  final HttpClient _httpClient = HttpClient();

  factory ApiProvider() {
    return _instance;
  }

  ApiProvider._internal();

  @override
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final uri = buildUrlWithQueryParameters(
        "$baseUrl$url", query?.cast<String, String>());
    final request = await _httpClient.getUrl(uri);

    var mergedHeaders = {...baseHeaders, ...headers ?? {}};
    mergedHeaders.forEach(request.headers.set);

    final response = await request.close();
    final responseBody = await responseToJson(response);

    if (response.statusCode == HttpStatus.ok) {
      return responseBody;
    } else {
      throw ApiException(
          message: responseBody['message'], statusCode: response.statusCode);
    }
  }

}


