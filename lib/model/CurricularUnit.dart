class CurricularUnit {
  int id;
  String code;
  String abbreviation;
  String name;
  int curricularYear;
  String semesterCode;
  String semesterName;
  String type;
  String status;
  String grade;
  String ectsGrade;
  num ects;

  CurricularUnit({this.id,
    this.code,
    this.abbreviation,
    this.name,
    this.curricularYear,
    this.semesterCode,
    this.semesterName,
    this.type,
    this.status,
    this.grade,
    this.ectsGrade,
    this.ects});
}