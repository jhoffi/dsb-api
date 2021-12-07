import 'package:dsb_api/src/models/school_class.dart';
import 'package:dsb_api/src/models/subject.dart';

class DSBSubstitute {
  final List<DSBSchoolClass> schoolClass;
  final List<int> lessons;
  final DSBSubjectData substitute;
  final DSBSubjectData subject;
  final String substituteRaw;
  final String subjectRaw;
  final String room;
  final String substituteText;

  DSBSubstitute(this.schoolClass, this.lessons, this.substitute, this.subject, this.room, this.substituteText, this.substituteRaw, this.subjectRaw);
}