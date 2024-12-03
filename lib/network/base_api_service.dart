abstract class BaseApiService {
  Future<dynamic> getResponse(
      String url, Map<String, dynamic>? queryParameters);
  Future postResponse(String urlPath, Map<String, String> jsonBody);
  Future putResponse(String urlPath, Map<String, dynamic> jsonBody);
  Future deleteResponse(String urlPath, Map<String, dynamic> jsonBody);
}
