import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/style.dart';
import 'package:chatapp/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final routeName = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  static bool isEmail(String em) {
    String p =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Style.darkColor,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          Center(
              child: Text(
                'Sign In',
                style: Style.appNameTextStyle,
              )),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 4),
              child: Form(
                key: _key,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: Style.inputDecoration("Email"),
                      validator: (v) {
                        if (v.isEmpty) {
                          return 'input required';
                        } else if(!isEmail(v)){
                          return'email invalide';
                        }
                        return null;
                      },
                      onSaved: (v){
                        //user.name = v;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: Style.inputDecoration("Password"),
                      validator: (v) {
                        if (v.isEmpty) {
                          return 'input required';
                        } else if(v.trim().length < 6) {
                          return 'this passport is too short';
                        }else
                          return null;
                      },
                      onSaved: (v){
                        //user.name = v;
                      },
                    ),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: Container(
        child: PrimaryButton(
          onTap: () {
            if(_key.currentState.validate()){
              _key.currentState.save();
              print('is validate');
            }else {
              print('is not validate');
            }
          },
          child: Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 21),
          ),
        ),
      ),
    );
  }
}
