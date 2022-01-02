import 'package:dsb_api/dsb_api.dart';

void main() async {
  if (!(await DSBController.checkCredentials('username', 'password'))) return; //should return FALSE because of wrong username & password
  var dsb = DSBController('username', 'password');
  var timetables = await dsb.getTimeTables();
  var textNews = await dsb.getTextNews();
  var documents = await dsb.getDocuments();
  print(timetables[0].substitutes.where((e) => e.substitute.subject == DSBSubjectType.entfaellt).toList());
}
