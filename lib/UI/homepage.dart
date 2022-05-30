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
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  spreadRadius:2.0,
                )
              ]
          ),
        ),
      ],
    );
  }

}
