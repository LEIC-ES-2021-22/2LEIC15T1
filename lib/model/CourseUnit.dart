
import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class CourseUnit {
  int id;
  String code;
  String abbreviation;
  String name;
  int curricularYear;
  String semesterCode;
  String semesterName;
  String grade;
  String ectsGrade;
  num ects;

  CourseUnit({required this.id,
    required this.code,
    required this.abbreviation,
    required this.name,
    required this.curricularYear,
    required this.semesterCode,
    required this.semesterName,
    required this.grade,
    required this.ectsGrade,
    required this.ects});


  static CourseUnit fromJson(dynamic data) {
    return CourseUnit(
        id: data['ucurr_id'],
        code: data['ucurr_codigo'],
        abbreviation: data['ucurr_sigla'],
        name: data['ucurr_nome'],
        curricularYear: data['ano'],
        semesterCode: data['per_codigo'],
        semesterName: data['per_nome'],
        grade: data['resultado_melhor'],
        ectsGrade: data['resultado_ects'],
        ects: data['creditos_ects']
    );
  }
}