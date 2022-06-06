import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigarraio/UI/homepage.dart';


import 'login.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super (key : key);

  @override
  State<StatefulWidget> createState() => _WelcomePageState();

}

class _WelcomePageState extends State<WelcomePage>{

  @override
  void initState() {
    super.initState();
    verifyToken().then((value){
      if (value) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyStatefulWidgeta(),),);
      }
      else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPageView(),),);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child : CircularProgressIndicator(),
      )
    );
  }

  Future<bool> verifyToken() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    if (sharedPreference.get('token') != null){
      return true;
    }
    else {return false;}
  }

}