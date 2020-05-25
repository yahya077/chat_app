import 'package:chatapp/ui/routes.dart';
import 'package:chatapp/ui/screens/main_screen.dart';
import 'package:chatapp/ui/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      onGenerateRoute: Router.generateRoute,
      title: 'Flutter App',
      home: WelcomeScreen(),
    );
  }
}
