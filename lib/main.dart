import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'UI/login.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'SigarraIO';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home : LoginPageView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

