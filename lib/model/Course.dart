class Course {
  final int id;
  final String name;
  final String abbreviation;
  final String currYear;
  final int firstEnrollment;
  final String state;

  Course (
      int id,
      String name,
      String abbreviation,
      String currYear,
      int firstEnrollment,
      String state
      ){
    this.id = id;
    this.name = name;
    this.abbreviation = abbreviation;
    this.currYear = currYear;
    this.firstEnrollment = firstEnrollment;
    this.state = state;
  }
}