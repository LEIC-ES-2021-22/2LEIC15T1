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
          title: const Text('Academic Pathway',style:TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: _Body()
      ),
    );
  }
}

class _Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container( // CONTAINER 1
          margin: const EdgeInsets.only(top:30,left:20),
          alignment: Alignment.centerLeft,
          child: const Text('Current Semester',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        ),
        Container( // CONTAINER 2
          margin: const EdgeInsets.all(15.0),
          padding : const EdgeInsets.symmetric(
            vertical:1.0,
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.50),
            boxShadow: [
              BoxShadow(
                color:Colors.grey,
                offset:const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius:10.0,
                spreadRadius:2.0,
              )
            ]
          ),
          child: Column(
            children: <Widget> [
              Row(

                children: <Widget>[
                  Expanded(child:Center(child: FlatButton(onPressed: null,child:Text('Sistemas Operativos'),))),
                  Expanded(child:Center(child: Text('aprovado'),)),
                  Expanded(child:Center(child: Text('14'),)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child:Center(child: FlatButton(onPressed: null,child:Text('Engenharia de Software'),))),
                  Expanded(child:Center(child: Text('aprovado'),)),
                  Expanded(child:Center(child: Text('20'),)),
                ],
              )
            ],
          ),
        ),
        Container( // CONTAINER 3
          margin: const EdgeInsets.only(top:30,left:20),
          alignment: Alignment.centerLeft,
          child: const Text('Academic Results',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        ),
        Container( // CONTAINER 4
          margin: const EdgeInsets.all(15.0),
          padding : const EdgeInsets.symmetric(
            vertical:1.0,
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.50),
              boxShadow: [
                BoxShadow(
                  color:Colors.grey,
                  offset:const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius:10.0,
                  spreadRadius:2.0,
                )
              ]
          ),
          child: Column(
            children: <Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new FlatButton(onPressed: null, child: Text('1st Year')),
                  new FlatButton(onPressed: null, child: Text('2nd Year')),
                  new FlatButton(onPressed: null, child: Text('3rd Year')),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom:15),
                child: Divider(
                  color: Colors.black,
                  height: 1,
                  thickness: 0.8,
                  indent:40,
                  endIndent: 40,
                ),
              ),
              Row(

                children: <Widget>[
                  Expanded(child:Center(child: Text('carlossssss'),)),
                  Expanded(child:Center(child: Text('carlossssss'),)),
                  Expanded(child:Center(child: Text('carlossssss'),)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child:Center(child: Text('carlossssss'),)),
                  Expanded(child:Center(child: Text('carlossssss'),)),
                  Expanded(child:Center(child: Text('carlossssss'),)),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
  
}