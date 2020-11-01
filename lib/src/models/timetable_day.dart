import 'package:dsb_api/src/models/substitute.dart';

class DSBTimetableDay {
    final String formattedDate;
    final DateTime date;
    final List<DSBSubstitute> substitutes;

    DSBTimetableDay(this.substitutes, this.date, this.formattedDate);
}