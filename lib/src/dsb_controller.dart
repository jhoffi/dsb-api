// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:dsb_api/src/models/document.dart';
import 'package:dsb_api/src/models/school_class.dart';
import 'package:dsb_api/src/models/school_day.dart';
import 'package:dsb_api/src/models/subject.dart';
import 'package:dsb_api/src/models/substitute.dart';
import 'package:dsb_api/src/models/text_news.dart';
import 'package:dsb_api/src/models/timetable_day.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:intl/intl.dart';
import 'package:dsb_api/src/api/api.dart';

class DSBController {
  final _dateFormat = DateFormat('dd.MM.yyyy HH:mm');
  final _baseUrl = 'https://light.dsbcontrol.de/';

  Set<String> _missingSubjects = {};
  API api;

  DSBController(String username, String password) {
    api = API(username, password);
  }

  static Future<bool> checkCredentials(String username, String password) async {
    var api = API(username, password);
    return await api.getAuthToken() != null;
  }  

  //Future<bool> checkCredentials() async => await api.getAuthToken() != null;
  Future<List<DSBTextNews>> getTextNews() async {
    var rawNews = await api.getNews();
    if (rawNews == null) return null;
    return rawNews.map((item) => DSBTextNews(item['Title'], item['Detail'].replaceAll('\n', ''), _dateFormat.parse(item['Date']), item['Date'])).toList();
  }

  Future<List<DSBDocument>> getDocuments() async {
    var rawDocuments = await api.getDocuments();
    if (rawDocuments == null) return null;
    return rawDocuments.map((item) => DSBDocument(item['Title'], item['Childs'][0]['Detail'], _dateFormat.parse(item['Date']), item['Date'])).toList();
  }

  Future<List<DSBTimetableDay>> getTimeTables() async {
    var timetables = await api.getTimetables();
    if (timetables == null || timetables.isEmpty) return null;
    List timetable = timetables[0]['Childs'];
    var days = await Future.wait(timetable.map((day) async {
      var ttDay = await _webscrapTable(day['Detail']);
      ttDay.updateDate = _dateFormat.parse(day['Date']);
      ttDay.formattedUpdateDate = day['Date'];
      return ttDay;
    }));
    return days;
  }

  List<DSBSubstitute> filterSubstitutesByClass(List<DSBSubstitute> substitutes, DSBSchoolClass dsbClass) {
    var resultSubs = <DSBSubstitute>[];
    for (var substitute in substitutes) {
      for (var schoolClass in substitute.schoolClass) {
        if(schoolClass.className == dsbClass.className.toUpperCase() && schoolClass.grade == dsbClass.grade) {
          resultSubs.add(
            DSBSubstitute(
              [schoolClass], 
              substitute.lessons, 
              substitute.substitute, 
              substitute.subject, 
              substitute.room, 
              substitute.substituteText,
              substitute.substituteRaw,
              substitute.subjectRaw,
            )
          );
        }
      }
    }
    return resultSubs.isNotEmpty ? resultSubs : null;
  }

  List<String> getMissingSubjects() {
    return _missingSubjects.toList();
  }

  Future<DSBTimetableDay> _webscrapTable(String url) async {
    var dateFormat = DateFormat('dd.MM.yyyy');
    var path = url.replaceAll(_baseUrl, '');
    final webScraper = WebScraper(_baseUrl);
    if(!(await webScraper.loadWebPage(path))) return null;
    var entries = webScraper.getElement('table.mon_list > tbody > tr > td', []);
    var substitutes = <DSBSubstitute>[];
    if(entries != null && entries.isNotEmpty && entries.length > 1) {
      for (var i = 0; i < entries.length; i = i + 6) {
        String room = entries[i + 3]['title'];
        substitutes.add(DSBSubstitute(
          _translateClass(entries[i]['title']),
          _translateLessons(entries[i + 1]['title']), //stunden
          _translateDSBSubject(entries[i + 2]['title']),
          _translateDSBSubject(entries[i + 4]['title']),
          room != '---' ? room : '-', //raum
          entries[i + 5]['title'],
          entries[i + 2]['title'],
          entries[i + 4]['title'],
          ),
        );
        
      }
    }
    var formattedDate = webScraper.getElement('div.mon_title', [])[0]['title'].split(' ')[0];
    var date = dateFormat.parse(formattedDate);
    return DSBTimetableDay(substitutes, date, formattedDate, _dateToSchoolDay(date));
  }

  List<DSBSchoolClass> _translateClass(String name) {
    var check = (String name) {
      if(name == '11' || name == '12') {
        return DSBSchoolClass(int.parse(name), '');
      } else {
        var grade = int.tryParse(name.substring(0, name.length - 1));
        if (grade == null) { //Wrong Format
          return DSBSchoolClass(-1, name);
        }
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

  DSBSubjectData _translateDSBSubject(String subject) {
    subject = subject.toLowerCase();

    var seniorGradeIndex1 = -1;
    var seniorGradeIndex2 = -1;

    if (subject == '---' || subject.isEmpty || subject.codeUnitAt(0) == 160) return DSBSubjectData(DSBSubjectType.entfaellt, -1, -1);


    if (subject.length >= 3) {
      seniorGradeIndex1 = int.tryParse(subject.substring(0, 1));
      seniorGradeIndex2 = int.tryParse(subject.substring(subject.length-1, subject.length));

      if (seniorGradeIndex1 != null && seniorGradeIndex2 != null) subject = subject.substring(1, subject.length-1);
      else {
        seniorGradeIndex1 = -1;
        seniorGradeIndex2 = -1;
      }
    }
    var dsbSubject = getSubjectById(subject);

    if (dsbSubject == null) {
      _missingSubjects.add(subject);
      return DSBSubjectData(DSBSubjectType.unbekannt, seniorGradeIndex1, seniorGradeIndex2);
    }

    return DSBSubjectData(dsbSubject.subjectType, seniorGradeIndex1, seniorGradeIndex2);
  }

  List<int> _translateLessons(String lessons) {
    var parsedLesson = int.tryParse(lessons);
    if (parsedLesson != null) {
      return [parsedLesson];
    } else {
      List hoursDiffString = lessons.split(' - ');
      if(hoursDiffString.length != 2) return null; //return if didn't return two values
      var hoursDiff = hoursDiffString.map((e) => int.parse(e)).toList();
      var diff = hoursDiff[1] - hoursDiff[0] + 1;
      var start = hoursDiff[0];
      var hours = <int>[];
      for (var i = 0; i < diff; i++) {
        hours.add(start + i);
      }
      return hours.isNotEmpty ? hours : null;
    }
  }

  SchoolDay _dateToSchoolDay(DateTime date) {
    var weekday = date.weekday;
    if(weekday == 1) return SchoolDay.monday;
    if(weekday == 2) return SchoolDay.tuesday;
    if(weekday == 3) return SchoolDay.wednesday;
    if(weekday == 4) return SchoolDay.thursday;
    if(weekday == 5) return SchoolDay.friday;
    return null;
  }
}