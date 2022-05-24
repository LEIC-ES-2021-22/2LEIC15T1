import 'package:flutter/material.dart';
import 'NavBar.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => SettingsStatus();
}

class SettingsStatus extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SigarIO',
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: const Text('SigarIO'),

        ),
        body: const Center(
          child: Text('Settings'),
        ),
      ),
    );
  }
}