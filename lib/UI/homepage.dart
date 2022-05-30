import 'package:flutter/material.dart';
import 'NavBar.dart';

class MyStatefulWidgeta extends StatefulWidget {
  const MyStatefulWidgeta({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidgeta> createState() => _MyStatefulWidgetStatea();
}

class _MyStatefulWidgetStatea extends State<MyStatefulWidgeta> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SigarIO',
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: const Text('DashBoard'),
        ),
        body: const Center(
          child: Text('homepage'),
        ),
      ),
    );
  }
}
