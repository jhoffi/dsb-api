import 'package:dsb_api/src/models/substitute.dart';

class DSBTimeTableDay {
    final String formattedDate;
    final List<DSBSubstitute> substitutes;

    DSBTimeTableDay(this.formattedDate, this.substitutes);
}