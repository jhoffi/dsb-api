import 'package:dsb_api/dsb_api.dart';

class DSBLesson {
  final int lesson;
  final DSBSubject substitute;
  final DSBSubject subject;
  final String room;
  final String substituteText;

  DSBLesson(this.lesson, this.substitute, this.subject, this.room, this.substituteText);
}