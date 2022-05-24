import 'package:flutter/material.dart';
import 'NavBar.dart';
class PersonalSchedule extends StatefulWidget {
  const PersonalSchedule({Key? key}) : super(key: key);

  @override
  State<PersonalSchedule> createState() => PersonalScheduleStatus();
}

class PersonalScheduleStatus extends State<PersonalSchedule> {

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
          child: Text('Personal Schedule'),
        ),
      ),
    );
  }
}