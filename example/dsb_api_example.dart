import 'package:dsb_api/dsb_api.dart';

void main() async {
  var dsb = DSBController('username', 'password');
  if (!(await dsb.checkCredentials())) return; //should return FALSE because of wrong username & password
  var timetables = await dsb.getTimeTables();
  var textNews = await dsb.getTextNews();
  var documents = await dsb.getDocuments();
  print(timetables[0].substitutes.where((e) => e.substitute == DSBSubject.entfaellt).toList());
}
