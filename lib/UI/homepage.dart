import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'utils.dart';
import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

class MyStatefulWidgeta extends StatefulWidget {
  const MyStatefulWidgeta({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidgeta> createState() => _MyStatefulWidgetStatea();
}

class _MyStatefulWidgetStatea extends State<MyStatefulWidgeta> {
  final ValueNotifier<List<Event>> _selectedEvents = ValueNotifier([]);

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _onDaySelected(kToday));
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
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForDays(Set<DateTime> days) {
    return [
      for (final d in days) ..._getEventsForDay(d),
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
          title: const Text('DashBoard'),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top:30,left:20),
              alignment: Alignment.centerLeft,
              child: const Text('Schedule',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
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

            Container(
              margin: const EdgeInsets.only(top:30,left:20),
              alignment: Alignment.centerLeft,
              child: const Text('Events Highlights',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8.0),
            Expanded(
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
            ),

            Container(
              margin: const EdgeInsets.only(top:30,left:20),
              alignment: Alignment.centerLeft,
              child: const Text('Academic Highlights',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
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

