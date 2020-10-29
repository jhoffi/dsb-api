import 'package:dsb_api/src/models/substitute.dart';

class DSBTimeTableDay {
    final String formattedDate;
    final DateTime date;
    final List<DSBSubstitute> substitutes;

    DSBTimeTableDay(this.substitutes, this.date, this.formattedDate);
}