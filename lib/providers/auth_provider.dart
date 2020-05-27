import 'dart:convert';

import 'package:chatapp/models/user_model.dart';
import 'package:chatapp/services/api.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_provider.dart';

class AuthProvider extends BaseProvider {
    AuthService _authService = AuthService();
    Api _api = Api();
    UserModal _user = UserModal();

    UserModal get user => _user;

    setUser(UserModal user){
      _user = user;
    }
    Future<bool> getUser() async{
      setBusy(true);
      bool tokenExist = await getToken();
      if(tokenExist){
        var response = await _authService.getUser();
        if(response.statusCode == 200) {
        /////////////
          return true;
        }else {
          setBusy(false);
          return false;
        }
      }
      setBusy(false);
      return false;
    }

    Future<bool> getToken() async{
      SharedPreferences prefs =  await SharedPreferences.getInstance();
      var token = prefs.getString('access_token');
      print(token);
      if(token != null){
        _api.token = token;
        return true;
      }
      return false;
    }

    Future<void> saveToken(String token) async{
      SharedPreferences prefs =  await SharedPreferences.getInstance();
      prefs.remove('access_token');
      prefs.setString('access_token', token);
      _api.token = token;
    }

    Future<bool> login(String email,password) async{
      var response = await _authService.login(email.trim(), password.trim());
      var data = jsonDecode(response.toString());
      if(response.statusCode == 200) {
        saveToken(data['access_token']);
        return true;
      }else if (response.statusCode == 400) {
        print(data['error']);
        setMessage(data['error']);
        return false;
      }
      return false;
    }

    Future<bool> register() async{
      setBusy(true);
      var response = await _authService.register(_user);
      print("object");
      var json = jsonDecode(response.toString());
      if(response.statusCode == 201){
        var result = await login(_user.email, _user.password);
        print(json['data']);
        if(result){
          _user = UserModal.fromJson(json['data']);
          return true;
        }else return false;
      }else if(response.statusCode == 422){
        var message = json['errors']['email'][0];
        setMessage(message);
        return true;
      }else if(response.statusCode == 302){
        var message = json['errors'];
        setMessage(message);
        return true;
      }
      setBusy(false);
      return false;
    }

    Future<void> logout() async{
      await _authService.logout();
      SharedPreferences prefs =  await SharedPreferences.getInstance();
      prefs.remove('access_token');
    }


}