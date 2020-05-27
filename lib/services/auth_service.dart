import 'package:chatapp/models/user_model.dart';
import 'package:chatapp/services/base_api.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AuthService extends BaseApi {

  Future<Response> getUser() async {
    return await api.httpGet('user');
  }

  Future<Response> login(String email,password) async {
    print("girdi - 2");
    return await api.httpPost('login', {'email': email,'password': password});

  }

  Future<Response> register(UserModal user) async {
    return await api.httpPost('register', {'email': user.email,'password': user.password, 'name':user.name});
  }

  Future<Response> logout() async {
    return await api.httpPost('logout', {});
  }
}