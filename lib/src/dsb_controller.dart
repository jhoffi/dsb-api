import 'package:dsb_api/src/models/news.dart';
import 'package:dsb_api/src/models/school_class.dart';
import 'package:dsb_api/src/models/school_day.dart';
import 'package:dsb_api/src/models/subject.dart';
import 'package:dsb_api/src/models/substitute.dart';
import 'package:dsb_api/src/models/text_news.dart';
import 'package:dsb_api/src/models/timetable_day.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:intl/intl.dart';
import 'package:dsb_api/src/api/api.dart' as dsb_api;

class DSBController {
  String baseUrl;
  final String _dateFormat = 'dd.MM.yyyy HH:mm';
  final String username;
  final String password;

  DSBController(this.username, this.password, { this.baseUrl = 'https://app.dsbcontrol.de' });

  static Future<bool> checkCredentials(String username, String password) => dsb_api.checkCredentials(username, password);

  Future<Map> getData() => dsb_api.getData(username, password);

  List<DSBTextNews> getTextNews(Map data) {
    var news = <DSBTextNews>[];
    List items = data['ResultMenuItems'].firstWhere((item) => item['Title'].toLowerCase() == 'inhalte')['Childs'];
    var newsIndex = items.indexWhere((e) => e['MethodName'].toLowerCase() == 'news');
    if(newsIndex == -1) return news;
    List rawNews = items[newsIndex]['Root']['Childs'];
    var dateFormat = DateFormat(_dateFormat);
    news = rawNews.map((item) => DSBTextNews(item['Title'], item['Detail'].replaceAll('\n', ''), dateFormat.parse(item['Date']), item['Date'])).toList();
    return news;
  }

  List<DSBNews> getNews(Map data) {
    var news = <DSBNews>[];
    List items = data['ResultMenuItems'].firstWhere((item) => item['Title'].toLowerCase() == 'inhalte')['Childs'];
    var newsIndex = items.indexWhere((e) => e['MethodName'].toLowerCase() == 'tiles');
    if(newsIndex == -1) return news;
    List rawNews = items[newsIndex]['Root']['Childs'];
    var dateFormat = DateFormat(_dateFormat);
    news = rawNews.map((item) => DSBNews(item['Title'], item['Childs'][0]['Detail'], dateFormat.parse(item['Date']), item['Date'])).toList();
    return news;
  }

  Future<List<DSBTimetableDay>> getTimeTables(Map data) async {
    var days = <DSBTimetableDay>[];
    List items = data['ResultMenuItems'].firstWhere((item) => item['Title'].toLowerCase() == 'inhalte')['Childs'];
    var timetableIndex = items.indexWhere((e) => e['MethodName'].toLowerCase() == 'timetable');
    if(timetableIndex == -1) return days;
    List timetables = items[timetableIndex]['Root']['Childs'][0]['Childs'];
    var dateFormat = DateFormat(_dateFormat);
    days = await Future.wait(timetables.map((day) async {
      var ttDay = await _webscrapTable(day['Detail']);
      ttDay.updateDate = dateFormat.parse(day['Date']);
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
              substitute.substituteText
            )
          );
        }
      }
    }
    return resultSubs.isNotEmpty ? resultSubs : null;
  }

  Future<DSBTimetableDay> _webscrapTable(String url) async {
    var dateFormat = DateFormat('dd.MM.yyyy');
    var path = url.replaceAll(baseUrl, '');
    final webScraper = WebScraper(baseUrl);
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
          entries[i + 5]['title'])
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
    if(weekday == 6 || weekday == 7) return null;
  }
}