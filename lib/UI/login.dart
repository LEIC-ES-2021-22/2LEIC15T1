
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/login_action.dart';
import '../model/Profile.dart';
import '../model/Session.dart';
import 'homepage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:convert';




class LoginPageView extends StatefulWidget {
  LoginPageView({Key? key}) : super(key:key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}


class _LoginPageViewState extends State<LoginPageView>  {



  TextEditingController nameController = TextEditingController();
  TextEditingController _pass = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final snackBar = SnackBar(content : Text('Credenciais incorretas',textAlign: TextAlign.center,),backgroundColor: Colors.redAccent, );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login',style:TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child:  Form(
              key: _formKey,
              child:ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'SigarraIO',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      maxLines: 1,
                      obscureText: false,
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child:
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      maxLines: 1,
                      obscureText: true,
                      controller: _pass,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),

                  Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary : Colors.black),
                        child: const Text('Login'),
                        onPressed: () async {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (_formKey.currentState!.validate()){
                            bool loggedIn = await login(nameController.text,_pass.text);
                            bool loggedI = true;
                            if (!currentFocus.hasPrimaryFocus){
                              currentFocus.unfocus();
                            }
                            if (loggedIn){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),),);
                            }
                            else {
                              _pass.clear();
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          }

                        },
                      )
                  ),
                ],
              ))),
    );
  }
}

