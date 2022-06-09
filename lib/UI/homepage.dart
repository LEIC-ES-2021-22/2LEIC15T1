import 'package:flutter/material.dart';
import '../controller/login_action.dart';
import '../model/CourseUnit.dart';
import '../model/Profile.dart';
import 'NavBar.dart';
import 'utils.dart';
import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<List<Event>> _selectedEvents = ValueNotifier([]);

  Map<DateTime, List<Event>> events ={};

  List<CourseUnit> ucsFiltered = <CourseUnit>[];

  String currentSemester = '';

  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await loadEvents() ;
      WidgetsBinding.instance!.addPostFrameCallback((_) => _onDaySelected(kToday));
    });
    getCurrentCourseUnits().then((data) {
      setState(() {
        if (kToday.month >= 2 && kToday.month <=8) {
          currentSemester = '2S';
        }
        else {
          currentSemester = '1S';
        }
        for (var course in data) {
          for (var uc in course['inscricoes']) {
            if (CourseUnit.fromJson(uc).semesterCode == currentSemester){
              ucsFiltered.add(CourseUnit.fromJson(uc));
            }
          }
        }
      });
    });
  }

  // Using a `LinkedHashSet` is recommended due to equality comparison override
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );



  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[kToday] ?? [];
  }

  List<Event> _getEventsForDays(Set<DateTime> days) {
    return [
      for (final d in days) ..._getEventsForDay(kToday),
    ];
  }

  void _onDaySelected(DateTime selectedDay) {
    setState(() {
      _selectedDays.add(selectedDay);
    });
    _selectedEvents.value = _getEventsForDays(_selectedDays);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SigarIO',
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: const Text('DashBoard',style:TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top:20,left:20,bottom:5.0),
              alignment: Alignment.centerLeft,
              child: const Text('Current Semester',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ),
            Container(
                child: ucsFiltered.length > 0
                    ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: ucsFiltered.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: EdgeInsets.all(8),
                          child: Row(children: <Widget>[
                            Expanded(child: Center(child: Text(ucsFiltered[index].code))),
                            Expanded(child: Center(child: Text(ucsFiltered[index].name, textAlign: TextAlign.left,
                            ))),
                            Expanded(child: Center(child: Text(ucsFiltered[index].grade, style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                          ]));
                    })
                    : Center(
                  child: CircularProgressIndicator(),
                )),
            Container(
              margin: const EdgeInsets.only(top:30,left:20),
              alignment: Alignment.centerLeft,
              child: const Text('Today\'s Schedule',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8.0),
            FutureBuilder<Map<DateTime, List<Event>>>(
                future: loadEvents(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    events = snapshot.data!;
                    return Expanded(
                      child: ValueListenableBuilder<List<Event>>(
                        valueListenable: _selectedEvents,
                        builder: (context, value, _) {
                          return ListView.builder(
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: ListTile(
                                  onTap: () => print('${value[index]}'),
                                  title: Text('${value[index]}'),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                }
            ),

          ],
        ),
      ),
    );
  }
}

