import 'package:chatapp/ui/screens/signup_screen.dart';
import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/style.dart';
import 'package:chatapp/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static final routeName = 'welcome';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Style.darkColor,
      body: Column(
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
