abstract class ApiHttpMethods {
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });
}
