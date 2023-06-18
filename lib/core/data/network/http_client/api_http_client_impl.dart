import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'api_http_client.dart';

class ApiHttpClientImpl implements ApiHttpClient {

  final String baseUrl = "";
  final baseHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };


  @override
  Future<Map<String, dynamic>> responseToJson(
      HttpClientResponse response) async {
    final completer = Completer<String>();
    final contents = StringBuffer();
    response.transform(utf8.decoder).listen((data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));

    final body = await completer.future;
    final jsonResponse = json.decode(body);

    return jsonResponse;
  }

  @override
  Uri buildUrlWithQueryParameters(
      String url, Map<String, String>? queryParameters) {
    if (queryParameters == null) {
      return Uri.parse(url);
    }

    final uri = Uri.parse(url);
    final query = uri.queryParameters..addAll(queryParameters);

    return Uri(
      scheme: uri.scheme,
      host: uri.host,
      path: uri.path,
      queryParameters: query,
    );
  }
}
