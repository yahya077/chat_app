import 'package:http/http.dart' as http;

class Api {
  static final _api = Api._internal();

  factory Api() {
    return _api;
  }

  Api._internal();

  String token;
  String baseUrl = 'http://chat.test/';
  String path = 'api/';

  Future<http.Response> httpGet(String endPath, {Map<String, String> query}) {
    Uri uri = Uri.http(baseUrl, '$path/$endPath');
    if (query != null) {
      uri = Uri.http(baseUrl, '$path/$endPath', query);
    }
    return http.get(uri, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
  }

  Future<http.Response> httpPost(String endPath, Object body) {
    Uri uri = Uri.http(baseUrl, '$path/$endPath');

    return http.post(uri,body: body, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
  }
}
