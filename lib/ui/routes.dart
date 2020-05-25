import 'package:chatapp/ui/screens/login_screen.dart';
import 'package:chatapp/ui/screens/main_screen.dart';
import 'package:chatapp/ui/screens/signup_screen.dart';
import 'package:chatapp/ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

const String initialRoute = "main";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'main' :
        return MaterialPageRoute(builder: (_) => MainScreen());
      case 'welcome' :
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case 'login' :
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case 'register' :
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ));
    }
  }
}