import 'package:flutter/material.dart';
import 'NavBar.dart';
class AcademicPathway extends StatefulWidget {
  const AcademicPathway({Key? key}) : super(key: key);

  @override
  State<AcademicPathway> createState() => AcademicPathwayStatus();
}

class AcademicPathwayStatus extends State<AcademicPathway> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SigarIO',
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: const Text('Academic Pathway'),

        ),
        body: const Center(
          child: Text('Academic Pathway'),
        ),
      ),
    );
  }
}