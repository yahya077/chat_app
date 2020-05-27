import 'package:chatapp/providers/auth_provider.dart';
import 'package:chatapp/ui/screens/signup_screen.dart';
import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/style.dart';
import 'package:chatapp/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';
import 'main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static final routeName = 'welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      var userExist =await Provider.of<AuthProvider>(context,listen: false).getUser();
      if(userExist){
        Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Style.darkColor,
      body:Provider.of<AuthProvider>(context).busy ? CircularProgressIndicator() : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
                child: Text(
              'Flutter Chat',
              style: Style.appNameTextStyle,
            )),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PrimaryButton(
                onTap: () =>
                    Navigator.of(context).pushNamed(LoginScreen.routeName),
                child: Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 21),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              PrimaryButton(
                onTap: () =>
                    Navigator.of(context).pushNamed(SignUpScreen.routeName),
                child: Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 21),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
