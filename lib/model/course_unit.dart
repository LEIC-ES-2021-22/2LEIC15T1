
import 'package:json_annotation/json_annotation.dart';

part 'course_unit.g.dart';

@JsonSerializable()
class CourseUnit {
  int id;
  String code;
  String abbreviation;
  String name;
  int curricularYear;
  int occurrId;
  String semesterCode;
  String semesterName;
  String type;
  String status;
  String grade;
  String ectsGrade;
  String result;
  num ects;

  CourseUnit({required this.id,
    required this.code,
    required this.abbreviation,
    required this.name,
    required this.curricularYear,
    required this.occurrId,
    required this.semesterCode,
    required this.semesterName,
    required this.type,
    required this.status,
    required this.grade,
    required this.ectsGrade,
    required this.result,
    required this.ects});

  factory CourseUnit.fromJson(Map<String,dynamic> data) => _$CourseUnitFromJson(data);

  Map<String,dynamic> toJson() => _$CourseUnitToJson(this);
}