import 'package:flutter_test/flutter_test.dart';
import 'package:sigarraio/model/Course.dart';

void main() {
  group('Course Constructor', () {
    final course = Course(id: 1,name: "teste", firstEnrollment: 1,abbreviation: "testeAbb",currYear: "2020",state: "0");
    test('Course id Test', () {
      expect(course.id, 1);
    });
    test('Course name Test', () {
      expect(course.name, "teste");
    });
    test('Course id Test', () {
      expect(course.firstEnrollment, 1);
    });
    test('Course id Test', () {
      expect(course.abbreviation, "testeAbb");
    });
    test('Course id Test', () {
      expect(course.currYear, "2020");
    });
    test('Course id Test', () {
      expect(course.state, "0");
    });
  });

  group('Testing to Map', () {
    final course = Course(id: 1,name: "teste", firstEnrollment: 1,abbreviation: "testeAbb",currYear: "2020",state: "0");
    Map<String,dynamic> map = course.toMap();
    test('ID map test', () {
      expect(map["id"], course.id);
    });
    test('Name map test', () {
      expect(map["firstEnrollment"], course.firstEnrollment);
    });
    test('First Enrollment map test', () {
      expect(map["abbreviation"], course.abbreviation);
    });
    test('Abbreviation  map test', () {
      expect(map["currYear"], course.currYear);
    });
    test('Current Year map test', () {
      expect(map["state"], course.state);
    });
  });

}