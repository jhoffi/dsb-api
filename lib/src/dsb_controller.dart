import 'package:dsb_api/src/models/school_class.dart';
import 'package:dsb_api/src/models/subject.dart';
import 'package:dsb_api/src/models/substitute.dart';
import 'package:dsb_api/src/models/timetable_day.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:dsb_api/src/api/dsb_api.dart' as dsb_api;

//TODO: Date
class DSBController {
  String baseUrl;
  final String username;
  final String password;

  DSBController(this.username, this.password, { String baseUrl = 'https://app.dsbcontrol.de' }) {
    this.baseUrl = baseUrl;
  }

  Future<Map> dsbGetData() async {
    return dsb_api.getData(username, password);
  }

  Future<List<DSBTimeTableDay>> dsbGetTimeTables(Map data) async {
    var days = <DSBTimeTableDay>[];
    List items = data['ResultMenuItems'].firstWhere((item) => item['Title'].toLowerCase() == 'inhalte')['Childs'];
    var timetableIndex = items.indexWhere((e) => e['MethodName'].toLowerCase() == 'timetable');
    List timetables = items[timetableIndex]['Root']['Childs'][0]['Childs'];
    if(timetableIndex != -1) days = await Future.wait(timetables.map((day) async => DSBTimeTableDay(day['Date'], await _webscrapTable(day['Detail']))).toList());
    return days;
  }

  Future<List<DSBSubstitute>> dsbGetSubstitutesByClass(DSBSchoolClass dsbClass) {
    //TODO: ADD COMMAND
    return null;
  }

  Future<List<DSBSubstitute>> _webscrapTable(String url) async {
    var path = url.replaceAll(baseUrl, '');
    final webScraper = WebScraper(baseUrl);
    if(!(await webScraper.loadWebPage(path))) return null;
    var entries = webScraper.getElement('table.mon_list > tbody > tr > td', []);
    var substitutes = [];
    for (var i = 0; i < entries.length; i = i + 6) {
      substitutes.add(DSBSubstitute(
        _translateClass(entries[i]['title']),
        _translateLessons(entries[i + 1]['title']), //stunden
        _translateDSBSubject(entries[i + 2]['title']),
        _translateDSBSubject(entries[i + 4]['title']),
        entries[i + 3]['title'], //raum
        entries[i + 5]['title'])
      );
    }
    return substitutes;
  }

  List<DSBSchoolClass> _translateClass(String name) {
    var check = (String name) {
      if(name == '11' || name == '12') {
        return DSBSchoolClass(int.parse(name), '');
      } else {
        var grade = int.parse(name.substring(0, name.length - 1));
        var className = name.substring(name.length - 1).toUpperCase();
        return DSBSchoolClass(grade,className);
      }
    };

    if(name.contains(', ')) {
      var classes = name.split(', ');
      return classes.map((cl) => check(cl)).toList();
    } else {
      return [check(name)];
    }
  }

  DSBSubject _translateDSBSubject(String subject) {
    subject = subject.toLowerCase();
    if(!dsbSubjectMap.containsKey(subject)) print({ 'missing subject': subject});
    return dsbSubjectMap.containsKey(subject) ? dsbSubjectMap[subject] : DSBSubject.unbekannt;
  }

  List<int> _translateLessons(String lessons) {
    var parsedLesson = int.parse(lessons, onError: (source) => null,);
    if(parsedLesson != null) {
      return [parsedLesson];
    } else {
      List hoursDiffString = lessons.split(' - ');
      if(hoursDiffString.length != 2) return null; //return if didn't return two values
      var hoursDiff = hoursDiffString.map((e) => int.parse(e, onError: (source) => 0,)).toList();
      var diff = hoursDiff[1] - hoursDiff[0] + 1;
      var start = hoursDiff[0];
      var hours = [];
      for (var i = 0; i < diff; i++) {
        hours.add(start + i);
      }
      return hours.isNotEmpty ? hours : null;
    }
  }
}