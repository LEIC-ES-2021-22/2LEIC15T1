import 'package:flutter_test/flutter_test.dart';
import 'package:sigarraio/model/Course.dart';
import 'package:sigarraio/model/CourseUnit.dart';

void main() {
  group('Course unit Constructor', () {
    final unit = CourseUnit(id: 1, code: "001", abbreviation: "abbreviation", name: "name", curricularYear: 1, semesterCode: "semesterCode", semesterName: "semesterName", grade: "grade", ectsGrade: "ectsGrade", ects: 1);
    test('Unit id Test', () {
      expect(unit.id, 1);
    });
    test('Unit code Test', () {
      expect(unit.code, "001");
    });
    test('Unit abbreviation Test', () {
      expect(unit.abbreviation, "abbreviation");
    });
    test('Unit abbreviation Test', () {
      expect(unit.abbreviation, "abbreviation");
    });
    test('Unit name Test', () {
      expect(unit.name, "name");
    });
    test('Unit curricular year Test', () {
      expect(unit.curricularYear, 1);
    });
    test('Unit semester code Test', () {
      expect(unit.semesterCode, "semesterCode");
    });
    test('Unit semester name Test', () {
      expect(unit.semesterName, "semesterName");
    });
    test('Unit grade Test', () {
      expect(unit.grade, "grade");
    });
    test('Unit grade Test', () {
      expect(unit.ectsGrade, "ectsGrade");
    });
    test('Unit grade Test', () {
      expect(unit.ects, 1);
    });


  });


}