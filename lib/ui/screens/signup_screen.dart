import 'package:chatapp/providers/auth_provider.dart';
import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/style.dart';
import 'package:chatapp/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_screen.dart';

class SignUpScreen extends StatefulWidget {
  static final routeName = 'register';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _key = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static bool isEmail(String em) {
    String p =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }
  TextEditingController _password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context);
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white30,
      body:/* Provider.of<AuthProvider>(context).busy ? CircularProgressIndicator() :*/ ListView(
        children: <Widget>[
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          Center(
              child: Text(
            'Sign Up',
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
                      initialValue: '${provider.user.name}',
                      decoration: Style.inputDecoration("Full Name"),
                      validator: (v) {
                        if (v.isEmpty) {
                          return 'input required';
                        } else
                          return null;
                      },
                      onSaved: (v){
                        provider.user.name = v.trim();
                      },
                    ),
                    TextFormField(
                      initialValue: '${provider.user.email}',
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
                        provider.user.email = v.trim();
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: _password,
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
                        provider.user.password = v.trim();
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: Style.inputDecoration("Password Confirm"),
                      validator: (v) {
                        if (v.isEmpty) {
                          return 'input required';
                        } else if(v.trim() != _password.text.trim()){
                          return 'passswords not matched';
                        }
                          return null;
                      },
                    ),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: Container(
        child: PrimaryButton(
          onTap: () async{
            if(_key.currentState.validate()){
              _key.currentState.save();
              print('is validate');
              var result = await provider.register();
              if(result){
                print('done');
                Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
              }else {
                print("wtf");
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text(Provider.of<AuthProvider>(context).message),
                ));
              }
            }else {
              print('is not validate');
            }
          },
          child: Text(
            'Save',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 21),
          ),
        ),
      ),
    );
  }
}
