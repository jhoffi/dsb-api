import 'dart:convert';
import 'package:dsb_api/src/api/exceptions.dart';
import 'package:dsbuntis/dsbuntis.dart' as dsb;
import 'package:dsb_api/src/api/post.dart';

Future<Map> getData(String username, String password) async {
  try {
    var data = await dsb.dsbGetData(username, password, httpPost);
    return jsonDecode(data);
  } catch (e) {
    throw DSBQueryException(error: e);
  }
}

Future<bool> checkCredentials(String username, String password) async {
  try {
    var result = await dsb.dsbCheckCredentials(username, password, httpPost);
    return result == null;
  } catch (e) {
    throw DSBQueryException(error: e);
  }
}