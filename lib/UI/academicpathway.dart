import 'package:flutter/material.dart';
import 'package:sigarraio/controller/login_action.dart';
import '../model/CourseUnit.dart';
import '../model/Profile.dart';
import 'NavBar.dart';

class AcademicPathway extends StatefulWidget {
  const AcademicPathway({Key? key}) : super(key: key);

  @override
  State<AcademicPathway> createState() => AcademicPathwayStatus();
}

class AcademicPathwayStatus extends State<AcademicPathway> {
  List<CourseUnit> ucs = <CourseUnit>[];
  bool isSearching = false;

  @override
  void initState() {
    /*getCurrentCourseUnits().then((data) {
      setState(() {
        for (var course in data) {
          for (var uc in course['inscricoes']) {
            ucs.add(CourseUnit.fromJson(uc));
          }
        }
      });
    });

     */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SigarIO',
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title:
              Text('Academic Pathway', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ]),
          child: Column(children: [
            Container(
                child: ucs.length > 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: ucs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              padding: EdgeInsets.all(8),
                              child: Row(children: <Widget>[
                                Expanded(child: Center(child: Text(ucs[index].code))),
                                Expanded(child: Center(child: Text(ucs[index].name, textAlign: TextAlign.left,
                                ))),
                                Expanded(child: Center(child: Text(ucs[index].grade, style: TextStyle(fontWeight: FontWeight.bold),
                                ))),
                              ]));
                        })
                    : Center(
                        child: CircularProgressIndicator(),
                      ))
          ]),
        ),
      ),
    );
  }
}
