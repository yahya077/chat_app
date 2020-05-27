import 'package:chatapp/providers/locator.dart';
import 'package:chatapp/providers/provider_setup.dart';
import 'package:chatapp/ui/routes.dart';
import 'package:chatapp/ui/screens/main_screen.dart';
import 'package:chatapp/ui/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: StartApp(),
    );
  }
}

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      onGenerateRoute: Router.generateRoute,
      title: 'Flutter App',
      home: WelcomeScreen(),
    );
  }
}

