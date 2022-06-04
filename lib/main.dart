import 'package:flutter/material.dart';
import 'package:sigarraio/UI/welcomepage.dart';

import 'UI/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'SigarraIO';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home : WelcomePage(),
    );
  }
}


