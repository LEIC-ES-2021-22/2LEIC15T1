import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'Course.dart';


@JsonSerializable()
class Profile{
   String name;
   String email;
  List<Course> courses;

  Profile({
    this.name = '',
    this.email = '',
    required this.courses});

   /// Creates a new instance from a JSON object.
   static Profile fromResponse(dynamic response) {
     final responseBody = json.decode(response.body);
     final List<Course> courses = <Course>[];
     for (var c in responseBody['cursos']) {
       courses.add(Course.fromJson(c));
     }
     return Profile(
         name: responseBody['nome'],
         email: responseBody['email'],
         courses: courses);
   }
    /*
   List<Tuple2<String, String>> keymapValues() {
     return [
       Tuple2('name', this.name),
       Tuple2('email', this.email)
     ];
   }*/
}