import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'Course.dart';


@JsonSerializable()
class User {
   String name;
   String email;
  List<Course> courses;

  User({
    this.name = '',
    this.email = '',
    required this.courses});

   static User fromJson(Map<String,dynamic> json) {
     final List<Course> courses = <Course>[];
     /*
     for (var c in json['cursos']) {
       print(c);
       courses.add(Course.fromJson(c));
     }
     */

     return User(
         name: json['nome'],
         email: json['email'],
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