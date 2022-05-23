class Lecture {
  static var dayName = [
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
    'Sábado',
    'Domingo'
  ];
  String subject;
  String startTime;
  String endTime;
  String typeClass;
  String room;
  String teacher;
  String classNumber;


  Lecture (
      String subject,
      String typeClass,
      String room,
      String teacher,
      String classNumber,
      int startTimeHours,
      int startTimeMinutes,
      int endTimeHours,
      int endTimeMinutes) {
    this.subject = subject;
    this.typeClass = typeClass;
    this.room = room;
    this.teacher = teacher;
    this.classNumber = classNumber;
    this.startTime = startTimeHours.toString().padLeft(2, '0') + 'h' +
        startTimeMinutes.toString().padLeft(2, '0');
    this.endTime = endTimeHours.toString().padLeft(2, '0') + 'h' +
        endTimeMinutes.toString().padLeft(2, '0');
  }
}