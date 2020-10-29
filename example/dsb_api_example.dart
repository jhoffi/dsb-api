import 'package:dsb_api/dsb_api.dart';

void main() async {
  var dsb = DSBController('username', 'password');
  var data = await dsb.getData();
  var timetables = await dsb.getTimeTables(data);
  var news = dsb.getNews(data);
  var textNews = dsb.getTextNews(data);
  print(timetables[0].substitutes.where((e) => e.newDSBSubject == DSBSubject.entfaellt).toList());
}
