import 'package:dsb_api/dsb_api.dart';

class DSBLesson {
  final DSBSchoolClass schoolClass;
  final List<int> lessons;
  final DSBSubject substitute;
  final DSBSubject subject;
  final String room;
  final String substituteText;

  DSBLesson(this.schoolClass, this.lessons, this.substitute, this.subject, this.room, this.substituteText);
}