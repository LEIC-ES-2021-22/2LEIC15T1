import 'Course.dart';

class Profile {
  final String name;
  final String email;
  List<Course> courses;

  Profile(
      String name,
      String email,
      List<Course> courses
      ) {
    this.name = name;
    this.email = email;
    this.courses = courses;
  }
}