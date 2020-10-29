import 'package:dsb_api/src/models/school_class.dart';
import 'package:dsb_api/src/models/subject.dart';

class DSBSubstitute {
  final List<DSBSchoolClass> schoolClass;
  final List<int> lessons;
  final DSBSubject newDSBSubject;
  final DSBSubject oldDSBSubject;
  final String room;
  final String text;

  DSBSubstitute(this.schoolClass, this.lessons, this.newDSBSubject, this.oldDSBSubject, this.room, this.text);
}