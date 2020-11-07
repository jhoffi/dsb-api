import 'package:dsb_api/src/models/school_day.dart';
import 'package:dsb_api/src/models/substitute.dart';

class DSBTimetableDay {
    String formattedUpdateDate;
    DateTime updateDate;
    String formattedDate;
    DateTime date;
    List<DSBSubstitute> substitutes;
    SchoolDay day;

    DSBTimetableDay(this.substitutes, this.date, this.formattedDate, this.day, {this.formattedUpdateDate, this.updateDate});
}