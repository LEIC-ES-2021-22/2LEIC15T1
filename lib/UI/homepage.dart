import 'package:flutter/material.dart';
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

  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await loadEvents() ;
      WidgetsBinding.instance!.addPostFrameCallback((_) => _onDaySelected(kToday));
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
            Container(
              margin: const EdgeInsets.only(top:30,left:20),
              alignment: Alignment.centerLeft,
              child: const Text('Current Semester',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding : const EdgeInsets.symmetric(
                vertical:1.0,
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.50),
                  boxShadow: const [
                    BoxShadow(
                      color:Colors.grey,
                      offset:Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius:10.0,
                      spreadRadius:1.0,
                    )
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

