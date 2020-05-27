import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Api {
  static final _api = Api._internal();

  factory Api() {
    return _api;
  }

  Api._internal();

  String token;
  String baseUrl = 'http://192.168.1.34';
  String path = 'api';

  Future<Response> httpGet(String endPath, {Map<String, String> query}) {
    var dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";

    String url = '$baseUrl/$path/$endPath';
    if (query != null) {
      return dio.get(url,queryParameters: query);
    }
    return dio.get(url);
  }

  Future<Response> httpPost(String endPath, Object body) {
    Dio dio = new Dio();
    String uri = '$baseUrl/$path/$endPath';
    print(uri);
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    print(body);
    return dio.post(uri,data: body);
  }
  /*
  Future<http.Response> httpPost(String endPath, Object body) {
    String url = '$baseUrl/$path/$endPath';
    return http.post(url, body: body, headers: {
      'Authorization':'Bearer $token',
      'Accept':'application/json'});
  }*/
}
