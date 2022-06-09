
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Course {
  final int id;
  final String name;
  final String abbreviation;
  final String currYear;
  final int firstEnrollment;
  final String state;

  Course({
    required int this.id,
    String this.name ='',
    String this.abbreviation='',
    String this.currYear='',
    required int this.firstEnrollment,
    String this.state = ''});

  static Course fromJson(dynamic data) {
    return Course(
        id: data['cur_id'],
        name: data['cur_nome'],
        currYear: data['ano_curricular'],
        firstEnrollment: data['fest_a_lect_1_insc']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'abbreviation': abbreviation,
      'currYear': currYear,
      'firstEnrollment': firstEnrollment,
      'state': state
    };
  }
}